import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final int maxLines;
  final TextEditingController? controller;
  final bool? obscureText;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;

  const CustomTextField(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged, this.controller, this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText ?? false,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Filed is required';
        }
        return null;
      },
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: kPrimaryColor),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(kPrimaryColor)),
    );
  }
}

OutlineInputBorder buildBorder([color]) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white));
}
