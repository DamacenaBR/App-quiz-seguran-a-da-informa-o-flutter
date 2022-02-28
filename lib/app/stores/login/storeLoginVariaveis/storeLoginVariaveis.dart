import 'package:app_quiz_seguranca/app/model/usuario.dart';
import 'package:mobx/mobx.dart';

part 'storeLoginVariaveis.g.dart';

class StoreLoginVariaveis = _StoreLoginVariaveisBase with _$StoreLoginVariaveis;

abstract class _StoreLoginVariaveisBase with Store {

  @observable
  Usuario usuario;

  @observable
  bool testeCarregandoBotao = false;

  @observable
  String mensagemErro = "";

  @action
  setTesteCarregandoBotao(bool value) => testeCarregandoBotao = value;

  @action
  setMensagemErro(String value) => mensagemErro = value;

  @action
  setUsuario(Usuario value) => usuario = value;

}
