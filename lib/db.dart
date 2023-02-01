import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  // Construtor com acesso privado
  DB._();
  // Criar uma instancia do DB
  static final DB instance = DB._();
  // Criar a instancia do SQLite
  static Database? _database;
  // se o bancoja estiver inicializado ele tras senao inicializa
  get database async {
    if (_database != null) {
      return _database;
    }
    return await _initDatabase();
  }

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
      dt_nasc TEXT
    )
  ''';
}
