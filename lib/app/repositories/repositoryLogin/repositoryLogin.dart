import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_quiz_seguranca/app/model/statusMensagemAuth.dart';
import 'package:app_quiz_seguranca/app/model/usuario.dart';

class RepositoryLogin {
  FirebaseAuth _auth;
  FirebaseFirestore _db;

  RepositoryLogin() {
    if (_db == null && _auth == null) {
      _auth = FirebaseAuth.instance;
      _db = FirebaseFirestore.instance;
    }
  }

  bool verificaUsuarioLogado(context) {
    try {
      final usuarioLogado = _auth.currentUser;

      if (usuarioLogado != null) {
        return true;
      } else {
        return false;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  Future<StatusMensagemAuth> login(
      Usuario usuario, BuildContext context) async {
    var teste;
    StatusMensagemAuth mensagemAuth;
    try {
      teste = await _auth
          .signInWithEmailAndPassword(
        email: usuario.email,
        password: usuario.senha,
      )
          .catchError((error) {
        mensagemAuth = new StatusMensagemAuth(error.code.toString(), false);
        teste = null;
      });
      if (teste != null) {
        return mensagemAuth = new StatusMensagemAuth("", true);
      } else {
        return mensagemAuth;
      }
    } on PlatformException catch (_) {
      return new StatusMensagemAuth("", false);
    }
  }

  Future<bool> deslogar(BuildContext context) async {
    _auth.signOut();
    return true;
  }

  Future<StatusMensagemAuth> cadastrar(
      Usuario usuario, BuildContext context) async {
    var teste;
    StatusMensagemAuth mensagemAuth;
    try {
      teste = await _auth
          .createUserWithEmailAndPassword(
        email: usuario.email,
        password: usuario.senha,
      )
          .catchError((error) {
        mensagemAuth = new StatusMensagemAuth(error.code.toString(), false);
        teste = null;
      });
      if (teste != null) {
        final idUsuario = _auth.currentUser.uid;
        _salveUsuario(usuario, idUsuario);
        _salvarTotalPontos(usuario, idUsuario);
        return mensagemAuth = new StatusMensagemAuth("", true);
      } else {
        return mensagemAuth;
      }
    } on PlatformException catch (_) {
      return new StatusMensagemAuth("", false);
    }
  }

  Future<void> _salveUsuario(Usuario usuario, String idUsuario) async {
    await _db.collection("usuarios").doc(idUsuario).set({
      "nome": usuario.nome,
    });
  }

  Future<void> _salvarTotalPontos(Usuario usuario, String idUsuario) async {
    await _db.collection("pontuacaoGlobal").doc(idUsuario).set({
      "nome": usuario.nome,
      "pontuacao": 0,
    });
  }

  Future<StatusMensagemAuth> redefinirSenha(Usuario usuario) async {
    bool teste = false;
    StatusMensagemAuth mensagemAuth;
    try {
      await _auth.sendPasswordResetEmail(email: usuario.email).then((value) {
        teste = true;
      }).catchError((error) {
        mensagemAuth = new StatusMensagemAuth(error.code.toString(), false);
        teste = false;
      });
      if (teste) {
        return mensagemAuth = new StatusMensagemAuth("", true);
      } else {
        return mensagemAuth;
      }
    } on PlatformException catch (_) {
      return new StatusMensagemAuth("", false);
    }
  }
}
