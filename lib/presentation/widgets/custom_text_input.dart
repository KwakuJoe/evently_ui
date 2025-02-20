import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String name;
  final String? errorText;
  final bool? readOnly;
  final TextEditingController controller;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final void Function(String?)? onSubmitted;

  const CustomTextField({
    super.key,
    required this.label,
    required this.name,
     this.readOnly,
    required this.controller,
    this.leadingIcon,
    this.trailingIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.textInputAction,
    this.onSubmitted,
    this.errorText
  });

  @override
  Widget build(BuildContext context) {

    return FormBuilderTextField(
      name: name,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      textInputAction: textInputAction,
      readOnly: readOnly ?? false,
      onSubmitted: onSubmitted,
      style:  const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        helperText: errorText ,
        helperStyle: const TextStyle(color: Colors.red),
        contentPadding: const EdgeInsets.all(20),
        labelText: label,
        prefixIcon: leadingIcon,
        suffixIcon: trailingIcon,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: const TextStyle(fontWeight: FontWeight.w400),
      ),
      validator: validator,
    );
  }
}
