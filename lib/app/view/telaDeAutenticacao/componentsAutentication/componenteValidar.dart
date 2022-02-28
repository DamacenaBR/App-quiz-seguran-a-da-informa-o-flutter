import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/stores/login/storeLogin/storeLogin.dart';

class ComponenteValidar{
  Widget botaoAcao(String text, Function function, double left, double right, dynamic keyForm, StoreLogin storeLogin, BuildContext context){
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
          if (keyForm.currentState.validate()) {
            function();
          }
          else{
            storeLogin.variaveisLogin.setMensagemErro("");
          }
        },
      ),
    );
  }
}