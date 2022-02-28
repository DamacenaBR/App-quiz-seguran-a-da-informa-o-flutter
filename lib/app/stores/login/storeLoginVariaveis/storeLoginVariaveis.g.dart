// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storeLoginVariaveis.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreLoginVariaveis on _StoreLoginVariaveisBase, Store {
  final _$usuarioAtom = Atom(name: '_StoreLoginVariaveisBase.usuario');

  @override
  Usuario get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(Usuario value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  final _$testeCarregandoBotaoAtom =
      Atom(name: '_StoreLoginVariaveisBase.testeCarregandoBotao');

  @override
  bool get testeCarregandoBotao {
    _$testeCarregandoBotaoAtom.reportRead();
    return super.testeCarregandoBotao;
  }

  @override
  set testeCarregandoBotao(bool value) {
    _$testeCarregandoBotaoAtom.reportWrite(value, super.testeCarregandoBotao,
        () {
      super.testeCarregandoBotao = value;
    });
  }

  final _$mensagemErroAtom =
      Atom(name: '_StoreLoginVariaveisBase.mensagemErro');

  @override
  String get mensagemErro {
    _$mensagemErroAtom.reportRead();
    return super.mensagemErro;
  }

  @override
  set mensagemErro(String value) {
    _$mensagemErroAtom.reportWrite(value, super.mensagemErro, () {
      super.mensagemErro = value;
    });
  }

  final _$_StoreLoginVariaveisBaseActionController =
      ActionController(name: '_StoreLoginVariaveisBase');

  @override
  dynamic setTesteCarregandoBotao(bool value) {
    final _$actionInfo = _$_StoreLoginVariaveisBaseActionController.startAction(
        name: '_StoreLoginVariaveisBase.setTesteCarregandoBotao');
    try {
      return super.setTesteCarregandoBotao(value);
    } finally {
      _$_StoreLoginVariaveisBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMensagemErro(String value) {
    final _$actionInfo = _$_StoreLoginVariaveisBaseActionController.startAction(
        name: '_StoreLoginVariaveisBase.setMensagemErro');
    try {
      return super.setMensagemErro(value);
    } finally {
      _$_StoreLoginVariaveisBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUsuario(Usuario value) {
    final _$actionInfo = _$_StoreLoginVariaveisBaseActionController.startAction(
        name: '_StoreLoginVariaveisBase.setUsuario');
    try {
      return super.setUsuario(value);
    } finally {
      _$_StoreLoginVariaveisBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
testeCarregandoBotao: ${testeCarregandoBotao},
mensagemErro: ${mensagemErro}
    ''';
  }
}
