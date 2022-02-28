import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerLogin/controllerLogin.dart';
import 'package:app_quiz_seguranca/app/model/usuario.dart';
import 'package:app_quiz_seguranca/app/stores/login/storeLogin/storeLogin.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteImagemFundo.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteImagemLogo.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteShowDialogOnWillPop.dart';
import 'package:app_quiz_seguranca/app/view/telaDeAutenticacao/componentsAutentication/componenteCaixaDeTexto.dart';
import 'package:app_quiz_seguranca/app/view/telaDeAutenticacao/componentsAutentication/componenteMensagemErro.dart';
import 'package:app_quiz_seguranca/app/view/telaDeAutenticacao/componentsAutentication/componenteValidar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro>
    with
        ComponenteImagemFundo,
        ComponenteMesagemErro,
        ComponenteImagemLogo,
        ComponenteCaixaDeTexto,
        ComponenteValidar,
        ComponenteShowDialogOnWillPop {
  ControllerLogin controllerLogin;
  GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController(text: "");
  TextEditingController _senhaController = TextEditingController(text: "");
  TextEditingController _nomeController = TextEditingController(text: "");

  _validarCampos() {
    Usuario usuario = Usuario();
    usuario.email = _emailController.text.trim();
    usuario.senha = _senhaController.text.trim();
    usuario.nome = _nomeController.text;
    controllerLogin.storeLogin.redefinirMensagemErro();
    controllerLogin.createUserWithEmailAndPassword(usuario, context);
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
    return componenteShowDialogOnWillPop(
        context, controllerLogin.storeLogin.variaveisLogin.setMensagemErro(""), false);
  }

  _appBar() {
    return AppBar(
      title: Text("Cadastro", style: TextStyle(color: Theme.of(context).primaryColor),),
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
          imagemLogo(),
          caixaDeTexto(_nomeController, TextInputType.text, false, "Nome", controllerLogin.storeLogin.validarNome, context),
          caixaDeTexto(
              _emailController, TextInputType.emailAddress, false, "E-mail", controllerLogin.storeLogin.validateEmail, context),
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
        botaoAcao("Cadastrar", _validarCampos, 25, 25, _keyForm, controllerLogin.storeLogin, context),
        mensagemErro(controllerLogin.storeLogin),
      ],
    );
  }
}
