import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/models/todo_model.dart';

class ConnectDatabase {
  static Database? _database;

  ConnectDatabase._init();

  static final ConnectDatabase instance = ConnectDatabase._init();

// create a getter and open a connection in db
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initialdatabase("todo.db");
    return _database!;
  }

  _initialdatabase(String filePath) async {
    String dbpath = await getDatabasesPath();
    const dbname = "todo.db";
    String path = join(dbpath, dbname);

    _database = await openDatabase(path, version: 1, onCreate: _oncreate);
    return _database!;
  }

  Future _oncreate(Database db, int version) async {
    return await db.execute('''
        CREATE TABLE todo (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          creationdate TEXT,
          ischecked INTEGER
          )''');
  }

  Future<void> inserttodo(Todo todo) async {
    Database? db = await instance.database;
    await db.insert(
      'todo',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleletodo(Todo todo) async {
    Database? db = await instance.database;
    await db.delete('todo', where: 'id == ?', whereArgs: [todo.id]);
  }

  // function fetch all the data to save our database
  Future<List<Todo>> getTodo() async {
    Database? db = await instance.database;
    List<Map<String, dynamic>> queryresult =
        await db.query('todo', orderBy: 'id DESC');
    return List.generate(
      queryresult.length,
      (i) => Todo(
        id: queryresult[i]['id'],
        title: queryresult[i]['title'],
        creationdate: DateTime.parse(queryresult[i]['creationdate']),
        ischecked: queryresult[i]['ischecked'] == 1 ? true : false,
      ),
    );
  }
}
