import 'package:clean/domain/domain.dart';
import 'package:clean/domain/entities/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

// estado da view
class HomeProvider extends ChangeNotifier {
  HomeProvider(this.context);

  onClickNewTodo() async {
    final usecase = Provider.of<TodoUsecase>(context);
    final todo = Todo('Name', 1);

    await usecase.createTodo(todo);
  }

  onListTodo() async {
    final usecase = Provider.of<TodoUsecase>(context);
    todoList.addAll(await usecase.listAllTodo());
  }

  onRemoveTodo() async {
    final usecase = Provider.of<TodoUsecase>(context);
    final todo = Todo('Name', 1);

    await usecase.deleteTodo(todo);
  }

  BuildContext context;
  final List<Todo> todoList = [];
}
