import 'package:bloc_counter_app/provider/favourite_provider.dart';
import 'package:bloc_counter_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("FAVOURITE"),

        actions: [
          Switch(
            value: themeProvider.themeMode == ThemeMode.dark,
            onChanged: (value) {
              themeProvider.changeTheme(value);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return Consumer<FavouriteProvider>(
            builder: (context, favouritePorv, child) {
              return ListTile(
                onTap: () {
                  favouritePorv.favList.contains(index)
                      ? favouritePorv.unmarkFavourite(index)
                      : favouritePorv.markFavourite(index);
                },
                leading: Text(index.toString()),
                title: Text("Item $index"),
                trailing: favouritePorv.favList.contains(index)
                    ? Icon(Icons.favorite, color: Colors.red)
                    : Icon(Icons.favorite_border_outlined),
              );
            },
          );
        },
      ),
    );
  }
}
