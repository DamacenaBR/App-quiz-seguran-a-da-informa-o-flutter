import 'package:flutter/material.dart';

class ComponenteImagemLogo{
  Widget imagemLogo() {
    return Container(
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
          image: new DecorationImage(
              image: AssetImage('assets/imagens/logo_quiz.png'))),
    );
  }
}