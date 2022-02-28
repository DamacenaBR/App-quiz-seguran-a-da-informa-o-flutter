// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storeHomeVariaveis.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreHomeVariaveis on _StoreHomeVariaveisBase, Store {
  final _$usuarioAtom = Atom(name: '_StoreHomeVariaveisBase.usuario');

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

  final _$testeCarregandoAtom =
      Atom(name: '_StoreHomeVariaveisBase.testeCarregando');

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

  final _$questaoDropdownAtom =
      Atom(name: '_StoreHomeVariaveisBase.questaoDropdown');

  @override
  String get questaoDropdown {
    _$questaoDropdownAtom.reportRead();
    return super.questaoDropdown;
  }

  @override
  set questaoDropdown(String value) {
    _$questaoDropdownAtom.reportWrite(value, super.questaoDropdown, () {
      super.questaoDropdown = value;
    });
  }

  final _$pontuacaoUserAtom =
      Atom(name: '_StoreHomeVariaveisBase.pontuacaoUser');

  @override
  PontuacaoUsuario get pontuacaoUser {
    _$pontuacaoUserAtom.reportRead();
    return super.pontuacaoUser;
  }

  @override
  set pontuacaoUser(PontuacaoUsuario value) {
    _$pontuacaoUserAtom.reportWrite(value, super.pontuacaoUser, () {
      super.pontuacaoUser = value;
    });
  }

  final _$listNiveisQuizAtom =
      Atom(name: '_StoreHomeVariaveisBase.listNiveisQuiz');

  @override
  List<String> get listNiveisQuiz {
    _$listNiveisQuizAtom.reportRead();
    return super.listNiveisQuiz;
  }

  @override
  set listNiveisQuiz(List<String> value) {
    _$listNiveisQuizAtom.reportWrite(value, super.listNiveisQuiz, () {
      super.listNiveisQuiz = value;
    });
  }

  final _$listNiveisQuizFinalizadoAtom =
      Atom(name: '_StoreHomeVariaveisBase.listNiveisQuizFinalizado');

  @override
  List<String> get listNiveisQuizFinalizado {
    _$listNiveisQuizFinalizadoAtom.reportRead();
    return super.listNiveisQuizFinalizado;
  }

  @override
  set listNiveisQuizFinalizado(List<String> value) {
    _$listNiveisQuizFinalizadoAtom
        .reportWrite(value, super.listNiveisQuizFinalizado, () {
      super.listNiveisQuizFinalizado = value;
    });
  }

  final _$_StoreHomeVariaveisBaseActionController =
      ActionController(name: '_StoreHomeVariaveisBase');

  @override
  dynamic setTesteCarregando(bool value) {
    final _$actionInfo = _$_StoreHomeVariaveisBaseActionController.startAction(
        name: '_StoreHomeVariaveisBase.setTesteCarregando');
    try {
      return super.setTesteCarregando(value);
    } finally {
      _$_StoreHomeVariaveisBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPontuacaoUser(PontuacaoUsuario value) {
    final _$actionInfo = _$_StoreHomeVariaveisBaseActionController.startAction(
        name: '_StoreHomeVariaveisBase.setPontuacaoUser');
    try {
      return super.setPontuacaoUser(value);
    } finally {
      _$_StoreHomeVariaveisBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQuestaoDropdown(String value) {
    final _$actionInfo = _$_StoreHomeVariaveisBaseActionController.startAction(
        name: '_StoreHomeVariaveisBase.setQuestaoDropdown');
    try {
      return super.setQuestaoDropdown(value);
    } finally {
      _$_StoreHomeVariaveisBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUsuario(Usuario value) {
    final _$actionInfo = _$_StoreHomeVariaveisBaseActionController.startAction(
        name: '_StoreHomeVariaveisBase.setUsuario');
    try {
      return super.setUsuario(value);
    } finally {
      _$_StoreHomeVariaveisBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setListNiveisQuiz(List<String> value) {
    final _$actionInfo = _$_StoreHomeVariaveisBaseActionController.startAction(
        name: '_StoreHomeVariaveisBase.setListNiveisQuiz');
    try {
      return super.setListNiveisQuiz(value);
    } finally {
      _$_StoreHomeVariaveisBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setListNiveisQuizFinalizado(List<String> value) {
    final _$actionInfo = _$_StoreHomeVariaveisBaseActionController.startAction(
        name: '_StoreHomeVariaveisBase.setListNiveisQuizFinalizado');
    try {
      return super.setListNiveisQuizFinalizado(value);
    } finally {
      _$_StoreHomeVariaveisBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
testeCarregando: ${testeCarregando},
questaoDropdown: ${questaoDropdown},
pontuacaoUser: ${pontuacaoUser},
listNiveisQuiz: ${listNiveisQuiz},
listNiveisQuizFinalizado: ${listNiveisQuizFinalizado}
    ''';
  }
}
