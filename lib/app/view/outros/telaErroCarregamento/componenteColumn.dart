import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/rotas/routeGenerator.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/compoenenteBotaoAcao.dart';

class ComponenteColumn{
  
  final botaoAcao = ComponenteBotaoAcao();
  
  Widget columnErroCarregamento( BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "OPS",
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 28.0,
              fontWeight: FontWeight.bold),
        ),
        Text(
          "Isso não deveria ter acontecido!",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
        Padding(padding: EdgeInsets.only(top: 40)),
        Container(
          height: 220,
          decoration: BoxDecoration(
              image: new DecorationImage(
                scale: 0.01,
                image: AssetImage('assets/imagens/logoErro.png'),
              )),
        ),
        Padding(padding: EdgeInsets.only(top: 40)),
        botaoAcao.botaoAcao("Volta à Tela Inicial", (){_redirecionarTelaHome(context);}, 25, 25, context),
      ],
    );
  }

  _redirecionarTelaHome(BuildContext context){
    Navigator.pushNamedAndRemoveUntil(
        context, RouteGenerator.ROTA_HOME, ModalRoute.withName('/'));
  }
}