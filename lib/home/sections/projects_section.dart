import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/open_url.dart';

import '../../utils/card_wrap.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CardWrap(
      title: 'Proyectos destacados',
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          GestureDetector(
            onTap: () => openUrl('https://aps.autodesk.com/app-store/certified-apps/rainbowlink-desktop'),
            child: const _ProjectCard(
              title: 'Conector Autodesk Vault ↔ ERP',
              description:
              'App Flutter/Dart que integra Autodesk Vault con Microsoft Business Central y Odoo. '
                  'Integración con APIs SOAP/REST. Proyecto con certificación oficial de Autodesk.',
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({required this.title, required this.description});
  final String title;
  final String description;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 180),
        scale: _hover ? 1.02 : 1.0,
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .06),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  )),
              const SizedBox(height: 8),
              Text(widget.description,
                  style: const TextStyle(color: Colors.white, height: 1.5)),
            ],
          ),
        ),
      ),
    );
  }
}