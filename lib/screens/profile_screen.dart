import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String title;

  const ProfileScreen({super.key, required this.title});

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
