import 'dart:async';
import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerConection/controllerConection.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerHome/controllerHome.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerQuiz/ControllerQuizShowDialog.dart';
import 'package:app_quiz_seguranca/app/repositories/repositoryQuiz/repositoryQuiz.dart';
import 'package:app_quiz_seguranca/app/rotas/routeGenerator.dart';
import 'package:app_quiz_seguranca/app/stores/quiz/storeQuiz/storeQuiz.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteSnackBar.dart';

class ControllerQuiz {
  var storeQuiz;
  RepositoryQuiz repositoryQuiz;

  //bloaquear dialog quando finalizar quiz

  bool testeBloquearDialog = true;
  final componenteSnackBar = ComponenteSnackBar();
  final conection = ControllerConection();
  final controllerQuizShowDialog = ControllerQuizShowDialog();

  ControllerQuiz(var storeQuiz) {
    this.storeQuiz = storeQuiz;
    this.repositoryQuiz = new RepositoryQuiz();
  }

  // metodo manipular escolha respostas
  void manipularQuiz(
      String escolha, BuildContext context, ControllerHome controllerHome) {
    //recuperando resposta para o Dialog
    String respotaDialog = _recuperandoResposta();
    storeQuiz.variaveisQuiz.setRespostaDialog(respotaDialog);

    //teste resposta correta
    storeQuiz.variaveisDeTeste.setRespostaCorreta(
        escolha == storeQuiz.variaveisQuiz.questao.respostaCorreta);

    //bloquear dialog quando finalizar quiz
    if (testeBloquearDialog) {
      controllerQuizShowDialog.showDialog(context, controllerHome, this);
    } else {
      //snackBar mensagem quando terminar quiz
      final snackBar =
          componenteSnackBar.snackBar("Aguarde Salvando os pontos!!!", context);
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  _recuperandoResposta() {
    String teste = storeQuiz.variaveisQuiz.questao.respostaCorreta;
    switch (teste) {
      case "A":
        return storeQuiz.variaveisQuiz.questao.respostaA;
      case "B":
        return storeQuiz.variaveisQuiz.questao.respostaB;
      case "C":
        return storeQuiz.variaveisQuiz.questao.respostaC;
      case "D":
        return storeQuiz.variaveisQuiz.questao.respostaD;
      default:
        return null;
    }
  }

  //inicio recuperar questões
  Future<void> inicializar(BuildContext context, String escolherQuestao) async {
    //reiniciando teste esperar recuperar dados quiz
    _testeCarregarDadosQuiz(context);

    bool concectividade = await conection.conectadoRede();
    //verificarção de conceção com a internet
    if (concectividade) {
      var lista = await repositoryQuiz.recuperarQuestoes(escolherQuestao);

      if (lista != null) {
        _recuperarQuestoes(context, lista, escolherQuestao);
      }
    }
  }

  //recupera os dados questao quiz se for direfente da anterior escolhido
  _recuperarQuestoes(BuildContext context, var lista, String escolherQuestao) {
    //armazenando dados na lista
    storeQuiz.variaveisQuiz.setListQuestoes(lista);

    //armazenar a questao escolhida para codicao de teste no metodo de remover niveis finalizado "repostioryQuiz"
    storeQuiz.variaveisQuiz.setUltimaQuestaoSelecionado(escolherQuestao);

    //teste se os dados foi carregado com sucesso
    storeQuiz.variaveisDeTeste.setCarregarPaginaQuiz(false);

    //recuperando dados da lista de questoes
    controllerQuizShowDialog.recuperarProximaQuestao(this);
  }

  //final metodo recuperar questao

  redirecionarOperacaoErro(BuildContext context) {
    Navigator.pushReplacementNamed(
        context, RouteGenerator.ROTA_ERRO_CARREGAMENTO);
  }

  redirecionarOperacaoSucesso(BuildContext context, StoreQuiz storeQuiz) {
    Navigator.pushNamedAndRemoveUntil(
        context, RouteGenerator.ROTA_TELA_PONTUACAO, ModalRoute.withName('/'),
        arguments: [
          storeQuiz.variaveisQuiz.pontuacao,
          storeQuiz.variaveisQuiz.listQuestoes.tamanho
        ]);
  }

  //teste de dados carregados com sucesso
  _testeCarregarDadosQuiz(BuildContext context) {
    Timer(
        Duration(seconds: 10),
        () => storeQuiz.variaveisDeTeste.carregarPaginaQuiz == true
            ? Navigator.pushReplacementNamed(
                context, RouteGenerator.ROTA_ERRO_CARREGAMENTO)
            : null);
  }
}
