import 'package:flutter/material.dart';
import 'rate_settings_screen.dart';
import 'add_edit_items_screen.dart';
import 'ornascan_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DG OrnaScan'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const RateSettingsScreen()));
            },
            child: const Text('Rate Settings'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AddEditItemsScreen()));
            },
            child: const Text('Add & Edit Items'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const OrnaScanScreen()));
            },
            child: const Text('OrnaScan'),
          ),
        ],
      ),
    );
  }
}
