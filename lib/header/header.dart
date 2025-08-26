import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/widgets/glow_dot.dart';
import '../home/widgets/nav_button.dart';

class Header extends StatelessWidget implements PreferredSizeWidget{
  Header({super.key});

  final GlobalKey _kHero = GlobalKey();
  final GlobalKey _kSummary = GlobalKey();
  final GlobalKey _kExperience = GlobalKey();
  final GlobalKey _kEducation = GlobalKey();
  final GlobalKey _kProjects = GlobalKey();
  final GlobalKey _kSkills = GlobalKey();
  final GlobalKey _kLanguages = GlobalKey();
  final GlobalKey _kContact = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black.withOpacity(0.12),
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      toolbarHeight: 72,
      titleSpacing: 12,
      title: Row(
        children: [
          const GlowDot(),
          const SizedBox(width: 10),
          Text(
            'Arnau Carbonell',
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ],
      ),
      actions: [
        NavButton('Inicio', () => _goTo(_kHero)),
        NavButton('Resumen', () => _goTo(_kSummary)),
        NavButton('Experiencia', () => _goTo(_kExperience)),
        NavButton('Formación', () => _goTo(_kEducation)),
        NavButton('Proyectos', () => _goTo(_kProjects)),
        NavButton('Habilidades', () => _goTo(_kSkills)),
        NavButton('Idiomas', () => _goTo(_kLanguages)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: FilledButton.icon(
            onPressed: () => _goTo(_kContact),
            icon: const Icon(Icons.send_rounded),
            label: const Text('Contacto'),
          ),
        ),
      ],
    );
  }
  Future<void> _goTo(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      alignment: 0.05,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);

}
