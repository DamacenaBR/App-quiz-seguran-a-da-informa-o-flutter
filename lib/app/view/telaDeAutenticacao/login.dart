import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:app_quiz_seguranca/app/rotas/routeGenerator.dart';
import 'package:app_quiz_seguranca/app/view/telaDeAutenticacao/componentsAutentication/componenteCaixaDeTexto.dart';
import 'package:app_quiz_seguranca/app/view/telaDeAutenticacao/componentsAutentication/componenteRedirecionar.dart';
import 'package:app_quiz_seguranca/app/view/telaDeAutenticacao/componentsAutentication/componenteValidar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerLogin/controllerLogin.dart';
import 'package:app_quiz_seguranca/app/model/usuario.dart';
import 'package:app_quiz_seguranca/app/stores/login/storeLogin/storeLogin.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteImagemFundo.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteImagemLogo.dart';
import 'package:app_quiz_seguranca/app/view/telaDeAutenticacao/componentsAutentication/componenteMensagemErro.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>
    with
        ComponenteImagemFundo,
        ComponenteImagemLogo,
        ComponenteMesagemErro,
        ComponenteRedirecionar,
        ComponenteValidar,
        ComponenteCaixaDeTexto{

  ControllerLogin controllerLogin;
  GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController(text: "");
  TextEditingController _senhaController = TextEditingController(text: "");

  _validarCampos() {
    Usuario usuario = Usuario();
    usuario.email = _emailController.text.trim();
    usuario.senha = _senhaController.text.trim();
    controllerLogin.signInWithEmailAndPassword(usuario, context);
  }

  @override
  Widget build(BuildContext context) {
    final storeLogin = Provider.of<StoreLogin>(context);
    controllerLogin = new ControllerLogin(storeLogin);

    return GestureDetector(
      onTap: () {
        // este método aqui para ocultar o teclado virtual
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        body: _body(),
      ),
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
          Padding(
            padding: EdgeInsets.only(bottom: 8),
          ),
          caixaDeTexto(_senhaController, TextInputType.text, true, "Senha", controllerLogin.storeLogin.validarSenha, context),
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
        botaoAcao("Entrar", _validarCampos, 25, 25, _keyForm, controllerLogin.storeLogin, context),
        redirecionar(context, controllerLogin.storeLogin,
            "Não tenho conta? cadastre-se", RouteGenerator.ROTA_CADASTRO),
        Padding(
          padding: EdgeInsets.only(bottom: 2),
        ),
        redirecionar(context, controllerLogin.storeLogin, "Esqueceu a senha?",
            RouteGenerator.ROTA_RECUPERAR_SENHA),
        mensagemErro(controllerLogin.storeLogin),
      ],
    );
  }
}
