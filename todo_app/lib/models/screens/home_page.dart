import 'package:flutter/material.dart';
import 'package:todo_app/models/db_model.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/widgets/UserInput.dart';
import 'package:todo_app/widgets/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void addItem(Todo todo) async {
    await ConnectDatabase.instance.inserttodo(todo);
    setState(() {});
  }

  void deleteItem(Todo todo) async {
    await ConnectDatabase.instance.deleletodo(todo);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Todo App",
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.orange,
              Colors.red,
            ],
          )),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TodoList(
            insertfunction: addItem,
            deletefunction: deleteItem,
          ),
          UserInput(insertfunction: addItem),
        ],
      ),
    );
  }
}
