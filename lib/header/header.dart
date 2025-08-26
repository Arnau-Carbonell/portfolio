import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/widgets/glow_dot.dart';
import '../home/widgets/nav_button.dart';

class Header extends StatelessWidget implements PreferredSizeWidget{
  final GlobalKey kHero;
  final GlobalKey kSummary;
  final GlobalKey kExperience;
  final GlobalKey kEducation;
  final GlobalKey kProjects;
  final GlobalKey kSkills;
  final GlobalKey kLanguages;
  final GlobalKey kContact;

  const Header({
    super.key,
    required this.kHero,
    required this.kSummary,
    required this.kExperience,
    required this.kEducation,
    required this.kProjects,
    required this.kSkills,
    required this.kLanguages,
    required this.kContact,
  });


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
        NavButton('Inicio', () => _goTo(kHero)),
        NavButton('Resumen', () => _goTo(kSummary)),
        NavButton('Experiencia', () => _goTo(kExperience)),
        NavButton('Formación', () => _goTo(kEducation)),
        NavButton('Proyectos', () => _goTo(kProjects)),
        NavButton('Habilidades', () => _goTo(kSkills)),
        NavButton('Idiomas', () => _goTo(kLanguages)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: FilledButton.icon(
            onPressed: () => _goTo(kContact),
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
