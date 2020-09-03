import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../model/http_todo_model.dart';
import '../view/http_todos.dart';
import 'package:http/http.dart' as http;

abstract class HttpTodosViewModel extends State<HttpTodos> {
  bool isLoading = false;
  final baseUrl = 'https://jsonplaceholder.typicode.com';
  List<HttpTodoModel> httpTodos = [];

  @override
  void initState() {
    super.initState();
    callItems();
  }

  Future<void> callItems() async {
    changeLoading();
    await _getHttpTodos();
    changeLoading();
  }

  void changeLoading() {
    setState() {
      isLoading != isLoading;
    }
  }

  Future<void> _getHttpTodos() async {
    final response = await http.get('$baseUrl/todos');

    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body);
        if (jsonBody is List) {
          httpTodos = jsonBody.map((e) => HttpTodoModel.fromJson(e)).toList();
        }

        break;
      default:
    }
  }
}
