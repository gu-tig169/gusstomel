import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:uppgift1/model.dart';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = 'd524e38c-fc04-4064-9858-271657ee130e';

class Api {
  static Future addTodo(TodoItem todo) async {
    var json = jsonEncode(TodoItem.toJson(todo));
    await http.post('$API_URL/todos?key=$API_KEY',
        body: json, headers: {'Content-Type': 'application/json'});
  }

  static Future<List<TodoItem>> getTodos() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    //print(response.body);
    var json = jsonDecode(response.body);

    return json.map<TodoItem>((data) {
      return TodoItem.fromJson(data);
    }).toList();
  }

  static Future deleteTodo(TodoItem todo) async {
    await http.delete('$API_URL/todos/${todo.id}?key=$API_KEY');
  }

  static Future changeCheck(TodoItem todo) async {
    var json = jsonEncode(TodoItem.toJson(todo));
    String todoId = todo.id;
    print(todoId);
    print(json);
    await http.put('$API_URL/todos/$todoId?key=$API_KEY',
        body: json, headers: {'Content-Type': 'application/json'});
  }
}
