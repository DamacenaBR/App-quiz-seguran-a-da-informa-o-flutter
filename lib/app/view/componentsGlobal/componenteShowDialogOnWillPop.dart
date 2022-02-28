import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/compoenenteBotaoAcao.dart';

class ComponenteShowDialogOnWillPop {

  static var botaoAcao = ComponenteBotaoAcao();
  componenteShowDialogOnWillPop(BuildContext context, String restaurarMsnErro, bool teste) {
    return showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          title: Text("Deseja mesmo sair?",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              botaoAcao.botaoAcao("Sair", () {
                _testeCarregandoDados(teste, context);
              }, 40, 40, context),
            ],
          ),
        ));
  }

  bool _testeCarregandoDados(bool teste, BuildContext context){
    if(teste){
      Navigator.pop(context, false);
    }
    else{
      Navigator.pop(context, true);
    }
  }
}
