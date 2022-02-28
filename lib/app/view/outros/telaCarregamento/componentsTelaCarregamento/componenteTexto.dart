import 'package:flutter/material.dart';
class ComponenteTexto{

  Widget texto(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Text(
        "Vamos lá...",
        style: TextStyle(
            color: Theme.of(context).primaryColor, fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}