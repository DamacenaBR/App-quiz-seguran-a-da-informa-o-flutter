import 'package:mobx/mobx.dart';

part 'storeQuizTeste.g.dart';

class StoreQuizTeste = _StoreQuizTesteBase with _$StoreQuizTeste;

abstract class _StoreQuizTesteBase with Store {

  //teste se os dados foi carregado com sucesso
  @observable
  bool carregarPaginaQuiz = true;

  //teste resposta correta
  @observable
  bool respostaCorreta;

  @action
  setCarregarPaginaQuiz(bool value) => carregarPaginaQuiz = value;

  @action
  setRespostaCorreta(bool value) => respostaCorreta = value;

}
