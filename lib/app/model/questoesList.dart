
import 'package:app_quiz_seguranca/app/model/questoes.dart';

class QuestaoList{

  final List<Questao> _quizQuestaoList;
  int _indeceQuestaoAtual = -1;

  QuestaoList(this._quizQuestaoList){
    _quizQuestaoList.shuffle();
  }

  int get tamanho => _quizQuestaoList.length;
  int get questaoNumero => _indeceQuestaoAtual + 1;
  List<Questao> get returnList => _quizQuestaoList;

  Questao get proximaQuestao{
    _indeceQuestaoAtual++;

    if(_indeceQuestaoAtual > tamanho){
      return null;
    }

    return _quizQuestaoList[_indeceQuestaoAtual];
  }
}