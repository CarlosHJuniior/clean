import 'package:clean/domain/entities/todo.dart';
import 'package:clean/infrastructure/datastore/datastore.dart';
import 'package:clean/infrastructure/datastore/repositories/sqlite/db_config.dart';
import 'package:clean/utils/mapping_db.dart';

// Implementação do repository
// o objeto não pode nem deve ser exposto, apenas os metodos do contrato.
TodoRepository newTodoRepository() {
  return _TodoRepository();
}

class _TodoRepository implements TodoRepository {
  @override
  createTodo(Todo t) async {
    final db = await DBManager.db();
    await db.insert(DBConstants.todoTableName, t.toDB());
  }

  @override
  deleteTodo(Todo t) async => await (await DBManager.db()).delete(DBConstants.todoTableName, where: '...');

  @override
  listAllTodo() async {
    final db = await DBManager.db();

    final List<Map> list = await db.query(DBConstants.todoTableName);
    return list.map((e) => Todo.fromDB(e)).toList();
  }
}
