import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerHome/controllerHome.dart';
import 'package:app_quiz_seguranca/app/stores/home/storeHome/storeHome.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteCirculoProgress.dart';
import 'package:app_quiz_seguranca/app/view/home/homeBody.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with ComponenteCirculoProgress{
  ControllerHome controllerHome;

  @override
  Widget build(BuildContext context) {
    final storeHome = Provider.of<StoreHome>(context);
    controllerHome = new ControllerHome(storeHome);
    controllerHome.recuperarDadosUsuario(context);
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context){
    return Observer(builder: (_) {
      //condição de espera os dados carregado do quiz (loading)
      return controllerHome.storeHome.variaveisHome.testeCarregando
          ? componenteCirculoProgress(context)
          : new HomeBody();
    });
  }
}
