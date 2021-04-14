import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/widgets/scan_list.dart';

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanList(type: 'geo');
  }
}
