import 'package:app_quiz_seguranca/app/repositories/respositoryConection/respositoryConection.dart';
import 'package:app_quiz_seguranca/app/repositories/respositoryConection/respositoryConection.dart';

class ControllerConection{

  RespositoryConection respositoryConection;

  ControllerConection(){
    respositoryConection = RespositoryConection();
  }

  Future<bool> conectadoRede() async {
    bool concectividade = await respositoryConection.conectadoRede();
    if(concectividade){
      return true;
    }
    else{
      return false;
    }
  }
}
