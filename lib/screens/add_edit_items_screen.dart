import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddEditItemsScreen extends StatefulWidget {
  const AddEditItemsScreen({super.key});

  @override
  State<AddEditItemsScreen> createState() => _AddEditItemsScreenState();
}

class _AddEditItemsScreenState extends State<AddEditItemsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _purityController = TextEditingController();
  final TextEditingController _makingChargeController = TextEditingController();
  final TextEditingController _stoneChargeController = TextEditingController();
  final TextEditingController _gstController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _diamondAmountController = TextEditingController();

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      final box = Hive.box('products');
      final item = {
        'name': _nameController.text,
        'weight': double.tryParse(_weightController.text) ?? 0.0,
        'purity': _purityController.text,
        'making': double.tryParse(_makingChargeController.text) ?? 0.0,
        'stone': double.tryParse(_stoneChargeController.text) ?? 0.0,
        'gst': double.tryParse(_gstController.text) ?? 0.0,
        'type': _typeController.text.toLowerCase(),
        'diamond': double.tryParse(_diamondAmountController.text) ?? 0.0,
      };
      await box.add(item);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Item added successfully!')),
      );

      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add/Edit Items')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _weightController,
                decoration: const InputDecoration(labelText: 'Net Weight (g)'),
                keyboardType: TextInputType.number,
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _purityController,
                decoration: const InputDecoration(labelText: 'Purity (22K/18K/Silver/ACPL)'),
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _makingChargeController,
                decoration: const InputDecoration(labelText: 'Making Charge'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _stoneChargeController,
                decoration: const InputDecoration(labelText: 'Stone Charge'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _gstController,
                decoration: const InputDecoration(labelText: 'GST (%)'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _diamondAmountController,
                decoration: const InputDecoration(labelText: 'Diamond Amount (if any)'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _typeController,
                decoration: const InputDecoration(labelText: 'Type (gold/silver/diamond)'),
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveItem,
                child: const Text('Save Item'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
