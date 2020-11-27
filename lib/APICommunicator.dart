import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:uppgift1/model.dart';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = '93abaf4f-7e97-4655-8ae9-082603ad41c5';

class Api {
  static Future addTodo(TodoItem todo) async {
    var json = jsonEncode(TodoItem.toJson(todo));
    await http.post('$API_URL/todos?key=$API_KEY',
        body: json, headers: {'Content-Type': 'application/json'});
  }

  static Future<List<TodoItem>> getTodos() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    print(response.body);
    var json = jsonDecode(response.body);

    return json.map<TodoItem>((data) {
      return TodoItem.fromJson(data);
    }).toList();
  }
}
