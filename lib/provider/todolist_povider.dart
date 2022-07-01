import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo/model/todo_model.dart';
import 'package:riverpod_todo/widgets/todo.dart';

final todoListProvider = StateNotifierProvider<TodoList, List<Todo>>((ref) {
  return TodoList([
    Todo(id: 'todo-0', description: 'Bye Apple'),
    Todo(id: 'todo-1', description: 'Bye Mango'),
    Todo(id: 'todo-2', description: 'Bye Banana'),
  ]);
});

final todoListProvider2 = StateNotifierProvider<TodoList, List<Todo>>((ref) {
  return TodoList([]);
});
