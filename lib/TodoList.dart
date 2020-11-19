import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

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
      leading: Checkbox(
          checkColor: Colors.black,
          activeColor: Colors.blueGrey,
          focusColor: Colors.black,
          value: todo.check,
          onChanged: (bool newValue) {
            var state = Provider.of<MyState>(context, listen: false);
            state.setTake(todo, newValue);
          }),
      title: Text(todo.message),
      trailing: IconButton(
        color: Colors.black,
        icon: Icon(Icons.close),
        onPressed: () {
          var state = Provider.of<MyState>(context, listen: false);
          state.removeTodo(todo);
        },
      ),
    );
  }
}
