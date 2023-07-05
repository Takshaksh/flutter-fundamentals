import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NotifyScreen extends StatefulWidget {
  const NotifyScreen({super.key});

  @override
  State<StatefulWidget> createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: A,
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Fluttertoast.showToast(msg: "Sent a notification");
          },
          child: const Text("Show notification"),
        ),
      ),
    );
  }
}
