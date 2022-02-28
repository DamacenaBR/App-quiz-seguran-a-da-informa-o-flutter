// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storeQuizTeste.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreQuizTeste on _StoreQuizTesteBase, Store {
  final _$carregarPaginaQuizAtom =
      Atom(name: '_StoreQuizTesteBase.carregarPaginaQuiz');

  @override
  bool get carregarPaginaQuiz {
    _$carregarPaginaQuizAtom.reportRead();
    return super.carregarPaginaQuiz;
  }

  @override
  set carregarPaginaQuiz(bool value) {
    _$carregarPaginaQuizAtom.reportWrite(value, super.carregarPaginaQuiz, () {
      super.carregarPaginaQuiz = value;
    });
  }

  final _$respostaCorretaAtom =
      Atom(name: '_StoreQuizTesteBase.respostaCorreta');

  @override
  bool get respostaCorreta {
    _$respostaCorretaAtom.reportRead();
    return super.respostaCorreta;
  }

  @override
  set respostaCorreta(bool value) {
    _$respostaCorretaAtom.reportWrite(value, super.respostaCorreta, () {
      super.respostaCorreta = value;
    });
  }

  final _$_StoreQuizTesteBaseActionController =
      ActionController(name: '_StoreQuizTesteBase');

  @override
  dynamic setCarregarPaginaQuiz(bool value) {
    final _$actionInfo = _$_StoreQuizTesteBaseActionController.startAction(
        name: '_StoreQuizTesteBase.setCarregarPaginaQuiz');
    try {
      return super.setCarregarPaginaQuiz(value);
    } finally {
      _$_StoreQuizTesteBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setRespostaCorreta(bool value) {
    final _$actionInfo = _$_StoreQuizTesteBaseActionController.startAction(
        name: '_StoreQuizTesteBase.setRespostaCorreta');
    try {
      return super.setRespostaCorreta(value);
    } finally {
      _$_StoreQuizTesteBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carregarPaginaQuiz: ${carregarPaginaQuiz},
respostaCorreta: ${respostaCorreta}
    ''';
  }
}
