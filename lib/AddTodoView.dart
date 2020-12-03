import 'package:flutter/material.dart';
import './model.dart';

//Lägga till todo-vyn
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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController textEditingController;

  AddTodoViewState(TodoItem todo) {
    this.message = todo.message;

    textEditingController = TextEditingController();
    textEditingController.addListener(() {
      setState(() {
        message = textEditingController.text;
      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      key: _scaffoldKey,
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

//Textinmatningsfält
  Widget _inputField() {
    return Container(
        color: Colors.white,
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

//Add-knapp
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
              if (textEditingController.text.trim().isEmpty) {
                SnackBar snackBar = SnackBar(
                    backgroundColor: Colors.blueGrey,
                    content:
                        Text("Write a todo!", style: TextStyle(fontSize: 16)));
                _scaffoldKey.currentState.showSnackBar(snackBar);
                print('pressed');
              } else {
                Navigator.pop(context, TodoItem(message: message));
              }
            }),
      ],
    );
  }
}
