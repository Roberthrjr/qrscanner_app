import 'package:flutter/material.dart';
import 'package:qrscanner_app/widgets/scan_tiles.dart';

class AddressesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'http');
  }
}
