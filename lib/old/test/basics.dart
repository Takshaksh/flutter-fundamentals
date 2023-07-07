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

        body: const WrapBasics()
        
      ),
    );
  }
}


// Returns a wrap()
class WrapBasics extends StatelessWidget{
  const WrapBasics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Wrap(
        spacing: 10,
        runSpacing: 12,
        direction: Axis.vertical,
        runAlignment: WrapAlignment.center,
        children: <Widget>[
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: Text("RR"),
            ),
            label: Text("Shivam Kumar"),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: Text("MM"),
            ),
            label: Text("Monica Balluchi"),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: Text("KT"),
            ),
            label: Text("Kumar Sanu"),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: Text("VR"),
            ),
            label: Text("Micheal Dell"),
          ),
        ],
      )
    );
  }

}

// Returns a styled container
class ContainerBasics extends StatelessWidget{
  const ContainerBasics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 32.0),
          margin: const EdgeInsets.all(20.0),
          width: double.infinity,
          height: 240,

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

          child: Column(
            children: <Widget>[
              const Center(
                child: Text(
                  "This is test title in Flutter.", 
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  // textAlign: TextAlign.center,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.amberAccent,
                    width: 80,
                    height: 80,
                  ),
                  const Divider(),
                  Container(
                    color: Colors.purple,
                    width: 80,
                    height: 80,
                  ),
                  Container(
                    color: Colors.deepOrange,
                    width: 80,
                    height: 80,
                  ),
                ],
              )
            ],
          ),
        );
  }

}