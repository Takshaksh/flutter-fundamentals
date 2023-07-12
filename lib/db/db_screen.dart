import 'dart:developer' as dev;

import 'package:first_flutter/db/db_helper.dart';
import 'package:first_flutter/db/todo_model.dart';
import 'package:first_flutter/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class DBScreen extends ConsumerStatefulWidget{
  const DBScreen({super.key});
  
  @override
  ConsumerState<DBScreen> createState() => _DBScreenState();
}

class _DBScreenState extends ConsumerState<DBScreen>{

  final todo = Todo(title: "CRUD in Flutter");
  final todoTextController = TextEditingController();
  // late final AsyncValue<List<Todo>> todoAsyncList;



  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final todoAsyncList = ref.read(todoListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("DB CRUD"),
        actions: [
          IconButton(
            onPressed: (){
              showDialog(
                context: context, 
                builder: (BuildContext context){
                  return AlertDialog(
                    title: const Text("Add a tast"),
                    content: TextField(
                      maxLines: 2,
                      controller: todoTextController,
                    ),
                    actions: [
                      TextButton(
                        onPressed: (){
                          context.pop(context);
                        }, 
                        child: const Text("Cancel")
                      ),
                      TextButton(
                        onPressed: (){
                          ref.read(todoListProvider.notifier).addTodo(Todo(title: todoTextController.text));
                          // DBHelper().insertTodo(Todo(title: todoTextController.text));
                          Fluttertoast.showToast(msg: "Task added");
                          context.pop(context);
                        }, 
                        child: const Text("Add")
                      ),
                    ],
                  );
                }
              );
            }, 
            icon: const Icon(Icons.add_rounded),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
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

            Consumer(
              builder: (context, ref, child) {
                final todoList = ref.watch(todoListProvider);

                if (todoList is AsyncLoading) {
                  return const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (todoList is AsyncError) {
                  return const Expanded(
                    child: Center(child: Text("Something went wrong.")),
                  );
                }else if(todoList.isEmpty){
                  return const Expanded(
                    child: Center(child: Text("No data found, please add one."),),
                  );
                } else{
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (BuildContext context, int index){
                        return ListTile(
                          title: Text(todoList[index].title),
                        );
                      }, 
                      separatorBuilder: (BuildContext context, int index) => const Divider(), 
                      itemCount: todoList.length
                    ),
                  );
                }
              },
            ),
            /* todoAsyncList.when(
              data: (List<Todo> data) { 
                if(data.isNotEmpty){
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (BuildContext context, int index){
                        return ListTile(
                          title: Text(data[index].title),
                        );
                      }, 
                      separatorBuilder: (BuildContext context, int index) => const Divider(), 
                      itemCount: data.length
                    ),
                  );
                }else{
                  return const Expanded(
                    child: Center(child: Text("No data found, please add one."),),
                  );
                }
              }, 
              error: (Object error, StackTrace stackTrace) { 
                return const Expanded(child: Center(child: Text("Something went wrong."),)); 
              }, 
              loading: () => const Expanded(child: Center(child: CircularProgressIndicator()),),
            )   */          
          ],
        ),
      ),
    );
  }
}