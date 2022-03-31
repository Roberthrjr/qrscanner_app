import 'package:flutter/material.dart';
import 'package:qrscanner_app/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String selectedType = 'http';

  Future<ScanModel> newScan(String value) async {
    final newScan = ScanModel(valor: value);
    final id = await DBProvider.db.newScan(newScan);

    //Asignar el ID de la base de datos al modelo
    newScan.id = id;

    if (selectedType == newScan.tipo) {
      scans.add(newScan);
      notifyListeners();
    }

    return newScan;
  }

  loadScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...?scans];
    notifyListeners();
  }

  loadScanByType(String type) async {
    final scans = await DBProvider.db.getScansByType(type);
    this.scans = [...?scans];
    selectedType = type;
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  deleteScanById(int id) async {
    await DBProvider.db.deleteScanById(id);
  }
}
