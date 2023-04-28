import 'package:first_flutter/test/basics.dart';
import 'package:flutter/material.dart';

void main(){
  // runApp(const FirstClass());
  runApp(const BasicFlutter());
}



class FirstClass extends StatelessWidget{
  const FirstClass({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My first sincere flutter application",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("First App"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text("First text"),
              Image(image: AssetImage("assets/images/color_img.png"))
            ],
          ),
        )
      ),
    );
  }
  
}