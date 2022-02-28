import 'package:app_quiz_seguranca/app/model/pontuacaoUsuario.dart';
import 'package:app_quiz_seguranca/app/model/usuario.dart';
import 'package:mobx/mobx.dart';

part 'storeHomeVariaveis.g.dart';

class StoreHomeVariaveis = _StoreHomeVariaveisBase with _$StoreHomeVariaveis;

abstract class _StoreHomeVariaveisBase with Store {

  @observable
  Usuario usuario;

  @observable
  bool testeCarregando = true;

  @observable
  String questaoDropdown = "";

  @observable
  PontuacaoUsuario pontuacaoUser;

  @observable
  List<String> listNiveisQuiz;

  @observable
  List<String> listNiveisQuizFinalizado;

  @action
  setTesteCarregando(bool value) => testeCarregando = value;

  @action
  setPontuacaoUser(PontuacaoUsuario value) => pontuacaoUser = value;

  @action
  setQuestaoDropdown(String value) => questaoDropdown = value;

  @action
  setUsuario(Usuario value) => usuario = value;

  @action
  setListNiveisQuiz(List<String> value) => listNiveisQuiz = value;

  @action
  setListNiveisQuizFinalizado(List<String> value) => listNiveisQuizFinalizado = value;
}
