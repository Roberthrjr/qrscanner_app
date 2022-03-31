import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:qrscanner_app/providers/ui_provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOption;

    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectedMenuOption = i,
      currentIndex: currentIndex,
      elevation: 0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration),
          label: 'Addresses',
        ),
      ],
    );
  }
}
