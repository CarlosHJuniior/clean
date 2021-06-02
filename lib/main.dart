import 'package:clean/domain/usecases/todo_usecase.dart';
import 'package:clean/infrastructure/datastore/repositories/sqlite/todo_repository.dart';
import 'package:clean/infrastructure/presentation/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) {
          final repo = newTodoRepository();
          return newTodoUsecase(repo);
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
