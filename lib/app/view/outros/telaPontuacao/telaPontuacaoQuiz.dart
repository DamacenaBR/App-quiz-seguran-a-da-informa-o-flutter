import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/rotas/routeGenerator.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/compoenenteBotaoAcao.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteImagemFundo.dart';
import 'package:app_quiz_seguranca/app/view/outros/telaPontuacao/componenteTelaPontuacao.dart';

class TelaPontuacao extends StatelessWidget with ComponenteBotaoAcao, ComponenteTelaPontuacao, ComponenteImagemFundo{
  final int pontuacao;
  final int totalQuestao;

  TelaPontuacao({this.pontuacao, this.totalQuestao});

  @override
  Widget build(BuildContext context){
    // TODO: implement build
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      title: Text("Pontuação", style: TextStyle(color: Theme.of(context).primaryColor),),
    );
  }

  _body(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: imagemFundo(),
      child: Center(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            textPontuacao1(context),
            textPontuacao2(pontuacao.toString(), totalQuestao.toString(), context),
            textAviso(),
            botaoAcao("Volta à Tela Inicial", (){_redirecionarTelaHome(context);}, 30, 25, context),
          ],
        ),
      )),
    );
  }

  _redirecionarTelaHome(BuildContext context){
    Navigator.pushNamedAndRemoveUntil(
        context, RouteGenerator.ROTA_HOME, ModalRoute.withName('/'));
  }
}
