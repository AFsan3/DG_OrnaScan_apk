import 'package:flutter/material.dart';
import '../models/item_model.dart';

class ItemCard extends StatelessWidget {
  final ItemModel item;
  final VoidCallback? onTap;

  const ItemCard({
    super.key,
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(
          item.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Model: ${item.model}"),
            Text("Purity: ${item.purity}"),
            Text("Weight: ${item.weight.toStringAsFixed(2)} g"),
            Text("Price: ₹${item.price.toStringAsFixed(2)}"),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        contentPadding: const EdgeInsets.all(12),
      ),
    );
  }
}
