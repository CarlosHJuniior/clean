import 'package:clean/domain/entities/todo.dart';

// Toda a regra de negócio deve ser criada aqui
String? validateTodo(Todo todo) {
  if (todo.name.isEmpty) {
    return "Name can't empty";
  }

  if (todo.value < 1) {
    return 'Value is required';
  }

  return null;
}
