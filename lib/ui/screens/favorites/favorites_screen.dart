import 'package:book_flix/utils/colors/global_colors.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      appBar: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: CustomColors.background,
      title: Text('Favorites',
          style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontSize: 40,
              fontWeight: FontWeight.w900)),
      ),
      body: Column(
        children: [
          Text('peliculas')
        ]
      )
    );
  }
}
