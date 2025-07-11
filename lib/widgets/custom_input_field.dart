import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final VoidCallback? onTap;

  const CustomInputField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            readOnly: readOnly,
            onTap: onTap,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            ),
          ),
        ],
      ),
    );
  }
}
