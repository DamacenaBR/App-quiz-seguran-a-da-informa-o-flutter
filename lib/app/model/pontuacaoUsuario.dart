class PontuacaoUsuario {
  String _nome;
  int _pontuacao;

  String get nome => _nome;
  set nome(String value) {
    this._nome = value;
  }

  int get pontuacao => _pontuacao;
  set pontuacao(int value) {
    this._pontuacao = value;
  }

  PontuacaoUsuario(
      this._nome,
      this._pontuacao,
      );

  Map<String, dynamic> toMap() {
    Map<dynamic, dynamic> data = Map<dynamic, dynamic>();
    data['nome'] = _nome;
    data['pontuacao'] = _pontuacao;
    return data;
  }

  PontuacaoUsuario.fromMap(Map<dynamic, dynamic> json) {
    _nome = json['nome'];
    _pontuacao = json['pontuacao'];
  }
}