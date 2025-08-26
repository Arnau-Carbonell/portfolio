import 'package:flutter/material.dart';

import '../../utils/card_wrap.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CardWrap(
      title: 'Formación académica',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.school_rounded, color: Colors.white),
            title: Text(
              'CIPFP Batoi, Alcoi – CFGS Desarrollo de Aplicaciones Multiplataforma',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text('Sep 2021 – Mar 2023', style: TextStyle(color: Colors.white70)),
          ),
        ],
      ),
    );
  }
}
