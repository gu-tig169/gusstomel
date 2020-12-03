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
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        color: Colors.blueGrey[200],
        child: Container(
          child: ListTile(
            leading: Checkbox(
                checkColor: Colors.black,
                activeColor: Colors.blueGrey,
                value: todo.check,
                onChanged: (bool newValue) {
                  var state = Provider.of<MyState>(context, listen: false);
                  state.setCheck(todo, newValue);
                }),
            title: Text(todo.message != null ? todo.message : '',
                style: todo.check
                    ? (TextStyle(
                        color: Colors.black.withOpacity(0.3),
                        decoration: TextDecoration.lineThrough,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                      ))
                    : TextStyle(
                        fontSize: 20,
                      )),
            trailing: IconButton(
              color: Colors.black,
              icon: Icon(Icons.close),
              onPressed: () {
                var state = Provider.of<MyState>(context, listen: false);
                state.removeTodo(todo);
              },
            ),
          ),
        ));
  }
}
