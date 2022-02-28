import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/stores/quiz/storeQuiz/storeQuiz.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ComponentePerguntaQuestao{

  Widget perguntaQuestao(StoreQuiz storeQuiz) {
    return Center(
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 10),

            child: Center(child: Observer(
              builder: (_) {
                return Text(
                  storeQuiz.variaveisQuiz.questao.pergunta,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                );
              },
            ))));
  }
}