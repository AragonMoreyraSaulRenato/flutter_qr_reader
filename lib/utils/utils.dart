import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan) async {
  final url = scan.valor;
  if (scan.tipo == 'geo') {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
    return;
  }

  if (await canLaunch(url)) {
    await launch(url);
  } else
    throw 'Could no launch $url';
}
