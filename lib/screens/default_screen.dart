import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'gridview_screen.dart';

class DefaultScreen extends ConsumerWidget {
  const DefaultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ShivamApps"),
        centerTitle: true,
      ),
      body: const HomeScreenApp(),
    );
  }
}

class HomeScreenApp extends StatelessWidget {
  const HomeScreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              showCupertinoDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: const Text("Are you sure?"),
                      content: const Text("You will be logged out."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Fluttertoast.showToast(msg: "Yes!");
                          },
                          child: const Text("Yes"),
                        ),
                        TextButton(
                          onPressed: () {
                            Fluttertoast.showToast(msg: "No!");
                            Navigator.of(context).pop();
                          },
                          child: const Text("No"),
                        ),
                      ],
                    );
                  });
            },
            child: const Text("Show Alert"),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GridViewScreen()));
              },
              child: const Text("Show GridView")),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context, 
                isDismissible: false,
                builder: (BuildContext context){
                  return Container(
                    // color: Colors.indigo,
                    padding: const EdgeInsets.all(16),
                    height: 300,
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Hello!"),
                        ElevatedButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: const Text("Close")
                        )
                      ],
                    ),
                  );
                },
              );
            },
            child: const Text("Show bottomsheet"),
          ),
        ],
      ),
    );
  }
}
