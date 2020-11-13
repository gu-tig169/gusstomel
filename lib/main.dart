import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 24),
            _checkboxRow(),
            Container(height: 24),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondView()));
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.blueGrey,
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

  Widget _checkboxRow() {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (val) {},
        ),
        Text('Write a book', style: TextStyle(fontSize: 20)),
        Container(
          margin: EdgeInsets.only(left: 16, right: 150),
        ),
        Icon(
          Icons.clear,
        )
      ],
    );
  }
}

Widget _list() {
  return ListView(
    children: [
      _item('Do homework'),
    ],
  );
}

Widget _item(text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      style: TextStyle(fontSize: 20),
    ),
  );
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

class SecondView extends StatelessWidget {
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
            _bottonRow(),
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
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              hintText: 'What are you going to do?',
            ),
          ),
        ));
  }

  Widget _bottonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(height: 100),
        RaisedButton(
          child: Text('+ ADD'),
          color: Colors.blueGrey,
          textColor: Colors.black,
          onPressed: () {},
        ),
      ],
    );
  }
}
