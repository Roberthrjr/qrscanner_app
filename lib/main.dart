import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qrscanner_app/pages/home_page.dart';
import 'package:qrscanner_app/pages/map_page.dart';

import 'package:qrscanner_app/providers/scan_list_provider.dart';
import 'package:qrscanner_app/providers/ui_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Scanner',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'map': (_) => MapPage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
