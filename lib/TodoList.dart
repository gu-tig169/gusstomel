import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uppgift1/TodoListView.dart';

import 'model.dart';

class TodoList extends StatelessWidget {
  final List<TodoItem> list;

  TodoList(this.list);

  Widget build(BuildContext context) {
    return ListView(
        children: list.map((todo) => _todoItem(context, todo)).toList());
  }

  Widget _todoItem(context, todo) {
    return ListTile(
      leading: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(color: todo.color),
      ),
      title: Text(todo.message),
      trailing: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          var state = Provider.of<MyState>(context, listen: false);
          state.removeTodo(todo);
        },
      ),
    );
  }
}
