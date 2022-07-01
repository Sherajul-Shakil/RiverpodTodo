import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo/enum.dart';
import 'package:riverpod_todo/model/todo_model.dart';
import 'package:riverpod_todo/provider/todolist_povider.dart';

final todoListFilter = StateProvider((_) => TodoListFilter.all);
final todoSearchFilter = StateProvider((_) => "");

final uncompletedTodosCount = Provider<int>((ref) {
  return ref.watch(todoListProvider).where((todo) => !todo.completed).length;
});

final filteredTodos = Provider<List<Todo>>((ref) {
  final filter = ref.watch(todoListFilter);
  final search = ref.watch(todoSearchFilter);
  final todos = ref.watch(todoListProvider);

  List<Todo> filteredTodos;
  switch (filter) {
    case TodoListFilter.completed:
      filteredTodos = todos.where((todo) => todo.completed).toList();
      break;
    case TodoListFilter.active:
      filteredTodos = todos.where((todo) => !todo.completed).toList();
      break;
    case TodoListFilter.all:
      filteredTodos = todos;
  }
  if (search.isEmpty) {
    return filteredTodos;
  } else {
    return filteredTodos
        .where((todo) => todo.description.contains(search))
        .toList();
  }

  //return filteredTodos;
});
