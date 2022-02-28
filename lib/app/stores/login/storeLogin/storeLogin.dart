import 'package:app_quiz_seguranca/app/stores/login/storeLoginVariaveis/storeLoginVariaveis.dart';
import 'package:mobx/mobx.dart';

part 'storeLogin.g.dart';

class StoreLogin = _StoreLoginBase with _$StoreLogin;

abstract class _StoreLoginBase with Store {

  var variaveisLogin = StoreLoginVariaveis();

  redefinirMensagemErro(){
    variaveisLogin.setMensagemErro("");
  }

  redefinirVariavel(){
    variaveisLogin.setTesteCarregandoBotao(false);
  }

  String validarNome(String nome) {
    nome = nome.trim();
    if (nome.length < 3) {
      return "Digite mais que 3 caracteres para nome";
    } else if (nome.length >= 10) {
      return "Digite menos que 10 caracteres para nome";
    }
    return null;
  }

  String validateEmail(String email) {
    Pattern pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = new RegExp(pattern);
    if(!regex.hasMatch(email)){
      return "Use o formato: xxxx@xxx.xxx";
    }
    return null;
  }

  String validarSenha(String senha){
    Pattern pattern =
        r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$";
    RegExp regex = new RegExp(pattern);
    if(senha.length < 6){
      return "Digite mais que 5 caracteres para senha";
    }
    else if(!regex.hasMatch(senha)){
      return "Use o formato: letra e numeros ex: xxxxx1";
    }
    return null;
  }
}
