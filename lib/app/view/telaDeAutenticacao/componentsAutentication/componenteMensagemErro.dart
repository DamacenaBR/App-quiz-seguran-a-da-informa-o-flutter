import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/stores/login/storeLogin/storeLogin.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ComponenteMesagemErro{
  Widget mensagemErro(StoreLogin storeLogin) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Center(child: Observer(
        builder: (_) {
          return Text(
            storeLogin.variaveisLogin.mensagemErro,
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.red, fontSize: 13),
          );
        },
      )),
    );
  }
}