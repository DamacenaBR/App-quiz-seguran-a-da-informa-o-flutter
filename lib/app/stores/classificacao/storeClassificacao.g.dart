// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storeClassificacao.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreClassificacao on _StoreClassificacaoBase, Store {
  final _$testeCarregandoAtom =
      Atom(name: '_StoreClassificacaoBase.testeCarregando');

  @override
  bool get testeCarregando {
    _$testeCarregandoAtom.reportRead();
    return super.testeCarregando;
  }

  @override
  set testeCarregando(bool value) {
    _$testeCarregandoAtom.reportWrite(value, super.testeCarregando, () {
      super.testeCarregando = value;
    });
  }

  final _$qntQuestoesPorNivelAtom =
      Atom(name: '_StoreClassificacaoBase.qntQuestoesPorNivel');

  @override
  int get qntQuestoesPorNivel {
    _$qntQuestoesPorNivelAtom.reportRead();
    return super.qntQuestoesPorNivel;
  }

  @override
  set qntQuestoesPorNivel(int value) {
    _$qntQuestoesPorNivelAtom.reportWrite(value, super.qntQuestoesPorNivel, () {
      super.qntQuestoesPorNivel = value;
    });
  }

  final _$_StoreClassificacaoBaseActionController =
      ActionController(name: '_StoreClassificacaoBase');

  @override
  dynamic setTesteCarregando(bool value) {
    final _$actionInfo = _$_StoreClassificacaoBaseActionController.startAction(
        name: '_StoreClassificacaoBase.setTesteCarregando');
    try {
      return super.setTesteCarregando(value);
    } finally {
      _$_StoreClassificacaoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQntQuestoesPorNivel(int value) {
    final _$actionInfo = _$_StoreClassificacaoBaseActionController.startAction(
        name: '_StoreClassificacaoBase.setQntQuestoesPorNivel');
    try {
      return super.setQntQuestoesPorNivel(value);
    } finally {
      _$_StoreClassificacaoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
testeCarregando: ${testeCarregando},
qntQuestoesPorNivel: ${qntQuestoesPorNivel}
    ''';
  }
}
