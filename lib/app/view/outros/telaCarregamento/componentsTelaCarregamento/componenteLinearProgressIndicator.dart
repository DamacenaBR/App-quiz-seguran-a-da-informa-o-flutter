import 'package:flutter/material.dart';

class ComponenteLinearProgressIndicator{
  Widget linearProgressIndicator(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Container(
        width: 500.0,
        child: LinearProgressIndicator(
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}