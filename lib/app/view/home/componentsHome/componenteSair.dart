import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerLogin/controllerLogin.dart';
import 'package:app_quiz_seguranca/app/stores/home/storeHome/storeHome.dart';
import 'package:app_quiz_seguranca/app/stores/quiz/storeQuiz/storeQuiz.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/compoenenteBotaoAcao.dart';

class ComponenteSair{

  final botaoAcao = ComponenteBotaoAcao();

  Widget botaoSair(ControllerLogin controllerLogin,  StoreQuiz storeQuiz, StoreHome storeHome, BuildContext context){
    return GestureDetector(
      child: Container(
        width: 120.0,
        height: 70.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          border: Border.all(width: 1.0, color: Theme.of(context).primaryColor),
          color: Color(0xffC09DCC),
        ),
        child: Center(
          child: Text("Sair", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        ),
      ),
      onTap: () {
        _showDialog(controllerLogin, storeQuiz, storeHome, context);
      },
    );
  }

  _showDialog(ControllerLogin controllerLogin,  StoreQuiz storeQuiz, StoreHome storeHome, BuildContext context){
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          title: Text("Deseja mesmo sair?", style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              botaoAcao.botaoAcao("Sair", (){controllerLogin.deslogarUsuario(context, storeHome, storeQuiz);
              Navigator.pop(context);}, 40, 40, context),
            ],
          ),
        ));
  }
}