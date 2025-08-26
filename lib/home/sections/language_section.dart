import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/card_wrap.dart';

class LanguagesSection extends StatelessWidget {
  const LanguagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CardWrap(
      title: 'Idiomas',
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: const [
          _LangBadge(label: 'Español', level: 'Nativo'),
          _LangBadge(label: 'Valenciano/Catalán', level: 'Nativo'),
          _LangBadge(label: 'Inglés', level: 'Intermedio'),
        ],
      ),
    );
  }
}

class _LangBadge extends StatelessWidget {
  const _LangBadge({required this.label, required this.level});
  final String label;
  final String level;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: GoogleFonts.montserrat(
                  color: Colors.white, fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(level, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}