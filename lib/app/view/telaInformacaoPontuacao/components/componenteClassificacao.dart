import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz_seguranca/app/controllers/controllerClassificacao/controllerClassificacao.dart';
import 'package:app_quiz_seguranca/app/model/pontuacaoUsuario.dart';
import 'package:app_quiz_seguranca/app/view/componentsGlobal/componenteCirculoProgress.dart';

class ComponenteBodyClassificacao {
  var circuloProgress = ComponenteCirculoProgress();

  Widget bodyClassidicacao(
      BuildContext context, ControllerClassificacao controllerClassificacao) {
    return FutureBuilder(
      future: controllerClassificacao.recuperarClassificacao(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circuloProgress.componenteCirculoProgress(context);
        }
        List<PontuacaoUsuario> listaPontuacao = snapshot.data;
        return _listView(listaPontuacao);
      },
    );
  }

  Widget _listView(List<PontuacaoUsuario> listaPontuacao) {
    return ListView.builder(
      itemCount: listaPontuacao.length,
      itemBuilder: (BuildContext context, int index) {
        return _itemList(listaPontuacao, index, context);
      },
    );
  }

  Widget _itemList(
      List<PontuacaoUsuario> listaPontuacao, int index, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: _containerItemList(listaPontuacao, index, context),
      ),
    );
  }

  Widget _containerItemList(
      List<PontuacaoUsuario> listaPontuacao, int index, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.zero)),
      padding: EdgeInsets.only(top: 15, bottom: 15, right: 30, left: 30),
      child: _rowItemList(listaPontuacao, index),
    );
  }

  _rowItemList(List<PontuacaoUsuario> listaPontuacao, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              child: Image(
                image: AssetImage('assets/imagens/imagem_user.png'),
              ),
            ),
            _rowNomePontuacao(listaPontuacao, index),
          ],
        ),
        _containerRank(index),
      ],
    );
  }

  Widget _rowNomePontuacao(List<PontuacaoUsuario> listaPontuacao, int index) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            listaPontuacao[index].nome.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            listaPontuacao[index].pontuacao.toString() + "pts",
            style: TextStyle(color: Colors.black38, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _containerRank(int index) {
    int rank = index + 1;
    return Container(
      alignment: Alignment.center,
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: _testeCorClassificacao(rank),
        border: Border.all(width: 1.5, color: Colors.black),
        borderRadius: const BorderRadius.all(const Radius.circular(50.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: _testeCorClassificacao(index + 1),
              blurRadius: 3.0,
              offset: Offset(0.0, 0.50)
          )
        ],
      ),
      child: Text(
        (rank).toString(),
        style: TextStyle(fontSize: 17),
      ),
    );
  }

   Color _testeCorClassificacao(int rank){
    String teste = rank.toString();
    switch (teste) {
      case "1":
        return Color(0xffffed00);
      case "2":
        return Color(0xffd5d5d5);
      case "3":
        return Color(0xffe07f1f);
      default:
        return Color(0xffffffff);
    }
  }
}
