import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerHome/controllerHome.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerQuiz/controllerQuiz.dart';
import 'package:app_quiz_seguranca/app/stores/home/storeHome/storeHome.dart';
import 'package:app_quiz_seguranca/app/stores/quiz/storeQuiz/storeQuiz.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteImagemFundo.dart';
import 'package:app_quiz_seguranca/app/view/telaQuiz/componentsQuiz/componenteNumeroQuestao.dart';
import 'package:app_quiz_seguranca/app/view/telaQuiz/componentsQuiz/componentePerguntaQuestao.dart';
import 'package:app_quiz_seguranca/app/view/telaQuiz/componentsQuiz/componenteRespostas.dart';
import 'package:provider/provider.dart';

class QuizPageBody extends StatelessWidget with ComponenteNumeroQuestao, ComponentePerguntaQuestao, ComponenteRespostas, ComponenteImagemFundo{

  @override
  Widget build(BuildContext context) {
    final storeHome = Provider.of<StoreHome>(context);
    final storeQuiz = Provider.of<StoreQuiz>(context);

    ControllerQuiz controllerQuiz = new ControllerQuiz(storeQuiz);
    ControllerHome controllerHome = new ControllerHome(storeHome);

    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      decoration: imagemFundo(),
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            numeroQuestao(controllerQuiz.storeQuiz, context),
            perguntaQuestao(controllerQuiz.storeQuiz),
            respostas(controllerQuiz,context, controllerHome),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
          ],
        ),
      )
    );
  }
}
