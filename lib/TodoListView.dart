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
        actions: [_popupMenuButton(context)],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) => state.loading
            ? _loadingIndicator()
            : TodoList(_filterList(state.list, state.filterBy)),
      ),
      floatingActionButton: _floatingActionButton(context),
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

Widget _popupMenuButton(context) {
  return PopupMenuButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      color: Colors.blueGrey[100],
      onSelected: (value) {
        Provider.of<MyState>(context, listen: false).setFilterBy(value);
      },
      itemBuilder: (context) => [
            PopupMenuItem(child: Text('All'), value: 'all'),
            PopupMenuItem(child: Text('Done'), value: 'done'),
            PopupMenuItem(child: Text('Undone'), value: 'undone'),
          ]);
}

Widget _floatingActionButton(context) {
  return FloatingActionButton(
    child: Icon(
      Icons.add,
      color: Colors.black,
    ),
    backgroundColor: Colors.blueGrey,
    onPressed: () async {
      var newTodo = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddTodoView(TodoItem(message: 'message'))));
      if (newTodo != null) {
        Provider.of<MyState>(context, listen: false).addTodo(newTodo);
      }
    },
  );
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
