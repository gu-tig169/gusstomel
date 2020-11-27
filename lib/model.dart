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
      'done': checkToString(todo.check),
    };
  }

  static TodoItem fromJson(Map<String, dynamic> json) {
    return TodoItem(
      message: json['title'],
      check: stringToCheck(json['check']),
    );
  }
}

String checkToString(bool check) {
  if (check == false) return 'false';
  if (check == true) return 'true';
  return 'false';
}

bool stringToCheck(String check) {
  if (check == 'false') return false;
  if (check == 'true') return true;
  return false;
}

class MyState extends ChangeNotifier {
  List<TodoItem> _list = [];
  String _filterBy = 'all';

  List<TodoItem> get list => _list;

  String get filterBy => _filterBy;

  String _id = '';

  String get id => _id;

  MyState() {}

  Future getList() async {
    List<TodoItem> list = await Api.getTodos();
    _list = list;
    notifyListeners();
  }

  void addTodo(TodoItem todo) async {
    await Api.addTodo(todo);
    await getList();
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
