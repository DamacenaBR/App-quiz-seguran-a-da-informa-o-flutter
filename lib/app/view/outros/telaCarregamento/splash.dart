import 'dart:async';
import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerLogin/controllerLogin.dart';
import 'package:app_quiz_seguranca/app/stores/quiz/storeQuiz/storeQuiz.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteImagemFundo.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteImagemLogo.dart';
import 'package:app_quiz_seguranca/app/view/outros/telaCarregamento/componentsTelaCarregamento/componenteLinearProgressIndicator.dart';
import 'package:app_quiz_seguranca/app/view/outros/telaCarregamento/componentsTelaCarregamento/componenteTexto.dart';
import 'package:provider/provider.dart';

class StartPage extends StatefulWidget {
  @override
  State createState() => new _StartPageState();
}

class _StartPageState extends State<StartPage> with ComponenteImagemLogo, ComponenteTexto, ComponenteLinearProgressIndicator, ComponenteImagemFundo{
  
  var storeLogin;
  ControllerLogin controllerLogin;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Timer(Duration(seconds: 5),
            () => controllerLogin.verificaUsuarioLogado(context));
  }
  @override
  Widget build(BuildContext context) {

    //recupera a mesma instancia do controllerLogin
    storeLogin = Provider.of<StoreQuiz>(context);
    controllerLogin = new ControllerLogin(storeLogin);

    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Container(
        decoration:  imagemFundo(),
      child: Center(
          child: SingleChildScrollView(
        child: _column(),
      )),
    );
  }

  _column() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 32),
          child: imagemLogo(),
        ),
        linearProgressIndicator(context),
        texto(context),
      ],
    );
  }
}
