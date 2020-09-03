import 'package:flutter/material.dart';
import './http_todos/view/http_todos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Http Todos View',
      home: HttpTodos(),
    );
  }
}
