import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/card_wrap.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ExperienceItem(
        company: 'Adsalsa, Alcoi',
        role: 'Programador de Aplicaciones',
        period: 'Mar 2024 – Jun 2025',
        bullets: const [
          'Apps en Flutter: Lotocheck, PlanEat y BodyFix',
          'Patrones: BLoC, arquitectura hexagonal y sistemas de plantillas',
          'UI mejorada con Atomic Design',
        ],
      ),
      ExperienceItem(
        company: 'Onduex, Alcoi',
        role: 'Programador en prácticas',
        period: 'Mar 2023 – Sep 2023',
        bullets: const [
          'Desarrollo multiplataforma con Dart/Flutter',
          'Implementación de features y optimización',
        ],
      ),
      ExperienceItem(
        company: 'Proyecto Odoo',
        role: 'Desarrollador (prácticas)',
        period: 'Mar 2021 – Jun 2021',
        bullets: const [
          'Desarrollo de módulos en Odoo con Python',
        ],
      ),
    ];

    return CardWrap(title: 'Experiencia profesional', child: _Timeline(items));
  }
}

class ExperienceItem {
  final String company;
  final String role;
  final String period;
  final List<String> bullets;
  ExperienceItem({
    required this.company,
    required this.role,
    required this.period,
    required this.bullets,
  });
}

class _Timeline extends StatelessWidget {
  const _Timeline(this.items);
  final List<ExperienceItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 0; i < items.length; i++) _TimelineItem(item: items[i], last: i == items.length - 1),
      ],
    );
  }
}

class _TimelineItem extends StatefulWidget {
  const _TimelineItem({required this.item, this.last = false});
  final ExperienceItem item;
  final bool last;

  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem> with SingleTickerProviderStateMixin {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: _hover ? .1 : .06),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // línea timeline
              SizedBox(
                width: 40,
                child: Column(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Color(0xFF22D3EE),
                        shape: BoxShape.circle,
                      ),
                    ),
                    if (!widget.last)
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        width: 2,
                        height: 60,
                        color: Colors.white24,
                      )
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // contenido
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.item.role,
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        )),
                    const SizedBox(height: 4),
                    Text('${widget.item.company} · ${widget.item.period}',
                        style: const TextStyle(color: Colors.white70)),
                    const SizedBox(height: 8),
                    ...widget.item.bullets.map(
                          (b) => Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('• ', style: TextStyle(color: Colors.white70)),
                            Expanded(
                              child: Text(b,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    height: 1.4,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}