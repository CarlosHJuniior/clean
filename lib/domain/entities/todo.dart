import 'package:clean/utils/mapping_db.dart';

// todos os objetos relacionados devem ser colocados dentro do mesmo arquivo
class Todo {
  Todo(this.name, this.value);

  Todo.fromDB(Map list)
      : this.name = list[DBConstants.todoName],
        this.value = list[DBConstants.todoValue];

  Map<String, Object?> toDB() => {
        DBConstants.todoName: name,
        DBConstants.todoValue: value,
      };

  String name;
  int value;
}
