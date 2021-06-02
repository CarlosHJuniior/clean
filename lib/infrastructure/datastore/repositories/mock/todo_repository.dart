import 'package:clean/domain/entities/todo.dart';
import 'package:clean/infrastructure/datastore/datastore.dart';

TodoRepository newMockTodoRepository() {
  return _TodoRepository();
}

class _TodoRepository implements TodoRepository {
  final List<Todo> todoList = [];

  @override
  createTodo(Todo t) async => todoList.add(t);

  @override
  deleteTodo(Todo t) async => todoList.remove(t);

  @override
  Future<List<Todo>> listAllTodo() async => todoList;
}
