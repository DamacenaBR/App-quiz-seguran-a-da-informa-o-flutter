import 'package:flutter/material.dart';

class ComponenteTelaPontuacao {
  Widget textPontuacao1(BuildContext context) {
    return Text(
      "PONTUAÇÃO",
      style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 50.0,
          fontWeight: FontWeight.bold),
    );
  }

  Widget textPontuacao2(String pontuacao, String totalQuestao, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(pontuacao,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 30.0,
              fontWeight: FontWeight.bold),
        ),
        Text("/" + totalQuestao,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 25.0,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget textAviso() {
    return Text(
      "Verifique sua Classificação!!!",
      style: TextStyle(
          color: Color(0xff381F6C),
          fontSize: 20.0,
          fontWeight: FontWeight.bold),
    );
  }
}
