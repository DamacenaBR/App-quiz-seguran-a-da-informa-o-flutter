import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/model/pontuacaoUsuario.dart';
import 'package:app_quiz_seguranca/app/repositories/repositoryHome/repositoryHome.dart';
import 'package:app_quiz_seguranca/app/rotas/routeGenerator.dart';

class ControllerHome {
  var storeHome;
  RepositoryHome repositoryHome;

  ControllerHome(var storeHome) {
    this.storeHome = storeHome;
    this.repositoryHome = new RepositoryHome();
  }

  //recupera o nome do usuario
  Future<void> recuperarDadosUsuario(BuildContext context) async {
    //teste recuperar dados somente uma vez
    if (storeHome.variaveisHome.pontuacaoUser == null) {
      bool testePontuacao = await _recuperarPontuacao();
      bool testeRecuperarNiveilFinalizado = await _recuperarNivelFinalizado();
      bool testeNiveis = await _recuperarNiveis();

      if (testeNiveis && testeRecuperarNiveilFinalizado && testePontuacao) {
        //teste remover niveis finalizados
        _testeRemoverNivelFinalizado();
        storeHome.variaveisHome.setTesteCarregando(false);
      } else {
        Navigator.pushReplacementNamed(
            context, RouteGenerator.ROTA_ERRO_CARREGAMENTO);
      }
    }
  }

  void _testeRemoverNivelFinalizado() {
    if (storeHome.variaveisHome.listNiveisQuizFinalizado.isNotEmpty) {

      var listNivelQuiz = storeHome.variaveisHome.listNiveisQuiz;
      var listNiveisQuizFinalizado =
          storeHome.variaveisHome.listNiveisQuizFinalizado;

      List<String> listNiveis =
          removerNivelFinalizado(listNivelQuiz, listNiveisQuizFinalizado);

      storeHome.variaveisHome.setListNiveisQuiz(listNiveis);
    }
  }

  Future<bool> _recuperarPontuacao() async {
    PontuacaoUsuario pontuacaoUser = await repositoryHome.recuperarPontuacao();
    if (pontuacaoUser != null) {
      storeHome.variaveisHome.setPontuacaoUser(pontuacaoUser);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> _recuperarNiveis() async {
    List<String> niveis = await repositoryHome.recuperarNiveis();
    if (niveis != null) {
      storeHome.variaveisHome.setListNiveisQuiz(niveis);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> _recuperarNivelFinalizado() async {
    List<String> niveis = await repositoryHome.recuperarNivelFinalizado();
    if (niveis != null) {
      storeHome.variaveisHome.setListNiveisQuizFinalizado(niveis);
    } else {
      List<String> listaVazia = [];
      storeHome.variaveisHome.setListNiveisQuizFinalizado(listaVazia);
    }
    return true;
  }

  List<String> removerNivelFinalizado(
      List<String> niveis, List<String> niveisFinalizado) {
    List<String> listNiveis = [];
    if (niveisFinalizado.isNotEmpty) {
      for (String nivel in niveis) {
        if (!niveisFinalizado.contains(nivel)) {
          listNiveis.add(nivel);
        }
      }
      return listNiveis;
    }
    return niveis;
  }
}
