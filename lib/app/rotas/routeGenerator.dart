import 'package:app_quiz_seguranca/app/view/home/home.dart';
import 'package:app_quiz_seguranca/app/view/outros/telaCarregamento/splash.dart';
import 'package:app_quiz_seguranca/app/view/outros/telaErroCarregamento/telaErroCarregamento.dart';
import 'package:app_quiz_seguranca/app/view/outros/telaPontuacao/telaPontuacaoQuiz.dart';
import 'package:app_quiz_seguranca/app/view/telaDeAutenticacao/cadastro.dart';
import 'package:app_quiz_seguranca/app/view/telaDeAutenticacao/login.dart';
import 'package:app_quiz_seguranca/app/view/telaDeAutenticacao/recuperarSenha.dart';
import 'package:app_quiz_seguranca/app/view/telaInformacaoPontuacao/telaInformacaoPontuacao.dart';
import 'package:app_quiz_seguranca/app/view/telaQuiz/quizPage.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String ROTA_HOME = "/login";
  static const String ROTA_LOGIN = "/home";
  static const String ROTA_CADASTRO = "/cadastro";
  static const String ROTA_CONFIGURACOES = "/configuracoes";
  static const String ROTA_MENSAGENS = "/mensagens";
  static const String ROTA_RECUPERAR_SENHA = "/recuperarSenha";
  static const String ROTA_TELA_QUIZ = "/quizPage";
  static const String ROTA_ERRO_CARREGAMENTO = "/erroCarregamento";
  static const String ROTA_TELA_PONTUACAO = "/telaPontuacao";
  static const String ROTA_TELA_CLASSIFICACAO = "/telaClassificacao";
  static const String ROTA_TELA_PONTUACAO_USUARIO = "/telaPontuacaoUsuario";
  static const String ROTA_TELA_INFORMACAO_PONTUACAO = "/telaInformacaoPontuacao";


  static Route<dynamic> generateRoute(RouteSettings settings) {
    final List argumentos = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => StartPage());
      case ROTA_LOGIN:
        return MaterialPageRoute(builder: (_) => Login());
      case ROTA_HOME:
        return MaterialPageRoute(builder: (_) => Home());
      case ROTA_CADASTRO:
        return MaterialPageRoute(builder: (_) => Cadastro());
      case ROTA_RECUPERAR_SENHA:
        return MaterialPageRoute(builder: (_) => RecuperSenha());
      case ROTA_TELA_QUIZ:
        return MaterialPageRoute(builder: (_) => QuizPage(argumentos[0]));
      case ROTA_ERRO_CARREGAMENTO:
        return MaterialPageRoute(builder: (_) => TelaErroCarregamento());
      case ROTA_TELA_PONTUACAO:
        return MaterialPageRoute(builder: (_) => TelaPontuacao(pontuacao: argumentos[0], totalQuestao: argumentos[1],));
      case ROTA_TELA_INFORMACAO_PONTUACAO:
        return MaterialPageRoute(builder: (_) => TelaInformacaoPontuacao());
      default:
        return _erroRota();
    }
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Tela não encontrada!"),
        ),
        body: Center(
          child: Text("Tela não encontrada!"),
        ),
      );
    });
  }
}
