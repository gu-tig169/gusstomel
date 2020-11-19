import 'package:flutter/material.dart';
import './model.dart';

class AddTodoView extends StatefulWidget {
  final TodoItem todo;

  AddTodoView(this.todo);

  @override
  State<StatefulWidget> createState() {
    return AddTodoViewState(todo);
  }
}

class AddTodoViewState extends State<AddTodoView> {
  String message;

  TextEditingController textEditingController;

  AddTodoViewState(TodoItem todo) {
    this.message = todo.message;

    textEditingController = TextEditingController(text: todo.message);
    textEditingController.addListener(() {
      setState(() {
        message = textEditingController.text;
      });
    });
  }
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
        actions: [],
      ),
      body: Center(
        child: Column(
          children: [
            _inputField(),
            _buttonRow(),
          ],
        ),
      ),
    );
  }

  Widget _inputField() {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Theme(
          data: ThemeData(
              primaryColor: Colors.blueGrey, primaryColorDark: Colors.black),
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              hintText: 'What are you going to do?',
            ),
          ),
        ));
  }

  Widget _buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(height: 100),
        FlatButton(
          child: Text('+ ADD'),
          color: Colors.blueGrey,
          textColor: Colors.black,
          onPressed: () {
            Navigator.pop(context, TodoItem(message: message));
          },
        ),
      ],
    );
  }
}
