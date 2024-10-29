import 'package:flutter/material.dart';

class PayTextField extends StatefulWidget {
  const PayTextField({
    super.key,
    required this.title,
    required this.hint,
    this.autofillHints,
    this.controller,
    this.onChanged,
    this.validator,
    this.suffix,
  }) : isPassword = false;

  const PayTextField.password({
    super.key,
    required this.title,
    required this.hint,
    this.autofillHints,
    this.controller,
    this.onChanged,
    this.validator,
    this.suffix,
  }) : isPassword = true;

  final String title;
  final String? hint;
  final Iterable<String>? autofillHints;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? suffix;

  final bool isPassword;

  @override
  State<PayTextField> createState() => _PayTextFieldState();
}

class _PayTextFieldState extends State<PayTextField> {
  bool obscurePassword = false;

  void _togglePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).inputDecorationTheme.labelStyle,
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: widget.controller,
          autofillHints: widget.autofillHints,
          obscureText: obscurePassword,
          onChanged: widget.onChanged,
          validator: widget.validator,
          decoration: InputDecoration(
            suffixIconConstraints: const BoxConstraints(maxWidth: 80),
            hintText: widget.hint,
            suffixIcon: widget.isPassword
                ? InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    onTap: _togglePassword,
                    child: DefaultTextStyle(
                      style: Theme.of(context)
                          .inputDecorationTheme
                          .labelStyle!
                          .copyWith(fontSize: 12),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: switch (obscurePassword) {
                          true => const Text('SHOW'),
                          false => const Text('HIDE'),
                        },
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
