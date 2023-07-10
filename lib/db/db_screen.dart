import 'dart:developer' as dev;

import 'package:first_flutter/db/db_helper.dart';
import 'package:first_flutter/db/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DBScreen extends StatefulWidget{
  const DBScreen({super.key});
  
  @override
  State<DBScreen> createState() => _DBScreenState();
}

class _DBScreenState extends State<DBScreen>{

  final todo = Todo(title: "CRUD in Flutter");


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DB CRUD"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final data = await DBHelper().insertTodo(todo);
                dev.log(data.toString());
              },
              child: const Text("Add todo"),
            ),

            ElevatedButton(
              onPressed: () async {
                final data = await DBHelper().getTodoList();
                dev.log(data.toString());
              },
              child: const Text("get todo"),
            ),
          ],
        ),
      ),
    );
  }
}