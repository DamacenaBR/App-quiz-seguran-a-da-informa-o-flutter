
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/rotas/routeGenerator.dart';
import 'app/stores/classificacao/storeClassificacao.dart';
import 'app/stores/home/storeHome/storeHome.dart';
import 'app/stores/login/storeLogin/storeLogin.dart';
import 'app/stores/quiz/storeQuiz/storeQuiz.dart';
import 'app/view/outros/telaCarregamento/splash.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization =  Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Inicializar FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Verifique se há erros
        if (snapshot.hasError) {
          return Container(
            child: Text(
              "Ops: Isso não deveria ter acontecido!",
              style: TextStyle(
                  color: Color(0xff381F6C),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            color: Colors.white,
          );
        }

        // Depois de concluído, mostre seu aplicativo
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              Provider<StoreHome>(
                create: (_) => StoreHome(),
              ),
              Provider<StoreQuiz>(
                create: (_) => StoreQuiz(),
              ),
              Provider<StoreLogin>(
                create: (_) => StoreLogin(),
              ),
              Provider<StoreClassificacao>(
                create: (_) => StoreClassificacao(),
              )
            ],
            child: MaterialApp(
              home: StartPage(),
              theme: temaPadrao,
              initialRoute: "/",
              onGenerateRoute: RouteGenerator.generateRoute,
              debugShowCheckedModeBanner: false,
            ),
          );
        }

        // Caso contrário, mostre algo enquanto aguarda a conclusão da inicialização
        return Container(
          color: Colors.white,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xff381F6C)),
          ),
        );
      },
    );
  }

}

final ThemeData temaPadrao = ThemeData(
  appBarTheme: AppBarTheme(
    centerTitle: true,
    color: Colors.white,
    iconTheme: IconThemeData( color: Colors. black),
  ),
  primaryColor: colorPrimario(),

);

Color colorPrimario(){
  return Color(0xff381F6C);
}

