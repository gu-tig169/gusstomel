import 'package:flutter/material.dart';

class TodoItem {
  String message;

  TodoItem({this.message});
}

class MyState extends ChangeNotifier {
  List<TodoItem> _list = [];
  List<TodoItem> get list => _list;

  void addTodo(TodoItem todo) {
    _list.add(todo);
    notifyListeners();
  }

  void removeTodo(TodoItem todo) {
    _list.remove(todo);
    notifyListeners();
  }
}
