class Usuario {
  String nome;
  String email;
  String senha;

  Usuario();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "nome": this.nome,
      "email": this.email,
    };
    return map;
  }

  Usuario.fromJson(Map<dynamic, dynamic> json) {
    nome = json['nome'];
    senha = json['senha'];
    email = json['email'];
  }

}
