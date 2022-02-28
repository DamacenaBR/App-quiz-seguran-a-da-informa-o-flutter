class Questao {
  String _pergunta;
  String _respostaA;
  String _respostaB;
  String _respostaC;
  String _respostaD;
  String _respostaCorreta;

  String get pergunta => _pergunta;
  String get respostaA => _respostaA;
  String get respostaB => _respostaB;
  String get respostaC => _respostaC;
  String get respostaD => _respostaD;
  String get respostaCorreta => _respostaCorreta;


  Questao(
    this._pergunta,
    this._respostaA,
    this._respostaB,
    this._respostaC,
    this._respostaD,
    this._respostaCorreta
  );

  Map<String, dynamic> toMap() {
    Map<dynamic, dynamic> data = Map<dynamic, dynamic>();
      data['pergunta'] = _pergunta;
      data['respostaA'] = _respostaA;
      data['respostaB'] = _respostaB;
      data['respostaC'] = _respostaC;
      data['respostaD'] = _respostaD;
      data['respostaCorreta'] = _respostaCorreta;
      return data;
  }

  Questao.fromMap(Map<dynamic, dynamic> json) {
      _pergunta = json['pergunta'];
      _respostaA = json['respostaA'];
      _respostaB = json['respostaB'];
      _respostaC = json['respostaC'];
      _respostaD = json['respostaD'];
      _respostaCorreta = json['respostaCorreta'];
  }
}