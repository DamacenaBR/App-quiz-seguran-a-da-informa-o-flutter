import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/compoenenteBotaoAcao.dart';

class CompoenenteResultDialog {
   static final botaoAcao = ComponenteBotaoAcao();

  Future show(
    BuildContext context, {
    @required String resposta,
    @required bool correto,
        @required Function onPressed
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          title: _titulo(correto),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget> [
              _mensagem(correto),
              _resposta(resposta),
              botaoAcao.botaoAcao("OK", (){onPressed(); Navigator.pop(context);}, 40, 40, context),
            ],
          ),
        );
      },
    );
  }

  Widget _titulo(bool correto){
    return  CircleAvatar(
      backgroundColor: correto ? Colors.green : Colors.red,
      child: Icon(
        correto ? Icons.check : Icons.close,
        color: Colors.black,
      ),
    );
  }

   Widget _mensagem(bool correto){
    return Text(
      correto ? 'Você acertou! resposta:' : 'Você errou! O correto é:',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: correto ? Colors.green : Colors.red,
      ),
    );
  }

  Widget _resposta(String resposta){
    return Padding(
      padding: EdgeInsets.only(top: 4),
      child: Text(
        resposta,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}
