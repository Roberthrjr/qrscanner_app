// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner_app/providers/scan_list_provider.dart';
import 'package:qrscanner_app/utils/utils.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancel', false, ScanMode.QR);
        //final barcodeScanRes = 'geo:-8.820138,-77.460414';
        //final barcodeScanRes = 'https://www.mastermind.ac/';

        if (barcodeScanRes == '-1') {
          return;
        }

        if (!barcodeScanRes.contains('http') &&
            !barcodeScanRes.contains('geo')) {
          _showAlert(context);
          return;
        }

        final scanListProvider = Provider.of<ScanListProvider>(
          context,
          listen: false,
        );

        final newScan = await scanListProvider.newScan(barcodeScanRes);

        launchURL(context, newScan);
      },
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('Invalid Scan Type'),
          content: const Text(
              'The scanned qr does not return information of type http or geo'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Ok',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            )
          ],
        );
      },
    );
  }
}
