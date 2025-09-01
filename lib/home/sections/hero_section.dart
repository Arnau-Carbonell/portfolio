import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/open_url.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const _HeroBackground(),
          Align(
            alignment: isWide ? Alignment.centerLeft : Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isWide ? 80 : 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                children: [
                  Text(
                    'Arnau Carbonell',
                    textAlign: isWide ? TextAlign.left : TextAlign.center,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: isWide ? 64 : 42,
                      fontWeight: FontWeight.w800,
                      letterSpacing: .5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Desarrollador Flutter · Arquitectura Hexagonal · Atomic Design',
                    textAlign: isWide ? TextAlign.left : TextAlign.center,
                    style: GoogleFonts.montserrat(
                      color: Colors.white70,
                      fontSize: isWide ? 20 : 16,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    alignment:
                    isWide ? WrapAlignment.start : WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      FilledButton.icon(
                        onPressed: () => openUrl(
                            'https://www.linkedin.com/in/arnau-carbonell-71165827a'),
                        icon: const Icon(Icons.launch_rounded, color: Colors.white,),
                        label: const Text('LinkedIn'),
                      ),
                      OutlinedButton.icon(
                        onPressed: () => openUrl('mailto:arnauc32@gmail.com'),
                        icon: const Icon(Icons.mail_outline_rounded, color: Colors.white,),
                        label: const Text('Email', style: TextStyle( color: Colors.white),),
                      ),
                      OutlinedButton.icon(
                        onPressed: () => openUrl(
                            'https://arnaucarbonell.com/files/CV_ArnauCarbonell.pdf'),
                        icon: const Icon(Icons.picture_as_pdf_rounded, color: Colors.white,),
                        label: const Text('Descargar CV',style: TextStyle( color: Colors.white),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _HeroBackground extends StatelessWidget {
  const _HeroBackground();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BlobPainter(),
      child: const SizedBox.expand(),
    );
  }
}

class _BlobPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF60A5FA), Color(0xFF22D3EE)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 60);

    final path = Path();
    path.moveTo(size.width * .75, size.height * .15);
    path.cubicTo(size.width * 1.1, size.height * .1, size.width * .95,
        size.height * .55, size.width * .6, size.height * .5);
    path.cubicTo(size.width * .25, size.height * .45, size.width * .35,
        size.height * .85, size.width * .05, size.height * .8);
    path.cubicTo(size.width * .0, size.height * .6, size.width * .25,
        size.height * .1, size.width * .55, size.height * .2);
    path.close();

    canvas.save();
    canvas.translate(0, -40);
    canvas.rotate(-6 * math.pi / 180);
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}