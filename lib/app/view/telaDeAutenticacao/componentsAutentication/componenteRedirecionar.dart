import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/stores/login/storeLogin/storeLogin.dart';

class ComponenteRedirecionar{
  Widget redirecionar(BuildContext context, StoreLogin storeLogin,
      String textBotao, String routeGenerator) {
    return Center(
      child: GestureDetector(
        child: Text(
          textBotao,
          style: TextStyle(fontSize: 15,color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          storeLogin.variaveisLogin.setMensagemErro("");
          Navigator.pushNamed(context, routeGenerator);
        },
      ),
    );
  }
}