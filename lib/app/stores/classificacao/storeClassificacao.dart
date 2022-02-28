import 'package:mobx/mobx.dart';

part 'storeClassificacao.g.dart';

class StoreClassificacao = _StoreClassificacaoBase with _$StoreClassificacao;

abstract class _StoreClassificacaoBase with Store {

  @observable
  bool testeCarregando = true;

  @observable
  int qntQuestoesPorNivel = 0;

  @action
  setTesteCarregando(bool value) => testeCarregando = value;

  @action
  setQntQuestoesPorNivel(int value) => qntQuestoesPorNivel = value;


  void limparDadosClassificacao(){
    setQntQuestoesPorNivel(0);
  }
}
