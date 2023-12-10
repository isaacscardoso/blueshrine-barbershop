import 'package:flutter/material.dart';

final class CustomTextFormField extends StatelessWidget {
  final String label;
  final Color? color;

  const CustomTextFormField({super.key, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: TextStyle(color: color ?? Colors.black),
        hintText: label,
        hintStyle: TextStyle(color: color ?? Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}
