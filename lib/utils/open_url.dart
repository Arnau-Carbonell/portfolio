import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
    throw 'No se pudo abrir: $url';
  }
}



Future<void> openEmail() async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: 'arnauc32@gmail.com',
    query: 'subject=Consulta desde la web&body=Hola Arnau,',
  );

  if (await canLaunchUrl(emailUri)) {
    await launchUrl(emailUri);
  }
}