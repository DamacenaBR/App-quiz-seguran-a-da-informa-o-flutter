import 'dart:async';
import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerQuiz/controllerQuiz.dart';
import 'package:app_quiz_seguranca/app/stores/quiz/storeQuiz/storeQuiz.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteCirculoProgress.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteShowDialogOnWillPop.dart';
import 'package:app_quiz_seguranca/app/view/telaQuiz/quizPageBody.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class QuizPage extends StatefulWidget {
  final String _escolhaQuestao;

  QuizPage(this._escolhaQuestao);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> with ComponenteCirculoProgress, ComponenteShowDialogOnWillPop {
  ControllerQuiz controllerQuiz;

  @override
  Widget build(BuildContext context) {
    final storeQuiz = Provider.of<StoreQuiz>(context);
    controllerQuiz = new ControllerQuiz(storeQuiz);
    controllerQuiz.storeQuiz.disposeQuiz();
    controllerQuiz.inicializar(context, widget._escolhaQuestao.toString());

    return WillPopScope(
        child: Scaffold(
          appBar: _appBar(),
          body: _body(context),
        ),
        onWillPop: _onWillPop);
  }

  Future<bool> _onWillPop() async {
    return componenteShowDialogOnWillPop(context, "", controllerQuiz.storeQuiz.variaveisDeTeste.carregarPaginaQuiz);
  }

  _appBar() {
    return AppBar(
      title: Text(
        widget._escolhaQuestao,
        style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  _body(BuildContext context){
    return Observer(builder: (_) {
      //condição de espera os dados carregado do quiz (loading)
      return controllerQuiz.storeQuiz.variaveisDeTeste.carregarPaginaQuiz
          ? componenteCirculoProgress(context)
          : new QuizPageBody();
    });
  }
}
