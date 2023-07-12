import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentScreen extends ConsumerStatefulWidget{
  const PaymentScreen({super.key});

  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();

}

class _PaymentScreenState extends ConsumerState<PaymentScreen>{

  double cost = 1253.50;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Make Payment"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                ), 
                child: Text("Pay ₹$cost/-"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}