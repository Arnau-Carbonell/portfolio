import 'package:flutter/material.dart';

import '../../utils/card_wrap.dart';

class SummarySection extends StatelessWidget {
  const SummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return CardWrap(
      title: 'Resumen profesional',
      child: const Text(
        'Desarrollador de aplicaciones multiplataforma con más de 2 años de experiencia en Flutter, '
            'especializado en arquitectura hexagonal y diseño atómico. Experiencia en integración de '
            'APIs REST/SOAP y desarrollo de soluciones certificadas por Autodesk. Apasionado por la '
            'tecnología y la mejora continua en el desarrollo de software.',
        style: TextStyle(color: Colors.white, height: 1.5),
      ),
    );
  }
}