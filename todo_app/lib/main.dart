import 'package:flutter/material.dart';
import 'package:todo_app/models/db_model.dart';
import 'package:todo_app/models/screens/home_page.dart';
import 'package:todo_app/models/todo_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.orange),
      debugShowCheckedModeBanner: false,
    );
  }
}
