import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

final voterProvider = Provider<int>((ref) => 100);
final voterStateProvider = StateProvider<int>((ref) => 100);

class BasicRiverpod extends ConsumerWidget{
  const BasicRiverpod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(title: const Text("Riverpod basics"),),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Consumer(builder: (context, ref, child) {
              String allVoters = ref.watch(voterStateProvider).toString();
              return Text("Total voters: $allVoters");
            }),

            const Divider(height: 20,),

            MaterialButton(
              padding: const EdgeInsets.all(8),
              minWidth: double.infinity,
              color: Colors.green,
              onPressed: (){
                ref.read(voterStateProvider.notifier).state++;
              },
              child: const Text("Add a voter", style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),

    );
  }
  
}