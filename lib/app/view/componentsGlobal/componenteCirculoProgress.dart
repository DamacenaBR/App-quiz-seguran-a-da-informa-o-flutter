import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComponenteCirculoProgress {
  Widget componenteCirculoProgress(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
        ),
        Text(
          "Carregando!!!",
          style:
              TextStyle(color: Color(0xff381F6C), fontWeight: FontWeight.bold),
        ),
      ],
    ));
  }
}
