import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:media_recommendation_app/constants.dart';
import 'package:media_recommendation_app/screens/favorites_screen.dart';
import 'package:media_recommendation_app/screens/home_screen.dart';
import 'package:media_recommendation_app/screens/profile_screen.dart';
import 'package:media_recommendation_app/screens/settings_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    FavoritesScreen(),
    ProfileScreen(title: 'Profile'),
    SettingsScreen(title: 'Settings'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Show the current page based on the selected index
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border(
            top: BorderSide(
              color: const Color.fromARGB(255, 41, 41, 41),
              width: 1,
            ),
          ),
        ),
        child: GNav(
          gap: 10,
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 22),
          onTabChange: _onItemTapped, // Handle tab changes
          tabs: [
            GButton(
              icon: Icons.home,
              iconColor: _selectedIndex == 0 ? Colors.white : const Color.fromARGB(255, 255, 32, 32),
              iconSize: _selectedIndex == 0 ? 32 : 24,
            ),
            GButton(
              icon: Icons.favorite,
              iconColor: _selectedIndex == 1 ? Colors.white : const Color.fromARGB(255, 255, 32, 32),
              iconSize: _selectedIndex == 1 ? 32 : 24,
            ),
            GButton(
              icon: Icons.person,
              iconColor: _selectedIndex == 2 ? Colors.white : const Color.fromARGB(255, 255, 32, 32),
              iconSize: _selectedIndex == 2 ? 32 : 24,
            ),
            GButton(
              icon: Icons.settings,
              iconColor: _selectedIndex == 3 ? Colors.white : const Color.fromARGB(255, 255, 32, 32),
              iconSize: _selectedIndex == 3 ? 32 : 24,
            ),
          ],
        ),
      ),
    );
  }
}
