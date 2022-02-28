import 'package:flutter/material.dart';

class ComponenteCaixaDeTexto {

  Widget caixaDeTexto(TextEditingController controller, TextInputType inputType,
      bool obscureText, String text, Function function, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _indicadorTexFild(text, context),
        _textFild(controller: controller,
            inputType: inputType,
            obscureText: obscureText,
            function: function, context: context),
      ],
    );
  }

  Widget _indicadorTexFild(String text, BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15),
        child: Text(text, style: TextStyle(color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18)));
  }

  Widget _textFild({TextEditingController controller,
    TextInputType inputType,
    bool obscureText, Function function, BuildContext context}) {
    return TextFormField(
        autofocus: false,
        obscureText: obscureText,
        keyboardType: inputType,
        controller: controller,
        style: TextStyle(fontSize: 20),
        cursorColor: Theme.of(context).primaryColor,
        validator: (value) {
          return function(value);
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(32, 8, 32, 8),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
            )));
  }

}