import 'package:app_quiz_seguranca/app/model/pontuacaoUsuario.dart';
import 'package:app_quiz_seguranca/app/model/questoes.dart';
import 'package:app_quiz_seguranca/app/model/questoesList.dart';
import 'package:mobx/mobx.dart';

part 'storeQuizVariaveis.g.dart';

class StoreQuizVariaveis = _StoreQuizVariaveisBase with _$StoreQuizVariaveis;

abstract class _StoreQuizVariaveisBase with Store {

  @observable
  Questao questao;

  @observable
  QuestaoList listQuestoes;

  @observable
  int numeroQuestao = 0;

  //operação de teste de pontuação usuario
  @observable
  int pontuacao = 0;

  //salvar Pontuacao global
  @observable
  PontuacaoUsuario pontuacaoUsuario;

  //recupera a ultima questao selecionada pelo usuario
  @observable
  String ultimaQuestaoSelecionado = "";

  @observable
  String respostaDialig = "";

  @action
  setQuestoao(Questao value) => questao = value;

  @action
  setListQuestoes(List<Questao> value) {
    listQuestoes = new QuestaoList(value);
  }

  @action
  setNumeroQuestao(int value) => numeroQuestao = value;

  @action
  setPontuacao(int value) => pontuacao = value;

  @action
  setPontuacaoUsuario(PontuacaoUsuario value) => pontuacaoUsuario = value;

  @action
  setUltimaQuestaoSelecionado(String value) => ultimaQuestaoSelecionado = value;

  @action
  setRespostaDialog(String value) => respostaDialig = value;
}
