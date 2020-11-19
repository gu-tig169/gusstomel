import 'package:flutter/material.dart';

class TodoItem {
  String message;
  bool check;

  TodoItem({this.message, this.check = false});
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

  void setTake(TodoItem todo, bool check) {
    todo.check = check;
    notifyListeners();
  }
}
