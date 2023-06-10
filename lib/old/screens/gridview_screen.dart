import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView"),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(8),
        children: [
          Container(color: Colors.amber,),
          Container(color: Colors.amber,),
          Container(color: Colors.amber,),
          Container(color: Colors.red,),
          Container(color: Colors.red,),
          Container(color: Colors.red,),
          Container(color: Colors.amber,),
          Container(color: Colors.amber,),
          Container(color: Colors.amber,),
          Container(color: Colors.red,),
          Container(color: Colors.red,),
          Container(color: Colors.red,),
          Container(color: Colors.amber,),
          Container(color: Colors.amber,),
          Container(color: Colors.amber,),
          Container(color: Colors.red,),
          Container(color: Colors.red,),
          Container(color: Colors.red,),
          Container(color: Colors.amber,),
          Container(color: Colors.amber,),
          Container(color: Colors.amber,),
        ],
      ),
    );
  }
}
