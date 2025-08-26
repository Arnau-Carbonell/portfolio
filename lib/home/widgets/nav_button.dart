import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  const NavButton(this.text, this.onTap, {super.key});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}