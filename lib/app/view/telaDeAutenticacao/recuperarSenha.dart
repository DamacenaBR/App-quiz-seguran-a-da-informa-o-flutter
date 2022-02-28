import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_quiz_seguranca/app/view/telaDeAutenticacao/componentsAutentication/componenteCaixaDeTexto.dart';
import 'package:app_quiz_seguranca/app/view/telaDeAutenticacao/componentsAutentication/componenteValidar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerLogin/controllerLogin.dart';
import 'package:app_quiz_seguranca/app/model/usuario.dart';
import 'package:app_quiz_seguranca/app/stores/login/storeLogin/storeLogin.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteImagemFundo.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteImagemLogo.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteShowDialogOnWillPop.dart';
import 'package:app_quiz_seguranca/app/view/telaDeAutenticacao/componentsAutentication/componenteMensagemErro.dart';
import 'package:provider/provider.dart';

class RecuperSenha extends StatefulWidget {
  @override
  _RecuperSenhaState createState() => _RecuperSenhaState();
}

class _RecuperSenhaState extends State<RecuperSenha>
    with
        ComponenteImagemFundo,
        ComponenteMesagemErro,
        ComponenteImagemLogo,
        ComponenteShowDialogOnWillPop,
        ComponenteValidar,
        ComponenteCaixaDeTexto {
  ControllerLogin controllerLogin;
  TextEditingController _emailController = TextEditingController();
  GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  _validarCampos() {
    Usuario usuario = Usuario();
    usuario.email = _emailController.text.trim();
    controllerLogin.sendPasswordResetEmail(usuario);
  }

  @override
  Widget build(BuildContext context) {
    final storeLogin = Provider.of<StoreLogin>(context);
    controllerLogin = new ControllerLogin(storeLogin);

    return WillPopScope(
        child: GestureDetector(
          onTap: () {
            // este método aqui para ocultar o teclado virtual
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Scaffold(
            appBar: _appBar(),
            body: _body(),
          ),
        ),
        onWillPop: _onWillPop);
  }

  Future<bool> _onWillPop() async {
    return componenteShowDialogOnWillPop(context, controllerLogin.storeLogin.variaveisLogin.setMensagemErro(""), false);
  }

  _appBar() {
    return AppBar(
      title: Text("Recuperar Senha", style: TextStyle(color: Theme.of(context).primaryColor),),
    );
  }

  _body() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: imagemFundo(),
      padding: EdgeInsets.all(25),
      child: Center(
        child: SingleChildScrollView(
          child: _column(),
        ),
      ),
    );
  }

  Widget _column() {
    return Form(
      key: _keyForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 32),
            child: imagemLogo(),
          ),
          caixaDeTexto(
              _emailController, TextInputType.emailAddress, false, "E-mail", controllerLogin.storeLogin.validateEmail, context),
          Observer(builder: (_) {
            return controllerLogin.storeLogin.variaveisLogin.testeCarregandoBotao
                ? Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: CircularProgressIndicator(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ))
                : _columnBotoes();
          }),
        ],
      ),
    );
  }

  _columnBotoes() {
    return Column(
      children: [
        botaoAcao("Recuperar", _validarCampos, 25, 25, _keyForm, controllerLogin.storeLogin, context),
        mensagemErro(controllerLogin.storeLogin)
      ],
    );
  }
}
