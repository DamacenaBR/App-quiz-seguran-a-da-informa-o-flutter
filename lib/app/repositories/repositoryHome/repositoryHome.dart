import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:app_quiz_seguranca/app/model/pontuacaoUsuario.dart';

class RepositoryHome {
  FirebaseFirestore _db;
  FirebaseAuth _auth;
  RepositoryHome() {
    if (_db == null && _auth == null) {
      _db = FirebaseFirestore.instance;
      _auth = FirebaseAuth.instance;
    }
  }

  Future<PontuacaoUsuario> recuperarPontuacao() async {
    try {
      final idUsuario = _auth.currentUser.uid;
      DocumentSnapshot snapshot = await _db
          .collection("pontuacaoGlobal")
          .doc(idUsuario)
          .get();
      if (snapshot.data() != null) {
        return PontuacaoUsuario.fromMap(snapshot.data());
      } else {
        return null;
      }
    } on PlatformException catch (_) {
      return null;
    }
  }

  Future<List<String>> recuperarNiveis() async {
    try {
      List<String> listNiveis = [];
      QuerySnapshot snapshot =
          await _db.collection("questoesNiveis").get();
      if (snapshot.docs.isNotEmpty) {
        for (DocumentSnapshot item in snapshot.docs) {
          listNiveis.add(item.id);
        }
        return listNiveis;
      } else {
        return null;
      }
    } on PlatformException catch (_) {
      return null;
    }
  }

  Future<List<String>> recuperarNivelFinalizado() async {
    try {
      final idUsuario = _auth.currentUser.uid;
      List<String> listNiveis = [];
      QuerySnapshot snapshot = await _db
          .collection("usuarios")
          .doc(idUsuario)
          .collection("niveis")
          .get();

      if (snapshot.docs != null && snapshot.docs.isNotEmpty) {
        for (DocumentSnapshot item in snapshot.docs) {
          listNiveis.add(item.id);
        }
        return listNiveis;
      } else {
        return null;
      }
    } on PlatformException catch (_) {
      return null;
    }
  }

}
