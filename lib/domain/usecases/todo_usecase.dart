import 'package:clean/domain/domain.dart';
import 'package:clean/domain/entities/todo.dart';
import 'package:clean/domain/rules/todo_rule.dart';
import 'package:clean/infrastructure/datastore/datastore.dart';

// Criando a implementação do usecase
// Essa implementação precisa ser privada, ninguem deve ter acesso a ela.
// Todos que utilizarem esse usecase vão ter acesso apenas aos metodos implementados.
TodoUsecase newTodoUsecase(TodoRepository repository) {
  return _TodoUsecase(repository);
}

class _TodoUsecase implements TodoUsecase {
  _TodoUsecase(this.repository);

  final TodoRepository repository;

  @override
  createTodo(Todo t) async {
    final result = validateTodo(t);

    if (result == null) {
      await repository.createTodo(t);
    } else {
      print(result);
    }
  }

  @override
  deleteTodo(Todo t) => repository.deleteTodo(t);

  @override
  listAllTodo() => repository.listAllTodo();
}
