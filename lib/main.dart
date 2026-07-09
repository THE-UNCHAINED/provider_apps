import 'package:bloc_counter_app/provider/count_provider.dart';
import 'package:bloc_counter_app/provider/theme_provider.dart';
import 'package:bloc_counter_app/provider/favourite_provider.dart';
import 'package:bloc_counter_app/provider/slider_provider.dart';
import 'package:bloc_counter_app/screens/count_example.dart';
import 'package:bloc_counter_app/screens/dark_mode_screen.dart';
import 'package:bloc_counter_app/screens/favourite_screen.dart';
import 'package:bloc_counter_app/screens/slider_example.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()), // what is this.
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Provider app',
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: Colors.blue,
          surface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),

      // 🌙 THE DARK RULEBOOK
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: Colors.tealAccent,
          surface: Colors.grey.shade900, // A nice dark grey, not pure black
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade900,
          foregroundColor: Colors.tealAccent,
          centerTitle: true,
        ),
      ),

      home: FavouriteScreen(),
    );
  }
}
