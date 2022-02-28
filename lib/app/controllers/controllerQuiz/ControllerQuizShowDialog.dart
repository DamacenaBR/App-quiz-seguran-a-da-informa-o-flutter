import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerConection/controllerConection.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerHome/controllerHome.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerQuiz/controllerQuiz.dart';
import 'package:app_quiz_seguranca/app/stores/quiz/storeQuiz/storeQuiz.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteSnackBar.dart';
import 'package:app_quiz_seguranca/app/view/telaQuiz/componentsQuiz/componenteResultDialog.dart';

class ControllerQuizShowDialog {
  final componenteSnackBar = ComponenteSnackBar();
  final compoenenteResultDialog = CompoenenteResultDialog();
  final conection = ControllerConection();

  void showDialog(BuildContext context, ControllerHome controllerHome,
      ControllerQuiz controllerQuiz) {
    //iniciar showDialog passando dados

    var respostaDialog = controllerQuiz.storeQuiz.variaveisQuiz.respostaDialig;
    var respostaCorreta =
        controllerQuiz.storeQuiz.variaveisDeTeste.respostaCorreta;
    compoenenteResultDialog.show(context,
        resposta: respostaDialog, correto: respostaCorreta, onPressed: () {
      //passando metodo recuperar proxima questao e salvar
      _proximaQuestaoDialog(context, controllerHome, controllerQuiz);
    });
  }

  _proximaQuestaoDialog(BuildContext context, ControllerHome controllerHome,
      ControllerQuiz controllerQuiz) async {
    var respostaCorreta =
        controllerQuiz.storeQuiz.variaveisDeTeste.respostaCorreta;
    var pontacao = controllerQuiz.storeQuiz.variaveisQuiz.pontuacao;

    //operação de teste de pontuação usuario - armazenar pontos usuario
    respostaCorreta
        ? controllerQuiz.storeQuiz.variaveisQuiz.setPontuacao(pontacao + 1)
        : null;

    //condição de armazenamento da pontuação do usuario
    if (_testeQuizFinalizado(controllerQuiz)) {
      //bloqueando tela e esperando os dados ser salvo
      controllerQuiz.testeBloquearDialog = false;

      bool concectividade = await conection.conectadoRede();

      //verificarção de conceção com a internet
      if (concectividade) {
        _salvarPontuacaoUsuario(context, controllerQuiz, controllerHome);
      } else {
        controllerQuiz.redirecionarOperacaoErro(context);
      }
    } else {
      recuperarProximaQuestao(controllerQuiz);
    }
  }

  bool _testeQuizFinalizado(ControllerQuiz controllerQuiz) {
    var numeroQuestao = controllerQuiz.storeQuiz.variaveisQuiz.numeroQuestao;
    var tamanhoList =
        controllerQuiz.storeQuiz.variaveisQuiz.listQuestoes.tamanho;

    return numeroQuestao == tamanhoList;
  }

  //recuperar questões da lista
  void recuperarProximaQuestao(ControllerQuiz controllerQuiz) async {
    if (!_testeQuizFinalizado(controllerQuiz)) {
      var proximaQuestao =
          controllerQuiz.storeQuiz.variaveisQuiz.listQuestoes.proximaQuestao;
      var questaoNumero =
          controllerQuiz.storeQuiz.variaveisQuiz.listQuestoes.questaoNumero;

      controllerQuiz.storeQuiz.variaveisQuiz.setQuestoao(proximaQuestao);
      controllerQuiz.storeQuiz.variaveisQuiz.setNumeroQuestao(questaoNumero);
    }
  }

  _salvarPontuacaoUsuario(BuildContext context, ControllerQuiz controllerQuiz,
      ControllerHome controllerHome) async {
    bool testeUsuarioSalvo = await controllerQuiz.repositoryQuiz
        .salvarPontuacaoUsuarioCompleto(controllerQuiz, controllerHome);

    if (testeUsuarioSalvo) {
      //remove o nivel finalizado
      _removerNivelFinalizado(controllerHome, controllerQuiz.storeQuiz);
      controllerQuiz.redirecionarOperacaoSucesso(
          context, controllerQuiz.storeQuiz);
    } else {
      controllerQuiz.redirecionarOperacaoErro(context);
    }
  }

  _removerNivelFinalizado(ControllerHome controllerHome, StoreQuiz storeQuiz) {
    //salvando niveis finalizado na lista

    var ultimaQuestao = storeQuiz.variaveisQuiz.ultimaQuestaoSelecionado;

    controllerHome.storeHome.variaveisHome.listNiveisQuizFinalizado
        .add(ultimaQuestao);

    //removendo niveis finalizados

    var listNivelQuiz = controllerHome.storeHome.variaveisHome.listNiveisQuiz;
    var listQuizFinalizado =
        controllerHome.storeHome.variaveisHome.listNiveisQuizFinalizado;

    List<String> listNiveis = controllerHome.removerNivelFinalizado(
        listNivelQuiz, listQuizFinalizado);

    //atualizando lista niveis
    controllerHome.storeHome.variaveisHome.setListNiveisQuiz(listNiveis);
  }
}
