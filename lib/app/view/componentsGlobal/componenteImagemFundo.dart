
import 'package:flutter/material.dart';

class ComponenteImagemFundo{

  imagemFundo(){
    return BoxDecoration(
        image: new DecorationImage(
            image: AssetImage('assets/imagens/fundo_tela.png'),
            fit: BoxFit.fill));
  }
}