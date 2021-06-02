import 'package:clean/domain/entities/todo.dart';

// aqui deve ser criado os contratos, interfaces, dos usecases
abstract class TodoUsecase {
  Future<void> createTodo(Todo t);

  Future<void> deleteTodo(Todo t);

  Future<List<Todo>> listAllTodo();
}
