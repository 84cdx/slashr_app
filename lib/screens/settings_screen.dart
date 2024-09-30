import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final String title;

  const SettingsScreen({Key? key, required this.title}) : super(key: key);

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
