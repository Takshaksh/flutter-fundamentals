import 'package:first_flutter/router/app_router.dart' as routes;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationScreen extends StatelessWidget{
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: (){
              return context.go(routes.profile);
            },
            // style: ButtonStyle(
            //   backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            // ),
            child: const Text("Profile"),
          )
        ],
      ),
    );
  }
}