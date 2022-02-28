import 'package:flutter/material.dart';

class ComponenteTextMensagem{
  Widget textMensagem(BuildContext context){
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(width: 2.0, color: Theme.of(context).primaryColor)),
      child: Text(
        "Aplicativo desenvolvido para o TCC do curso de Ciências da Computação da FAFIC, "
            "com a finalidade de coletar dados e colaborar no nível de conhecimento sobre segurança da informação.",
        textAlign: TextAlign.justify,
        style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
