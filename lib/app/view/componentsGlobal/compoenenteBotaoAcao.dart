

import 'package:flutter/material.dart';

class ComponenteBotaoAcao{

  //botao para inicar uma acao de login, cadastro, redefinir senha etc.
  Widget botaoAcao(String text, Function function, double left, double right, BuildContext context){
    return Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
      child: GestureDetector(
        child: Padding(
          padding: EdgeInsets.only(top: 3, bottom: 3),
          child: Container(
            padding: EdgeInsets.only(top: 6, bottom: 6,left: left,right: right),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(width: 1.0, color: Colors.black)
            ),
            child: Text(text, style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold), ),
          ),
        ),
        onTap: (){
          function();
        },
      ),
    );
  }
  
}