import 'package:flutter/material.dart';

import 'APICommunicator.dart';

class TodoItem {
  String message;
  bool check;
  String id;

  TodoItem({this.message, this.check = false, this.id});

  static Map<String, dynamic> toJson(TodoItem todo) {
    return {
      'title': todo.message,
      'done': todo.check,
    };
  }

  static TodoItem fromJson(Map<String, dynamic> json) {
    return TodoItem(
      message: json['title'],
      check: json['done'],
      id: json['id'],
    );
  }
}

class MyState extends ChangeNotifier {
  List<TodoItem> _list = [];
  String _filterBy = 'all';

  List<TodoItem> get list => _list;

  String get filterBy => _filterBy;

  Future getList() async {
    List<TodoItem> list = await Api.getTodos();
    _list = list;
    notifyListeners();
  }

  void addTodo(TodoItem todo) async {
    await Api.addTodo(todo);
    await getList();
  }

  void removeTodo(TodoItem todo) async {
    await Api.deleteTodo(todo);
    await getList();
  }

  void setCheck(TodoItem todo, bool check) async {
    todo.check = check;
    print(check);
    await Api.changeCheck(todo);
    await getList();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
