import 'package:flutter/material.dart';

class TodoItem {
  String message;
  bool check;

  TodoItem({this.message, this.check = false});
}

class MyState extends ChangeNotifier {
  List<TodoItem> _list = [];
  String _filterBy = 'all';

  List<TodoItem> get list => _list;

  String get filterBy => _filterBy;

  void addTodo(TodoItem todo) {
    _list.add(todo);
    notifyListeners();
  }

  void removeTodo(TodoItem todo) {
    _list.remove(todo);
    notifyListeners();
  }

  void setCheck(TodoItem todo, bool check) {
    todo.check = check;
    notifyListeners();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
