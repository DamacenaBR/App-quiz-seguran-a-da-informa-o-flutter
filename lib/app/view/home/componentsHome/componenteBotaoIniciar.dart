import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/rotas/routeGenerator.dart';
import 'package:app_quiz_seguranca/app/stores/home/storeHome/storeHome.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/compoenenteBotaoAcao.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteSnackBar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ComponenteBotaoIniciar{

  static var botaoAcao = ComponenteBotaoAcao();
  final componenteSnackBar = ComponenteSnackBar();

  Widget botaoIniciar(BuildContext context, StoreHome storeHome){
    return GestureDetector(
      child: Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            border: Border.all(width: 1.0, color: Theme.of(context).primaryColor),
            color: Color(0xff9F72FF),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Iniciar", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Text("Quiz", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            ],
          )
      ),
      onTap: () {
        //verificando quiz finalizado
        if(storeHome.variaveisHome.listNiveisQuiz.isEmpty){
          _snackBar(context);
        }
        else{
          _dialogIniciar(context, storeHome);
        }
      },
    );
  }

  _snackBar(BuildContext context) {
    final snackBar =
    componenteSnackBar.snackBar("Parabéns o quiz foi finalizado!!!", context);
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _dialogIniciar(BuildContext context, StoreHome storeHome) {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20)),
                content: Column(
                  children: [
                    dropdownButton(storeHome, context),
                    botaoDropDownIniciar(storeHome, context),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget dropdownButton(StoreHome storeHome, BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: Color(0xffF2F2F2),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: DropdownButton(
          items: storeHome.variaveisHome.listNiveisQuiz
              .map((value) => DropdownMenuItem(
            child: Text(
              value,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            value: value,
          ))
              .toList(),
          onChanged: (value) {
            storeHome.variaveisHome.setQuestaoDropdown(value);
          },
          isExpanded: false,
          hint: _testeHintDropDown(storeHome, context),
        ),
      );
    });
  }

  _testeHintDropDown(StoreHome storeHome, BuildContext context){
    return storeHome.variaveisHome.questaoDropdown == ""
        ? Text(
      " Nível   selecione... ",
      style: TextStyle(color: Theme.of(context).primaryColor),
    )
        : Text(
      storeHome.variaveisHome.questaoDropdown,
      style: TextStyle(color: Theme.of(context).primaryColor),
    );
  }

  Widget botaoDropDownIniciar(StoreHome storeHome, BuildContext context){
    return botaoAcao.botaoAcao("OK", (){_acaoBotaoDropDownIniciar(storeHome, context);}, 40,40, context);
  }

  _acaoBotaoDropDownIniciar(StoreHome storeHome, BuildContext context){
    if (storeHome.variaveisHome.questaoDropdown != "") {
      Navigator.pop(context);
      String questao =
          storeHome.variaveisHome.questaoDropdown;
      storeHome.variaveisHome.setQuestaoDropdown("");
      Navigator.pushNamed(
          context, RouteGenerator.ROTA_TELA_QUIZ,
          arguments: [questao]);
    }
  }

}
