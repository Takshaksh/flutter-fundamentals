import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavSecondScreen extends StatelessWidget{
  const NavSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text("Second screen Text"),),
          TextButton(
            onPressed: (){
              return context.go('/');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            child: const Text("Home"),
          )
        ],
      ),
    );
  }
}