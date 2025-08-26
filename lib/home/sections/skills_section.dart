import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/card_wrap.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CardWrap(
      title: 'Habilidades técnicas',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _SkillGroup(label: 'Frameworks', skills: ['Flutter']),
          _SkillGroup(
              label: 'Patrones',
              skills: ['Atomic Design', 'Arquitectura Hexagonal', 'BLoC']),
          _SkillGroup(label: 'Lenguajes', skills: ['Dart', 'Java', 'Python']),
          _SkillGroup(label: 'Bases de datos', skills: ['PostgreSQL', 'MySQL']),
          _SkillGroup(label: 'APIs', skills: ['REST', 'SOAP']),
          _SkillGroup(label: 'Otros', skills: ['Scrum', 'XML', 'JSON']),
        ],
      ),
    );
  }
}

class _SkillGroup extends StatelessWidget {
  const _SkillGroup({required this.label, required this.skills});
  final String label;
  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: GoogleFonts.montserrat(
                  color: Colors.white70, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.map((s) => _chip(s)).toList(),
          ),
        ],
      ),
    );
  }
}

Widget _chip(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(40),
      border: Border.all(color: Colors.white12),
    ),
    child: Text(text, style: const TextStyle(color: Colors.white)),
  );
}