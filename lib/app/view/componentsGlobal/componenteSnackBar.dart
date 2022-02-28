import 'package:flutter/material.dart';

class ComponenteSnackBar {
  Widget snackBar(String text, BuildContext context) {
    return SnackBar(
        padding: EdgeInsets.only(top: 3, bottom: 3, left: 20),
        backgroundColor: Theme.of(context).primaryColor,
        duration: Duration(seconds: 5),
        content: Text(text),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
        ));
  }
}
