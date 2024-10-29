import 'package:flutter/material.dart';

class PayTextField extends StatelessWidget {
  const PayTextField({
    super.key,
    required this.title,
    required this.hint,
    this.autofillHints,
    this.controller,
    this.onChanged,
    this.validator,
  });

  final String title;
  final String hint;
  final Iterable<String>? autofillHints;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          autofillHints: autofillHints,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
