import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class FavoritesScreen extends StatelessWidget {

  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border(
            top: BorderSide(
              color: const Color.fromARGB(
                  255, 41, 41, 41),
              width: 1, 
            ),
          ),
        ),
        child: GNav(
          gap: 10,
          activeColor: Colors.white,
          color: const Color.fromARGB(255, 255, 32, 32),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 22),
          //onTabChange: _onItemTapped,
          tabs: const [
            GButton(icon: Icons.home),
            GButton(icon: Icons.favorite),
            GButton(icon: Icons.person),
            GButton(icon: Icons.settings),
          ],
        ),
      ),
    );
  }
}
