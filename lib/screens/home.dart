import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_demo/screens/Services.dart';

import 'package:flutter_application_demo/screens/Users.dart';

class JsonParseDemo extends StatefulWidget {
  //
  JsonParseDemo() : super();
  @override
  _JsonParseDemoState createState() => _JsonParseDemoState();
}
class _JsonParseDemoState extends State<JsonParseDemo> {
  //
  List<Todo> _todos;
  bool _loading;
  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getTodos().then((todos) {
      setState(() {
        _todos = todos;
        _loading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading...' : 'Todos'),
        leading:
        IconButton(
        icon: Icon(Icons.clear),
        color: Colors.red,
        onPressed: () { FirebaseAuth.instance.signOut();},
     ),
          
         
      ),
      body: Card(
      
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _todos ? 0 : _todos.length,
          itemBuilder: (context, index) {
            Todo todo = _todos[index];
            return ListTile(
              leading: Text(todo.id.toString()),
              title: Text(todo.title),
              subtitle: Text(todo.completed.toString()),


            );
          },
        ),
      ),
    );
  }
}
