import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/rotas/routeGenerator.dart';
import 'package:app_quiz_seguranca/app/stores/home/storeHome/storeHome.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ComponentePontuacao {
  Widget pontuacao(StoreHome storeHome, BuildContext context) {
    return Observer(
      builder: (_) {
        return GestureDetector(
            child: Container(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _containerPontuacaoText(storeHome, context),
                  Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text("Sua Pontuação",
                          style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold)))
                ],
              ),
            ),
            onTap: () => Navigator.pushNamed(
                context, RouteGenerator.ROTA_TELA_INFORMACAO_PONTUACAO));
      },
    );
  }

  Widget _containerPontuacaoText(StoreHome storeHome, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5, left: 5),
      decoration: BoxDecoration(
        color: Color(0xffF2F2F2),
        border: Border.all(width: 1.0, color: Theme.of(context).primaryColor),
        borderRadius: const BorderRadius.all(const Radius.circular(5.0)),
      ),
      child: _recuperandoPontuacaoText(storeHome, context),
    );
  }

  Widget _recuperandoPontuacaoText(StoreHome storeHome, BuildContext context) {
    return storeHome.variaveisHome.pontuacaoUser == null
        ? Text(
            "0",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 25,
                fontWeight: FontWeight.w500),
          )
        : Text(storeHome.variaveisHome.pontuacaoUser.pontuacao.toString(),
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18.0,
                fontWeight: FontWeight.bold));
  }
}
