
import 'dart:async';

import 'package:app_quiz_seguranca/app/controllers/controllerConection/controllerConection.dart';
import 'package:app_quiz_seguranca/app/model/pontuacaoUsuario.dart';
import 'package:app_quiz_seguranca/app/repositories/repositoryClassificacao/repositoryClassificacao.dart';
import 'package:app_quiz_seguranca/app/rotas/routeGenerator.dart';
import 'package:flutter/material.dart';

class ControllerClassificacao{

  var storeClassificacao;
  var storeHome;
  final conection = ControllerConection();
  RepositoryClassificacao repositoryClassificacao;

  ControllerClassificacao(var storeHome,var storeClassificacao){
    this.storeHome = storeHome;
    this.storeClassificacao = storeClassificacao;
    repositoryClassificacao = new RepositoryClassificacao();
  }

  Future<List<PontuacaoUsuario>> recuperarClassificacao() async{
    List<PontuacaoUsuario> listaPontuacao = await repositoryClassificacao.recuperarClassificacao();
    return listaPontuacao;

  }

  Future<List<PontuacaoUsuario>> recuperarListPontuacaoUser() async{
    List<PontuacaoUsuario> listaPontuacaoUser = await repositoryClassificacao.recuperarListPontuacaoUser();
    return listaPontuacaoUser;
  }

  Future<void> qntQuestoesPorNivel(BuildContext context) async{
    storeClassificacao.setTesteCarregando(true);

    _testeCarregarDados(context);
    bool concectividade = await conection.conectadoRede();
    //verificarção de conceção com a internet

    if (concectividade) {
      int qntQuestoesPorNivel = await repositoryClassificacao.qntQuestoesPorNivel();
      if(qntQuestoesPorNivel != -1){
        storeClassificacao.setQntQuestoesPorNivel(qntQuestoesPorNivel);
        storeClassificacao.setTesteCarregando(false);
      }
    }

  }

  _testeCarregarDados(BuildContext context) {
    Timer(
        Duration(seconds: 10),
            () => storeClassificacao.testeCarregando
            ? Navigator.pushReplacementNamed(
            context, RouteGenerator.ROTA_ERRO_CARREGAMENTO)
            : null);
  }

}