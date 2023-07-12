import 'dart:developer' as dev;
import 'dart:isolate';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ExplorerScreen extends StatefulWidget{
  const ExplorerScreen({super.key});
  
  @override
  State<ExplorerScreen> createState() => _ExplorerScreenState();
}

class _ExplorerScreenState extends State<ExplorerScreen>{

  int sumData = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explorer"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
        
            const SizedBox(height: 16,),
        
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(sumData.toString()),
            ),
        
            ElevatedButton(
              onPressed: () async {
                // int result = await compute(computeHeavySum, Random().nextInt(1000000000));

                final receivePort = ReceivePort();
                await Isolate.spawn(computeHeavySum, receivePort.sendPort);

                receivePort.listen((result) {
                  setState(() {
                    sumData = result;
                  });
                });
        
              },
              child: const Text("Add sum"),
            ),
          ],
        ),
      ),
    );
  }
}

void computeHeavySum(SendPort sendPort){
  dev.log("Sum computation started");
  int value = Random().nextInt(1000000000);
  int sum = 0;

  for(int i = 0; i < value; i++){
    sum += i;
  }

  dev.log("Sum computation ended");
  return sendPort.send(sum);
}