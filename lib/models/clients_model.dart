class Clientes {
  String? id;
  String? nome;
  String? celular;
  String? endereco;
  String? dtnasc;
  bool? keepOn;

  Clientes(
      {this.id,
      this.nome,
      this.celular,
      this.endereco,
      this.dtnasc,
      this.keepOn});

  Clientes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    celular = json['celular'];
    endereco = json['endereco'];
    dtnasc = json['dtnasc'];
    keepOn = json['keepOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['celular'] = celular;
    data['endereco'] = endereco;
    data['dtnasc'] = dtnasc;
    data['keepOn'] = keepOn;
    return data;
  }
}
