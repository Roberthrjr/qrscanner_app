import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner_app/providers/scan_list_provider.dart';
import 'package:qrscanner_app/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  // ignore: use_key_in_widget_constructors
  const ScanTiles({required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, i) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (DismissDirection direction) {
                Provider.of<ScanListProvider>(context, listen: false)
                    .deleteScanById(scans[i].id!);
              },
              child: ListTile(
                leading: Icon(
                  tipo == 'http' ? Icons.compass_calibration : Icons.map,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(scans[i].valor!),
                subtitle: Text(scans[i].id.toString()),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
                onTap: () => launchURL(context, scans[i]),
              ),
            ));
  }
}
