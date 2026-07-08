import 'package:bloc_counter_app/provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  Widget build(BuildContext context) {
    final countprovider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("Provider")),
      body: Center(
        child: Consumer<CountProvider>(
          builder: (context, value, child) {
            return Text(value.count.toString(), style: TextStyle(fontSize: 20));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: countprovider.increment,
      ),
    );
  }
}
