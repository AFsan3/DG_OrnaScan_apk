import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:hive/hive.dart';

class OrnaScanScreen extends StatefulWidget {
  const OrnaScanScreen({super.key});

  @override
  State<OrnaScanScreen> createState() => _OrnaScanScreenState();
}

class _OrnaScanScreenState extends State<OrnaScanScreen> {
  String result = 'No scan yet';
  Map<String, dynamic>? scannedItem;

  void _scanBarcode() async {
    String barcode = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666', 'Cancel', true, ScanMode.BARCODE,
    );

    if (barcode != '-1') {
      final box = Hive.box('products');
      final items = box.values.where((e) => e['name'] == barcode);
      setState(() {
        if (items.isNotEmpty) {
          scannedItem = items.first;
          result = 'Item found: ${scannedItem!['name']}';
        } else {
          result = 'Item not found!';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OrnaScan')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _scanBarcode,
              child: const Text('Scan Barcode'),
            ),
            const SizedBox(height: 20),
            Text(result),
            if (scannedItem != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Purity: ${scannedItem!['purity']}'),
                  Text('Weight: ${scannedItem!['weight']}g'),
                  Text('Price: ₹ (calculated)'), // You can calculate and show it here
                ],
              ),
          ],
        ),
      ),
    );
  }
}
