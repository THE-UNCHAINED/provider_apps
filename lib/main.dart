import 'package:bloc_counter_app/provider/count_provider.dart';
import 'package:bloc_counter_app/screens/count_example.dart';
import 'package:bloc_counter_app/screens/slider_example.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CountProvider(),

      child: MaterialApp(home: SliderExample()),
    );
  }
}
