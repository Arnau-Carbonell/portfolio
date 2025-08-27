import 'package:flutter/material.dart';
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
              // HERO con fade
              Opacity(
                opacity: (1 - (progress * 2)).clamp(0.0, 1.0),
                child: Transform.translate(
                  offset: Offset(0, -progress * 50),
                  child: Section(
                    key: _kHero,
                    child: const HeroSection(),
                  ),
                ),
              ),

              Transform.translate(
                offset: Offset(0, -progress * scrollFactor), // ajusta este valor
                child: Section(key: _kSummary, child: const SummarySection()),
              ),
              Transform.translate(
                offset: Offset(0, -progress * scrollFactor),
                child: Section(key: _kExperience, child: const ExperienceSection()),
              ),
              Transform.translate(
                offset: Offset(0, -progress * scrollFactor),
                child: Section(key: _kEducation, child: const EducationSection()),
              ),
              Transform.translate(
                offset: Offset(0, -progress * scrollFactor),
                child: Section(key: _kProjects, child: const ProjectsSection()),
              ),
              Transform.translate(
                offset: Offset(0, -progress * scrollFactor),
                child: Section(key: _kSkills, child: const SkillsSection()),
              ),
              Transform.translate(
                offset: Offset(0, -progress * scrollFactor),
                child: Section(key: _kLanguages, child: const LanguagesSection()),
              ),
              Transform.translate(
                offset: Offset(0, -progress * scrollFactor),
                child: Section(key: _kContact, child: const ContactSection()),
              ),

              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
