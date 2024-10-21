import 'package:flutter/material.dart';

import 'package:todo_app/controller/todo_screen_controller.dart';
import 'package:todo_app/view/start_screen/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TodoScreenController.initdb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}
