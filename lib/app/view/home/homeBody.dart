import 'package:app_quiz_seguranca/app/view/home/componentsHome/componenteTextMensagem.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerHome/controllerHome.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerLogin/controllerLogin.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerQuiz/controllerQuiz.dart';
import 'package:app_quiz_seguranca/app/stores/home/storeHome/storeHome.dart';
import 'package:app_quiz_seguranca/app/stores/login/storeLogin/storeLogin.dart';
import 'package:app_quiz_seguranca/app/stores/quiz/storeQuiz/storeQuiz.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteImagemFundo.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteImagemLogo.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteSnackBar.dart';
import 'package:app_quiz_seguranca/app/view/home/componentsHome/componenteBotaoIniciar.dart';
import 'package:app_quiz_seguranca/app/view/home/componentsHome/componentePontuacao.dart';
import 'package:app_quiz_seguranca/app/view/home/componentsHome/componenteSair.dart';
import 'package:app_quiz_seguranca/app/view/home/componentsHome/componenteTextNome.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget
    with
        ComponenteImagemFundo,
        ComponenteTextNome,
        ComponenteImagemLogo,
        ComponenteBotaoIniciar,
        ComponentePontuacao,
        ComponenteSair,
        ComponenteSnackBar,
        ComponenteTextMensagem{
  @override
  Widget build(BuildContext context) {
    final storeHome = Provider.of<StoreHome>(context);
    final storeLogin = Provider.of<StoreLogin>(context);
    final storeQuiz = Provider.of<StoreQuiz>(context);

    ControllerHome controllerHome = new ControllerHome(storeHome);
    ControllerLogin controllerLogin = new ControllerLogin(storeLogin);
    ControllerQuiz controllerQuiz = new ControllerQuiz(storeQuiz);

    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(25),
        decoration: imagemFundo(),
        child: SingleChildScrollView(
          child: _column(controllerHome.storeHome, controllerLogin, context,
              controllerQuiz.storeQuiz),
        ));
  }

  _column(StoreHome storeHome, ControllerLogin controllerLogin,
      BuildContext context, StoreQuiz storeQuiz) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textNome(storeHome, context),
            pontuacao(storeHome, context),
          ],
        ),
        Padding(padding: EdgeInsets.only(top: 40)),
        imagemLogo(),
        Padding(padding: EdgeInsets.only(bottom: 40)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            botaoIniciar(context, storeHome),
            Padding(padding: EdgeInsets.only(right: 4)),
            botaoSair(controllerLogin, storeQuiz, storeHome, context),
          ],
        ),
        Padding(padding: EdgeInsets.only(top: 25)),
        textMensagem(context),
      ],
    );
  }
}
