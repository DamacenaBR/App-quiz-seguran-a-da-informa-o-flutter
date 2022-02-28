import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteShowDialogOnWillPop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerClassificacao/controllerClassificacao.dart';
import 'package:app_quiz_seguranca/app/stores/classificacao/storeClassificacao.dart';
import 'package:app_quiz_seguranca/app/stores/home/storeHome/storeHome.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteCirculoProgress.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteImagemFundo.dart';
import 'package:app_quiz_seguranca/app/view/telaInformacaoPontuacao/components/componenteClassificacao.dart';
import 'package:app_quiz_seguranca/app/view/telaInformacaoPontuacao/components/componentePontuacao.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TelaInformacaoPontuacao extends StatefulWidget {
  @override
  _TelaInformacaoPontuacaoState createState() =>
      _TelaInformacaoPontuacaoState();
}

class _TelaInformacaoPontuacaoState extends State<TelaInformacaoPontuacao> with ComponenteShowDialogOnWillPop{
  var circuloProgress = ComponenteCirculoProgress();
  var componenteImagemFundo = ComponenteImagemFundo();
  var componenteBodyPontuacao = ComponenteBodyPontuacao();
  var componenteBodyClassificacao = ComponenteBodyClassificacao();
  ControllerClassificacao controllerClassificacao;

  @override
  Widget build(BuildContext context) {
    final storeHome = Provider.of<StoreHome>(context);
    final storeClassificacao = Provider.of<StoreClassificacao>(context);
    controllerClassificacao =
    new ControllerClassificacao(storeHome, storeClassificacao);
    controllerClassificacao.storeClassificacao.limparDadosClassificacao();
    controllerClassificacao.qntQuestoesPorNivel(context);

    return DefaultTabController(
      length: 2,
      child: WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Progresso Quiz",
              style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
            ),
            bottom: _tabBar(),
          ),
          body: _tabyBarView(),
        ),
        onWillPop: _onWillPop,
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return componenteShowDialogOnWillPop(context, "", controllerClassificacao.storeClassificacao.testeCarregando);
  }

  Widget _tabBar() {
    return TabBar(
      labelColor: Theme.of(context).primaryColor,
      labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.black12, Colors.black38]),
          borderRadius: BorderRadius.circular(20),
          color: Colors.blueAccent),
      tabs: <Widget>[
        Tab(
          child: Text("Sua Pontuação"),
        ),
        Tab(
          child: Text("Classificação Geral"),
        ),
      ],
    );
  }

  Widget _tabyBarView() {
    return Observer(builder: (_) {
      return TabBarView(
        children: <Widget>[
          Container(
            decoration: componenteImagemFundo.imagemFundo(),
            padding: EdgeInsets.only(top: 20),
            //teste recuperar qntNumeroQuestaoPorNivel
            child: _testeBodyPontuacao(),
          ),
          Container(
            decoration: componenteImagemFundo.imagemFundo(),
            padding: EdgeInsets.only(top: 20),
            child: _testeBodyClassificao(),
          ),
        ],
      );
    });
  }

  Widget _testeBodyPontuacao() {
    return controllerClassificacao.storeClassificacao.testeCarregando
        ? circuloProgress.componenteCirculoProgress(context)
        : componenteBodyPontuacao.bodyPontuacao(
        context, controllerClassificacao);
  }

  Widget _testeBodyClassificao(){
    return controllerClassificacao.storeClassificacao.testeCarregando
        ? circuloProgress.componenteCirculoProgress(context)
        : componenteBodyClassificacao.bodyClassidicacao(
        context, controllerClassificacao);
  }
}
