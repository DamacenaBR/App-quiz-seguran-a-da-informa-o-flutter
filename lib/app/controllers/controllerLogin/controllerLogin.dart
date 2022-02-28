import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/model/statusMensagemAuth.dart';
import 'package:app_quiz_seguranca/app/model/usuario.dart';
import 'package:app_quiz_seguranca/app/repositories/repositoryLogin/repositoryLogin.dart';
import 'package:app_quiz_seguranca/app/rotas/routeGenerator.dart';
import 'package:app_quiz_seguranca/app/stores/home/storeHome/storeHome.dart';
import 'package:app_quiz_seguranca/app/stores/quiz/storeQuiz/storeQuiz.dart';

class ControllerLogin {

  var  storeLogin;
  RepositoryLogin repositoryLogin = new RepositoryLogin();
  String _mensagemErro = "Ops: Isso não deveria ter acontecido! \nVerifique os dados ou conexão com a internet!";

  ControllerLogin(var  storeLogin) {
    this.storeLogin = storeLogin;
  }

  Future<void> verificaUsuarioLogado(context) async {
    var opSucesso = repositoryLogin.verificaUsuarioLogado(context);
    if (opSucesso == true) {
      Navigator.pushReplacementNamed(context, RouteGenerator.ROTA_HOME);
    }
    else {
      Navigator.pushReplacementNamed(context, RouteGenerator.ROTA_LOGIN);
    }
  }

  Future<void> signInWithEmailAndPassword(Usuario usuario,
      BuildContext context) async {
    storeLogin.variaveisLogin.setMensagemErro("");
    storeLogin.variaveisLogin.setTesteCarregandoBotao(true);

    StatusMensagemAuth opSucesso = await repositoryLogin.login(usuario, context);

    if (opSucesso.status) {
      storeLogin.redefinirVariavel();
      Navigator.pushReplacementNamed(context, RouteGenerator.ROTA_HOME);
    }
    else {
      if (opSucesso.mensagem == 'user-not-found') {
        storeLogin.variaveisLogin.setMensagemErro("Nenhum usuário encontrado para esse e-mail");
      } else if (opSucesso.mensagem == 'wrong-password') {
        storeLogin.variaveisLogin.setMensagemErro("Senha incorreta para esse usuário");
      }
      else{
        storeLogin.variaveisLogin.setMensagemErro(_mensagemErro);
      }
      storeLogin.variaveisLogin.setTesteCarregandoBotao(false);
    }
  }


  //verificar depois controllerQuiz
  deslogarUsuario(BuildContext context, StoreHome storeHome,
      StoreQuiz storeQuiz) async {
    var opSucesso = await repositoryLogin.deslogar(context);
    if (opSucesso == true) {
      storeQuiz.limparDadosQuiz();
      storeHome.limparDadosHome();
      Navigator.pushReplacementNamed(context, RouteGenerator.ROTA_LOGIN);
    }
  }

  //fim logar usuario

  //cadastrar usuario

  Future<void> createUserWithEmailAndPassword(Usuario usuario,
      BuildContext context) async {
    storeLogin.variaveisLogin.setTesteCarregandoBotao(true);
    storeLogin.variaveisLogin.setMensagemErro("");

    StatusMensagemAuth opSucesso = await repositoryLogin.cadastrar(usuario, context);

    if (opSucesso.status) {
      storeLogin.redefinirVariavel();
      Navigator.pushReplacementNamed(context, RouteGenerator.ROTA_HOME);
    }
    else {
      if (opSucesso.mensagem == 'email-already-in-use') {
        storeLogin.variaveisLogin.setMensagemErro("A conta já existe para esse e-mail");
      } else if (opSucesso.mensagem == 'weak-password') {
        storeLogin.variaveisLogin.setMensagemErro("A senha fornecida é muito fraca");
      }
      else{
        storeLogin.variaveisLogin.setMensagemErro(_mensagemErro);
      }
      storeLogin.variaveisLogin.setTesteCarregandoBotao(false);
    }
  }

  //fim cadastro usuario

  //inicio recuperar senha

  Future<void> sendPasswordResetEmail(Usuario usuario) async {
    storeLogin.variaveisLogin.setTesteCarregandoBotao(true);
    storeLogin.variaveisLogin.setMensagemErro("");

    StatusMensagemAuth opSucesso = await repositoryLogin.redefinirSenha(usuario);

    if (opSucesso.status) {
      storeLogin.redefinirVariavel();
      storeLogin.variaveisLogin.setMensagemErro(
          "E-mail para recuperar a senha foi enviado com sucesso");
    }
    else {
      if(opSucesso.mensagem == "user-not-found"){
        storeLogin.variaveisLogin.setMensagemErro(
            "A conta não existe para esse e-mail");
      }
      else{
        storeLogin.variaveisLogin.setMensagemErro(_mensagemErro);
      }
      storeLogin.variaveisLogin.setTesteCarregandoBotao(false);
    }
  }
}