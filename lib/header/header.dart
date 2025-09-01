import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/widgets/glow_dot.dart';
import '../home/widgets/nav_button.dart';
import '../utils/go_to.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
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
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final isMobile = constraints.maxWidth < 1020;

        return AppBar(
          elevation: 0,
          backgroundColor: Colors.black.withValues(alpha: 0.12),
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
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          actions: isMobile
              ? [
            // Menú hamburguesa
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
            ),
          ]
              : [
            NavButton('Inicio', () => goTo(kHero)),
            NavButton('Resumen', () => goTo(kSummary)),
            NavButton('Experiencia', () => goTo(kExperience)),
            NavButton('Formación', () => goTo(kEducation)),
            NavButton('Proyectos', () => goTo(kProjects)),
            NavButton('Habilidades', () => goTo(kSkills)),
            NavButton('Idiomas', () => goTo(kLanguages)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: FilledButton.icon(
                onPressed: () => goTo(kContact),
                icon: const Icon(Icons.send_rounded),
                label: const Text('Contacto'),
              ),
            ),
          ],
        );
      },
    );
  }



  @override
  Size get preferredSize => const Size.fromHeight(72);
}
