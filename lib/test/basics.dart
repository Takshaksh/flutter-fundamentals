import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicFlutter extends StatelessWidget{
  const BasicFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Basic flutter",
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutters"),
        ),

        body: Container(
          padding: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 32.0),
          margin: const EdgeInsets.all(20.0),
          width: double.infinity,

          decoration: BoxDecoration(
            image: const DecorationImage(
              // image: AssetImage("assets/images/wick.jpg"),
              image: NetworkImage('https://wallpapers.com/images/featured/jeaidqurrfx52d3u.jpg'),
              fit: BoxFit.cover

            ),
            color: Colors.white,
            border: Border.all(width: 8.0, color: Colors.black87),
            borderRadius: const BorderRadius.all(Radius.circular(16))
          ),

          child: const Text(
            "This is test title in Flutter.", 
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        
      ),
    );
  }

}