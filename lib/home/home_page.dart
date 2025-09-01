import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/header/header.dart';

import '../footer/footer.dart';
import '../utils/go_to.dart';
import 'sections/contact_section.dart';
import 'sections/education_section.dart';
import 'sections/experience_section.dart';
import 'sections/hero_section.dart';
import 'sections/language_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';
import 'sections/summary_section.dart';
import 'widgets/section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scroll = ScrollController();
  double scrollOffset = 0.0;
  int scrollFactor = 500;

  final GlobalKey _kHero = GlobalKey();
  final GlobalKey _kSummary = GlobalKey();
  final GlobalKey _kExperience = GlobalKey();
  final GlobalKey _kEducation = GlobalKey();
  final GlobalKey _kProjects = GlobalKey();
  final GlobalKey _kSkills = GlobalKey();
  final GlobalKey _kLanguages = GlobalKey();
  final GlobalKey _kContact = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      setState(() {
        scrollOffset = _scroll.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final progress = (scrollOffset / height).clamp(0.0, 1.0);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: Header(
        kHero: _kHero,
        kSummary: _kSummary,
        kExperience: _kExperience,
        kEducation: _kEducation,
        kProjects: _kProjects,
        kSkills: _kSkills,
        kContact: _kContact,
        kLanguages: _kLanguages,
      ),
      endDrawer: Drawer(
        backgroundColor: const Color(0xFF0f2027),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF203a43), Color(0xFF2c5364)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Arnau Carbonell',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Flutter Developer',
                    style: GoogleFonts.montserrat(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            _drawerItem(
              icon: Icons.home_rounded,
              text: 'Inicio',
              onTap: () => goTo(_kHero),
            ),
            _drawerItem(
              icon: Icons.article_rounded,
              text: 'Resumen',
              onTap: () => goTo(_kSummary),
            ),
            _drawerItem(
              icon: Icons.work_outline_rounded,
              text: 'Experiencia',
              onTap: () => goTo(_kExperience),
            ),
            _drawerItem(
              icon: Icons.school_rounded,
              text: 'Formación',
              onTap: () => goTo(_kEducation),
            ),
            _drawerItem(
              icon: Icons.folder_copy_rounded,
              text: 'Proyectos',
              onTap: () => goTo(_kProjects),
            ),
            _drawerItem(
              icon: Icons.settings_rounded,
              text: 'Habilidades',
              onTap: () => goTo(_kSkills),
            ),
            _drawerItem(
              icon: Icons.language_rounded,
              text: 'Idiomas',
              onTap: () => goTo(_kLanguages),
            ),
            const Spacer(),
            Divider(color: Colors.white24, thickness: 1),

            _drawerItem(
              icon: Icons.send_rounded,
              text: 'Contacto',
              onTap: () => goTo(_kContact),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0f2027), Color(0xFF203a43), Color(0xFF2c5364)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          controller: _scroll,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Opacity(
                opacity: (1 - (progress * 2)).clamp(0.0, 1.0),
                child: Transform.translate(
                  offset: Offset(0, progress * 600),
                  child: Section(key: _kHero, child: const HeroSection()),
                ),
              ),

              Section(key: _kSummary, child: const SummarySection()),

              Section(key: _kExperience, child: const ExperienceSection()),

              Section(key: _kEducation, child: const EducationSection()),

              Section(key: _kProjects, child: const ProjectsSection()),

              Section(key: _kSkills, child: const SkillsSection()),

              Section(key: _kLanguages, child: const LanguagesSection()),

              Section(key: _kContact, child: const ContactSection()),

              const Footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(text, style: GoogleFonts.montserrat(color: Colors.white)),
      onTap: () {
        onTap();
        Navigator.pop(context);
      },
      hoverColor: Colors.white10,
      splashColor: Colors.white24,
    );
  }
}
