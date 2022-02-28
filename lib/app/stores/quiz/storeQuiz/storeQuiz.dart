
import 'package:app_quiz_seguranca/app/model/questoes.dart';
import 'package:app_quiz_seguranca/app/stores/quiz/storeQuizTesteQuiz/storeQuizTeste.dart';
import 'package:app_quiz_seguranca/app/stores/quiz/storeVariaveisQuiz/storeQuizVariaveis.dart';
import 'package:mobx/mobx.dart';

part 'storeQuiz.g.dart';

class StoreQuiz = _StoreQuizBase with _$StoreQuiz;

abstract class _StoreQuizBase with Store {

  var variaveisQuiz = StoreQuizVariaveis();
  var variaveisDeTeste = StoreQuizTeste();

  void limparDadosQuiz(){
    List<Questao> listaVazia = [];
    variaveisQuiz.setQuestoao(null);
    variaveisQuiz.setListQuestoes(listaVazia);
    variaveisQuiz.setNumeroQuestao(0);
    variaveisQuiz.setPontuacao(0);
    variaveisQuiz.setPontuacaoUsuario(null);
    variaveisQuiz.setUltimaQuestaoSelecionado("");
    variaveisQuiz.setRespostaDialog("");
  }


//reiniciando variaveis
  void disposeQuiz() {
    //reiniciando teste esperar recuperar dados quiz
    variaveisDeTeste.setCarregarPaginaQuiz(true);
    //reiniciando numero quetoes obs: utilzado para testar chamada das questoes metodo _init()
    variaveisQuiz.setNumeroQuestao(0);
    variaveisQuiz.setPontuacao(0);
  }

}



