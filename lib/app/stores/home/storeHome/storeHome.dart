import 'package:app_quiz_seguranca/app/stores/home/storeHomeVariaveis/storeHomeVariaveis.dart';
import 'package:mobx/mobx.dart';

part 'storeHome.g.dart';

class StoreHome = _StoreHomeBase with _$StoreHome;

abstract class _StoreHomeBase with Store {

  var variaveisHome = StoreHomeVariaveis();

  void limparDadosHome(){
    variaveisHome.setUsuario(null);
    variaveisHome.setQuestaoDropdown("");
    variaveisHome.setPontuacaoUser(null);
  }

}
