import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class RateSettingsScreen extends StatefulWidget {
  const RateSettingsScreen({super.key});

  @override
  State<RateSettingsScreen> createState() => _RateSettingsScreenState();
}

class _RateSettingsScreenState extends State<RateSettingsScreen> {
  final TextEditingController _rate22kController = TextEditingController();
  final TextEditingController _rate18kController = TextEditingController();
  final TextEditingController _silverController = TextEditingController();
  final TextEditingController _acplController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final box = Hive.box('rates');
    _rate22kController.text = box.get('rate22k', defaultValue: '').toString();
    _rate18kController.text = box.get('rate18k', defaultValue: '').toString();
    _silverController.text = box.get('silver', defaultValue: '').toString();
    _acplController.text = box.get('acpl', defaultValue: '').toString();
  }

  void _saveRates() {
    final box = Hive.box('rates');
    box.put('rate22k', _rate22kController.text);
    box.put('rate18k', _rate18kController.text);
    box.put('silver', _silverController.text);
    box.put('acpl', _acplController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Rates saved successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rate Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _rate22kController,
              decoration: const InputDecoration(labelText: 'Gold 22K Rate'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _rate18kController,
              decoration: const InputDecoration(labelText: 'Gold 18K Rate'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _silverController,
              decoration: const InputDecoration(labelText: 'Silver Rate'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _acplController,
              decoration: const InputDecoration(labelText: 'Silver ACPL Rate'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveRates,
              child: const Text('Save Rates'),
            ),
          ],
        ),
      ),
    );
  }
}
