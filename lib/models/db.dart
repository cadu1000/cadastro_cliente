// ignore_for_file: non_constant_identifier_names

import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' show join;
import 'package:atendimento_domiciliar/models/clients_model.dart';

class DB {
  // Construtor com acesso privado
  //DB._();
  // Criar uma instancia do DB
  static final DBinstance = DB();
  // Criar a instancia do SQLite
  static Database? _database;
  // se o bancoja estiver inicializado ele tras senao inicializa
  get database async {
    if (_database != null) {
      return _database;
    }
    return await _initDatabase();
  }

  get celular => null;

  get nome => null;

  get endereco => null;

  get notas => null;

  get dtnasc => null;

  get clientes => null;

  get id => null;

  _initDatabase() async {
    // aplicativo é o nome do banco de dados
    return await openDatabase(
      join(await getDatabasesPath(), 'aplicativo.db'),
      version: 1,
      // sera executado apenas na primeira vez para criar
      onCreate: _onCreate,
    );
  }

  _onCreate(db, version) async {
    // crar as tabelas, no meu caso, apenas 1
    await db.execute(_cadastrocliente);
  }

  // criar as estruturas das tabelas
  // ''' para escrever strings em bloco e
  // dentro o codigo sql
  String get _cadastrocliente => '''
    CREATE TABLE cadastrocliente (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      celular TEXT,
      endereco TEXT,
      dtnasc TEXT,
      notas TEXT
    )
  ''';

  // FUNÇÃO PARA ADICIONAR CLIENTE
  Future<int> adcionaCliente(Clientes clientes) async {
    Database db = await database;
    return await db.insert(_cadastrocliente, clientes.toMap());
  }

  // FUNÇÃO DE PESQUISA QUE RETORNA UM CLIENTE PELO ID
  Future<Clientes?> retornaCliente(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(_cadastrocliente,
        columns: [
          nome,
          celular,
          endereco,
          dtnasc,
          notas,
        ],
        where: "$id = ?",
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return clientes.fromJson(maps.first);
    }
    return null;
  }

  // ATUALIZAR UM OBJETO cliente e SALVAR NO BANCO DE DADOS (SOMENTE O QUE TEM O MESMO ID QUE ESTOU PASSANDO)
  Future<int> atualizaCliente(Clientes clientes) async {
    var db = await database;
    // ignore: unused_local_variable
    var resultado = await db.update(
      _cadastrocliente,
      clientes.toMap(),
      where: "$id = ?",
      whereArgs: [clientes.id],
    );
    return resultado;
  }

  // DELETAR UM OBJETO DO BANCO DE DADOS, (SOMENTE O QUE TEM O MESMO ID QUE ESTOU PASSANDO)
  Future<int> deletarCliente(int id) async {
    var db = await database;
    int resultado = await db.delete(
      _cadastrocliente,
      where: "$id = ?",
      whereArgs: [id],
    );
    return resultado;
  }

  // RETORNAR QUANTOS REGISTROS EU TENHO NO BANCO DE DADOS
  Future<int?> contaCliente() async {
    Database db = await database;
    List<Map<String, dynamic>> lista =
        await db.rawQuery('SELECT COUNT (*) FROM $_cadastrocliente');
    int? resultado = Sqflite.firstIntValue(lista);
    return resultado;
  }

  // FECHAR O BANCO DE DADOS
  Future fechaDB() async {
    Database db = await database;
    db.close();
  }

  //TRAZER TODOS OS REGISTROS
  Future<List> todosClientes() async {
    Database db = await database;
    var resultado = await db.query(_cadastrocliente);

    List<Clientes> lista = resultado.isNotEmpty
        ? resultado.map((e) => Clientes.fromMap(e)).toList()
        : [];

    return lista;
  }
}
