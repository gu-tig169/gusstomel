import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AddTodoView.dart';
import 'TodoList.dart';
import 'model.dart';

//Huvudvyn
class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.blueGrey,
        title: Text(
          'TIG169 TODO',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton(
              onSelected: (value) {
                Provider.of<MyState>(context, listen: false).setFilterBy(value);
              },
              itemBuilder: (context) => [
                    PopupMenuItem(child: Text('all'), value: 'all'),
                    PopupMenuItem(child: Text('done'), value: 'done'),
                    PopupMenuItem(child: Text('undone'), value: 'undone'),
                  ]),
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) => state.loading
            ? _loadingIndicator()
            : TodoList(_filterList(state.list, state.filterBy)),
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
}

List<TodoItem> _filterList(list, choice) {
  if (choice == "done") {
    return list.where((todo) => todo.check == true).toList();
  } else if (choice == "undone") {
    return list.where((todo) => todo.check == false).toList();
  }

  return list;
}

Widget _loadingIndicator() {
  return Center(
    child: SizedBox(
      height: 60,
      width: 60,
      child: CircularProgressIndicator(
        strokeWidth: 10,
        backgroundColor: Colors.grey,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blueGrey),
      ),
    ),
  );
}
