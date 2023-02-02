class Clientes {
  int? id;
  String? nome;
  String? celular;
  String? endereco;
  String? dtnasc;
  String? notas;

  Clientes({
    this.id,
    required this.nome,
    required this.celular,
    required this.endereco,
    required this.dtnasc,
    required this.notas,
  });

  // MÉTODO QUE CONVERTE string para map
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'nome': nome,
      'celular': celular,
      'endereco': endereco,
      'dtnasc': dtnasc,
      'notas': notas,
    };

    return map;
  }

  Clientes.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    celular = map['celular'];
    endereco = map['endereco'];
    dtnasc = map['dtnasc'];
    notas = map['notas'];
  }
}
