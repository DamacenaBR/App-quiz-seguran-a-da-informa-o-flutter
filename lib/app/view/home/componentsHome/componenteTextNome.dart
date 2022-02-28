import 'package:app_quiz_seguranca/app/stores/home/storeHome/storeHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ComponenteTextNome{
  Widget textNome(StoreHome storeHome, BuildContext context){
    return Observer(
        builder: (_) {
          return storeHome.variaveisHome.pontuacaoUser == null ? Text("Olá, ", style: TextStyle(color: Theme.of(context).primaryColor,
              fontSize: 25,
              fontWeight: FontWeight.w500),
          ) :  Text("Olá, " + storeHome.variaveisHome.pontuacaoUser.nome, style: TextStyle(color: Theme.of(context).primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w500),
      );
    });
  }
}