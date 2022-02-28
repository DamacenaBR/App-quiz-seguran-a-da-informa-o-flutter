import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteImagemFundo.dart';
import 'package:app_quiz_seguranca/app/view/outros/telaErroCarregamento/componenteColumn.dart';

class TelaErroCarregamento extends StatelessWidget  with ComponenteColumn, ComponenteImagemFundo{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: imagemFundo(),
      child: SingleChildScrollView(
        child: columnErroCarregamento(context),
      )
    );
  }
}
