import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/header/header.dart';

import '../footer/footer.dart';
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
              Section(key: _kHero, child: const HeroSection()),
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
}
