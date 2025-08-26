import 'package:flutter/material.dart';

import '../../utils/card_wrap.dart';
import '../../utils/open_url.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CardWrap(
      title: 'Contacto',
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          FilledButton.icon(
            onPressed: () => openUrl('mailto:arnauc32@gmail.com'),
            icon: const Icon(Icons.mail_outline_rounded),
            label: const Text('arnauc32@gmail.com'),
          ),
          OutlinedButton.icon(
            onPressed: () => openUrl('tel:+34615926677'),
            icon: const Icon(Icons.phone_rounded, color: Colors.white,),
            label: const Text('+34 615 92 66 77', style: TextStyle(color: Colors.white),),
          ),
          OutlinedButton.icon(
            onPressed: () => openUrl(
                'https://www.linkedin.com/in/arnau-carbonell-71165827a'),
            icon: const Icon(Icons.launch_rounded, color: Colors.white,),
            label: const Text('LinkedIn', style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}
