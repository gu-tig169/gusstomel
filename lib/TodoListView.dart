import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AddTodoView.dart';
import 'TodoList.dart';
import 'model.dart';

class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.blueGrey,
        title: Text(
          'TIG169 TODO',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) => TodoList(state.list),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.blueGrey,
        onPressed: () async {
          var newTodo = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddTodoView(TodoItem(message: 'message'))));
          if (newTodo != null) {
            Provider.of<MyState>(context, listen: false).addTodo(newTodo);
          }
        },
      ),
    );
  }

  void choiceAction(String choice) {
    if (choice == Constants.All) {
      print('all');
    } else if (choice == Constants.Done) {
      print('done');
    } else if (choice == Constants.Undone) {
      print('undone');
    }
  }
}

class Constants {
  static const String All = 'all';
  static const String Done = 'done';
  static const String Undone = 'undone';

  static const List<String> choices = <String>[
    All,
    Done,
    Undone,
  ];
}