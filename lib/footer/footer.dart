import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Center(
        child: Text(
          '© ${DateTime.now().year} Arnau Carbonell · Hecho con Flutter',
          style: const TextStyle(color: Colors.white60),
        ),
      ),
    );
  }
}
