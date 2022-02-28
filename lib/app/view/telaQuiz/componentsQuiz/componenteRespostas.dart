import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerHome/controllerHome.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerQuiz/controllerQuiz.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ComponenteRespostas {
  Widget respostas(ControllerQuiz controllerQuiz, BuildContext context,
      ControllerHome controllerHome) {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: Observer(
          builder: (_) {
            return _columnQuestaoBox(controllerQuiz, context, controllerHome);
          },
        ));
  }

  Widget _columnQuestaoBox(ControllerQuiz controllerQuiz, BuildContext context,
      ControllerHome controllerHome) {
    return Column(
      children: [
        _questaoBox(
          "A",
          controllerQuiz.storeQuiz.variaveisQuiz.questao.respostaA,
          () {
            controllerQuiz.manipularQuiz("A", context, controllerHome);
          }, context
        ),
        _questaoBox(
            "B", controllerQuiz.storeQuiz.variaveisQuiz.questao.respostaB, () {
          controllerQuiz.manipularQuiz("B", context, controllerHome);
        }, context),
        _questaoBox(
            "C", controllerQuiz.storeQuiz.variaveisQuiz.questao.respostaC, () {
          controllerQuiz.manipularQuiz("C", context, controllerHome);
        }, context),
        _questaoBox(
            "D", controllerQuiz.storeQuiz.variaveisQuiz.questao.respostaD, () {
          controllerQuiz.manipularQuiz("D", context, controllerHome);
        }, context),
      ],
    );
  }

  Widget _questaoBox(
      String btnText, String escolhaTexto, VoidCallback onPressed, BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: GestureDetector(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1.0, color: Colors.black),
              borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _letraQuestao(btnText, context),
                _respostaQuestao(escolhaTexto),
              ],
            ),
          ),
          onTap: () => onPressed(),
        ));
  }

  Widget _letraQuestao(String btnText, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15),
      child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            border: Border.all(width: 1.0, color: Colors.black),
            borderRadius: const BorderRadius.all(const Radius.circular(5.0)),
          ),
          child: Center(
            child: Text(
              btnText,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          )),
    );
  }

  Widget _respostaQuestao(String escolhaTexto) {
    return Expanded(
      child: Text(
        escolhaTexto,
        textAlign: TextAlign.justify,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
