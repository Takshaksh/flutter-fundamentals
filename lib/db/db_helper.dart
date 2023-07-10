import 'package:first_flutter/db/todo_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{

  final String tableTodo = 'todos';
  final String columnId = 'id';
  final String columnTitle = 'title';
  final String columnStatus = 'status';

  Future<Database> initDatabase() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'todo.db'),

      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $tableTodo(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, status INTEGER NOT NULL)');
      },

      version: 1
    );

    return database;
  }

  Future<int> insertTodo(Todo todo) async {
    final db = await initDatabase();

    return await db.insert(tableTodo, todo.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> updateTodo(Todo todo) async {
    final db = await initDatabase();

    return await db.update(tableTodo, todo.toMap(), where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<List<Todo>> getTodoList() async {
    final db = await initDatabase();

    final dataList = await db.query(tableTodo, orderBy: columnId);
    
    return dataList.map((todo) {
      return Todo.fromMap(todo);
    }).toList();
  }

}