import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/card_wrap.dart';

class EducationSection extends StatefulWidget {
  const EducationSection({super.key});

  @override
  State<EducationSection> createState() => _EducationSectionState();
}

class _EducationSectionState extends State<EducationSection> {

  @override
  Widget build(BuildContext context) {
    final items = [
      EducationItem(
        title: 'CIEEP / Digitech: Máster en Inteligencia Artificial y Big Data',
        subtitle:'Oct 2025 – Actualidad',
      ),
      EducationItem(
        title:  'CIPFP Batoi, Alcoi – CFGS Desarrollo de Aplicaciones Multiplataforma',
        subtitle:'Sep 2021 – Mar 2023',
      ),
    ];

    return CardWrap(
      title: 'Formación académica',
      child: _Timeline(items),
    );
  }
}

class EducationItem {
  final String title;
  final String subtitle;

  EducationItem({
    required this.title,
    required this.subtitle,
  });
}

class _Timeline extends StatelessWidget {
  const _Timeline(this.items);
  final List<EducationItem> items;

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
  final EducationItem item;
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(widget.item.title,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(widget.item.subtitle,
                        style: const TextStyle(color: Colors.white70)),
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
