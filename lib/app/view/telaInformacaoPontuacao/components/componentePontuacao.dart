import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerClassificacao/controllerClassificacao.dart';
import 'package:app_quiz_seguranca/app/model/pontuacaoUsuario.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteCirculoProgress.dart';

class ComponenteBodyPontuacao {

  var circuloProgress = ComponenteCirculoProgress();

  Widget bodyPontuacao(
      BuildContext context, ControllerClassificacao controllerClassificacao) {
    return FutureBuilder(
      future: controllerClassificacao.recuperarListPontuacaoUser(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circuloProgress.componenteCirculoProgress(context);
        }
        if (snapshot.data.isEmpty) {
          return _contannerPontuacaoVazio("Ops: ainda não jogou!!!", context);
        } else {
          List<PontuacaoUsuario> listaPontuacao = snapshot.data;
          return _listView(listaPontuacao,
              controllerClassificacao.storeClassificacao.qntQuestoesPorNivel);
        }
      },
    );
  }

  Widget _contannerPontuacaoVazio(String text, BuildContext context) {
    return Container(
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ));
  }

  Widget _listView(
      List<PontuacaoUsuario> listaPontuacao, int qntQuestoesPorNivel) {
    return ListView.builder(
      itemCount: listaPontuacao.length,
      itemBuilder: (BuildContext context, int index) {
        return _itemList(listaPontuacao, index, context, qntQuestoesPorNivel);
      },
    );
  }

  Widget _itemList(List<PontuacaoUsuario> listaPontuacao, int index,
      BuildContext context, int qntQuestoesPorNivel) {
    return SingleChildScrollView(
      child: _containerItemList(
          listaPontuacao, index, context, qntQuestoesPorNivel),
    );
  }

  Widget _containerItemList(List<PontuacaoUsuario> listaPontuacao, int index,
      BuildContext context, int qntQuestoesPorNivel) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            _containerSuperior(listaPontuacao, index, qntQuestoesPorNivel),
            Positioned(
              top: 20,
              child: _containerInferior(
                  listaPontuacao, index, context, qntQuestoesPorNivel),
            )
          ],
        ));
  }

  Widget _containerSuperior(List<PontuacaoUsuario> listaPontuacao, int index,
      int qntQuestoesPorNivel) {
    return Container(
      width: 200,
      height: 70,
      padding: EdgeInsets.only(left: 8, top: 2, bottom: 2, right: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: colorContanerSuperior(index)),
      child: Column(
        children: [
          _containerRowSuperior(listaPontuacao, index, qntQuestoesPorNivel),
        ],
      ),
    );
  }

  Widget _containerRowSuperior(List<PontuacaoUsuario> listaPontuacao, int index,
      int qntQuestoesPorNivel) {
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              listaPontuacao[index].nome.toString(),
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(listaPontuacao[index].pontuacao.toString(),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)
                  // ),
                ),
                Text("/" + qntQuestoesPorNivel.toString(),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)
                  // ),
                )
              ],
            )
          ],
        ));
  }

  Widget _containerInferior(List<PontuacaoUsuario> listaPontuacao, int index,
      BuildContext context, int qntQuestoesPorNivel) {
    return Container(
      width: 200,
      height: 50,
      padding: EdgeInsets.only(left: 8, top: 2, bottom: 2, right: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: colorContanerInferior(index)),
      child: Column(
        children: [
          _containerTextInferior(
              listaPontuacao, index, context, qntQuestoesPorNivel),
        ],
      ),
    );
  }

  Widget _containerTextInferior(List<PontuacaoUsuario> listaPontuacao,
      int index, BuildContext context, int qntQuestoesPorNivel) {
    return Container(
        padding: EdgeInsets.only(top: 6),
        alignment: Alignment.center,
        child: Text(
          _pocentagem(listaPontuacao[index].pontuacao, qntQuestoesPorNivel)
              .toString() +
              "%",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          // ),
        ));
  }


  double _pocentagem(int valor, int qntQuestoesPorNivel) {
    return ((valor / qntQuestoesPorNivel) * 100);
  }

  bool testeColor(int num) {
    return num % 2 == 0 ? true : false;
  }

  Color colorContanerSuperior(int num){
    return testeColor(num) ? Color(0xff1F476C) : Color(0xff466C1F);
  }

  Color colorContanerInferior(int num){
    return testeColor(num) ? Color(0xff4480B8) : Color(0xff55C22E);
  }

}
