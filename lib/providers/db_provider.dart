import 'package:first_flutter/db/db_helper.dart';
import 'package:first_flutter/db/todo_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final todoListProvider = FutureProvider.autoDispose<List<Todo>>((ref) async {
//   final list = await DBHelper().getTodoList();
//   return list;
// });

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super([]);

  Future<void> addTodo(Todo todo) async {
    await DBHelper().insertTodo(todo);
    state = await DBHelper().getTodoList();
  }

  Future<void> fetchTodoList() async {
    state = await DBHelper().getTodoList();
  }
}

final todoListProvider = StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier();
});