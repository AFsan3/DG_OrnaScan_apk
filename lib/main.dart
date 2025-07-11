import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/rate_settings_screen.dart';
import 'screens/add_edit_items_screen.dart';
import 'screens/ornascan_screen.dart';

void main() {
  runApp(DGOrnaScanApp());
}

class DGOrnaScanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DG OrnaScan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/rate-settings': (context) => RateSettingsScreen(),
        '/add-edit-items': (context) => AddEditItemsScreen(),
        '/ornascan': (context) => OrnaScanScreen(),
      },
    );
  }
}
