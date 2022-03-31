import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qrscanner_app/pages/addresses_page.dart';
import 'package:qrscanner_app/pages/maps_page.dart';
import 'package:qrscanner_app/providers/scan_list_provider.dart';

import 'package:qrscanner_app/providers/ui_provider.dart';

import 'package:qrscanner_app/widgets/custom_navigator_bar.dart';
import 'package:qrscanner_app/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //backgroundColor: Colors.indigo,
        title: const Text('Historial'),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ScanListProvider>(context, listen: false)
                    .deleteAll();
              },
              icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigatorBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: ,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    //Cambiar para mostra la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOption;

    //Usar el ScanListProvider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return MapsPage();
      case 1:
        scanListProvider.loadScansByType('http');
        return AddressesPage();
      default:
        return MapsPage();
    }
  }
}
