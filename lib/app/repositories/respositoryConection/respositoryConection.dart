import 'dart:io';

class RespositoryConection{


  Future<bool> conectadoRede() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 10));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      else{
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }
}