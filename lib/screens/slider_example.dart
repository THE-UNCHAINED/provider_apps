import 'package:bloc_counter_app/provider/slider_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<SliderProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text("SLIDER")),
      body: Column(
        children: [
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Slider(
                value: data.value,
                min: 0,
                max: 1,
                onChanged: (val) {
                  data.increasevalue(val);
                },
              );
            },
          ),
          Consumer(
            builder: (context, value, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.red.withOpacity(data.value),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.purple.withOpacity(data.value),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
