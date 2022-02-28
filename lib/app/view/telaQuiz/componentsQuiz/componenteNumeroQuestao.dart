import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/stores/quiz/storeQuiz/storeQuiz.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ComponenteNumeroQuestao {
  Widget numeroQuestao(StoreQuiz storeQuiz, BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Observer(
            builder: (_) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Quetão 0" +
                        storeQuiz.variaveisQuiz.numeroQuestao.toString() + "/",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("0" + storeQuiz.variaveisQuiz.listQuestoes.tamanho.toString(),
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              );
            },
          )),
    );
  }
}
