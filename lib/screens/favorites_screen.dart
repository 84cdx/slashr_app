import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:media_recommendation_app/constants.dart';
import 'package:media_recommendation_app/main.dart';
import 'package:media_recommendation_app/screens/home_screen.dart';
import 'package:media_recommendation_app/screens/profile_screen.dart';
import 'package:media_recommendation_app/screens/search_screen.dart';
import 'package:media_recommendation_app/screens/settings_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int _selectedIndex = 1; // Initialer Index für die Favoriten-Seite

  final List<Widget> _pages = [
    HomeScreen(),
    FavoritesScreen(), // Die aktuelle Instanz von FavoritesScreen
    ProfileScreen(title: 'Profile'),
    SettingsScreen(title: 'Settings'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: Colors.black,
      ),
      body: _selectedIndex == 1
          ? favoriteMovies.isEmpty
              ? const Center(
                  child: Text(
                    'No favorites yet.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              : ListView.builder(
                  itemCount: favoriteMovies.length,
                  itemBuilder: (context, index) {
                    final movie = favoriteMovies[index];
                    return ListTile(
                      leading: Image.network(
                        '${Constants.imageUrl}${movie.posterPath}',
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        movie.title,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  },
                )
          : _pages[
              _selectedIndex], // Zeige den Inhalt der ausgewählten Seite an
      backgroundColor: Colors.black,
    );
  }
}
