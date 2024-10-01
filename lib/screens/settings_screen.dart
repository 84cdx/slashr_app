import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final String title;

  const SettingsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}
