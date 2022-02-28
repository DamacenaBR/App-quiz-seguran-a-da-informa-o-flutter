import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_quiz_seguranca/app/model/pontuacaoUsuario.dart';

class RepositoryClassificacao {
  FirebaseFirestore _db;
  FirebaseAuth _auth;

  RepositoryClassificacao() {
    if (_db == null && _auth == null) {
      _db = FirebaseFirestore.instance;
      _auth = FirebaseAuth.instance;
    }
  }

  Future<List<PontuacaoUsuario>> recuperarClassificacao() async {
    QuerySnapshot querySnapshot =
    await _db.collection("pontuacaoGlobal").orderBy(
        "pontuacao", descending: true).get();
    List<PontuacaoUsuario> pontuacaoLista = [];

    if (querySnapshot != null && querySnapshot.docs != null) {
      for (DocumentSnapshot item in querySnapshot.docs) {
        var dados = item.data();
        PontuacaoUsuario p = PontuacaoUsuario.fromMap(dados);
        pontuacaoLista.add(p);
      }

      //recupera questao selecionado pelo usuario

      return pontuacaoLista;
    }
    else {
      return null;
    }
  }

  Future<List<PontuacaoUsuario>> recuperarListPontuacaoUser() async {
    final idUsuario = _auth.currentUser.uid;
    QuerySnapshot querySnapshot = await _db
        .collection("usuarios")
        .doc(idUsuario)
        .collection("niveis")
        .get();

    List<PontuacaoUsuario> pontuacaoLista = [];
    if (querySnapshot != null && querySnapshot.docs != null) {
      for (DocumentSnapshot item in querySnapshot.docs) {
        var dados = item.data();
        PontuacaoUsuario p = PontuacaoUsuario(
            item.id, dados["pontuacao"]);
        pontuacaoLista.add(p);
      }

      //recupera questao selecionado pelo usuario

      return pontuacaoLista;
    }
    return null;
  }

  Future<int> qntQuestoesPorNivel() async{
    DocumentSnapshot snapshot =
    await _db.collection("listaPergunta").doc("qntQuestoesPorNivel").get();
    if (snapshot.data() != null) {
      Map<String, dynamic> dados = snapshot.data();
      return dados["quantidade"];
    } else {
      return -1;
    }
  }
}
