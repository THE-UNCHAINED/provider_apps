import 'package:flutter/material.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SLIDER")),
      body: Row(
        children: [
          Slider(
            value: value,
            min: 0,
            max: 1,
            onChanged: (val) {
              setState(() {
                value = val;
              });
            },
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(color: Colors.red.withOpacity(value)),
                ),
                Expanded(
                  child: Container(color: Colors.purple.withOpacity(value)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
