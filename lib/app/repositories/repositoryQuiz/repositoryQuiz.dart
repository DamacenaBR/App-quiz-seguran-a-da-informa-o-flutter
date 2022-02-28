import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerHome/controllerHome.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerQuiz/controllerQuiz.dart';
import 'package:app_quiz_seguranca/app/model/pontuacaoUsuario.dart';
import 'package:app_quiz_seguranca/app/model/questoes.dart';
import 'package:app_quiz_seguranca/app/stores/quiz/storeQuiz/storeQuiz.dart';

class RepositoryQuiz {
  FirebaseFirestore _db;
  FirebaseAuth _auth;

  RepositoryQuiz() {
    if (_db == null && _auth == null) {
      _db = FirebaseFirestore.instance;
      _auth = FirebaseAuth.instance;
    }
  }

  //inicio metodos para salvar

  Future<bool> salvarPontuacaoUsuarioCompleto(ControllerQuiz controllerQuiz,
      ControllerHome controllerHome) async {

    final idUsuario = _auth.currentUser.uid;

    bool testepontoSalvo =
    await _salvarPontoUsuario(idUsuario, controllerQuiz.storeQuiz);

    if (testepontoSalvo) {
      int pontuacaoTotalUser = await _recuperarTotalPontosUsuario(idUsuario);

      if (pontuacaoTotalUser != null) {
        bool testeSalvo = await _salvarTotalPontos(
            controllerHome.storeHome.variaveisHome.pontuacaoUser.nome,
            pontuacaoTotalUser,
            idUsuario);
        if (testeSalvo) {

          //atualizando nivel usuario
          PontuacaoUsuario pontuacaoUsuario = PontuacaoUsuario(
              controllerHome.storeHome.variaveisHome.pontuacaoUser.nome,
              pontuacaoTotalUser);
          controllerHome.storeHome.variaveisHome
              .setPontuacaoUser(pontuacaoUsuario);

          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<bool> _salvarPontoUsuario(String idUsuario,
      StoreQuiz storeQuiz) async {
    try {
      await _db
          .collection("usuarios")
          .doc(idUsuario)
          .collection("niveis")
          .doc(storeQuiz.variaveisQuiz.ultimaQuestaoSelecionado)
          .set({
        "pontuacao": storeQuiz.variaveisQuiz.pontuacao,
      });
      return true;
    } on PlatformException catch (_) {
      return false;
    }
  }

  Future<int> _recuperarTotalPontosUsuario(String idUsuario) async {
    int totalPontuacao = 0;

    try {
      QuerySnapshot snapshot = await _db
          .collection("usuarios")
          .doc(idUsuario)
          .collection("niveis")
          .get();
      if (snapshot.docs.isNotEmpty) {
        for (DocumentSnapshot item in snapshot.docs) {
          var dados = item.data();
          totalPontuacao = totalPontuacao + dados["pontuacao"];
        }
        return totalPontuacao;
      } else {
        return -1;
      }
    } on PlatformException catch (_) {
      return -1;
    }
  }

  Future<bool> _salvarTotalPontos(String nomeUsuario, int totalPontuacao,
      String idUsuario) async {
    try {
      await _db.collection("pontuacaoGlobal").doc(idUsuario).set({
        "nome": nomeUsuario,
        "pontuacao": totalPontuacao,
      });
      return true;
    } on PlatformException catch (_) {
      return false;
    }
  }

//fim de metodos para salvar

  Future<List<Questao>> recuperarQuestoes(String escolherQuestao) async {
    QuerySnapshot querySnapshot = await _db
        .collection("listaPergunta")
        .doc("questoes")
        .collection(escolherQuestao)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      List<Questao> questaoLista = [];

      for (DocumentSnapshot item in querySnapshot.docs) {
        var dados = item.data();
        Questao q = Questao.fromMap(dados);
        questaoLista.add(q);
      }

      //recupera questao selecionado pelo usuario

      return questaoLista;
    } else {
      return null;
    }
  }
}
