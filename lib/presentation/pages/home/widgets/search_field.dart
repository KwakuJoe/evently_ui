import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ticket_app_ui/store/theme_store.dart';

class HomeSearchField extends StatefulWidget {
  final String label;
  final String name;
  final TextEditingController controller;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final void Function(String?)? onSubmitted;

  const HomeSearchField({
    super.key,
    required this.label,
    required this.name,
    required this.controller,
    this.leadingIcon,
    this.trailingIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.textInputAction,
    this.onSubmitted,
  });

  @override
  State<HomeSearchField> createState() => _HomeSearchFieldState();
}

class _HomeSearchFieldState extends State<HomeSearchField> {

    final FocusNode _focusNode = FocusNode();

    @override
  void dispose() {
    _focusNode.dispose(); // Dispose focus node when leaving screen
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    




    return Obx((){
      return     Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: themeController.isDarkMode.value ? const Color(0xFF08060E) : Colors.white
        ),
        child: FormBuilderTextField(
          focusNode: _focusNode,
          name: widget.name,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          textInputAction: widget.textInputAction,
          onSubmitted: widget.onSubmitted,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            hintText: widget.label,
            hintStyle: TextStyle(
                color: themeController.isDarkMode.value
                    ? Colors.white54
                    : Colors.black45),
            prefixIcon: widget.leadingIcon,
            suffixIcon: widget.trailingIcon,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: const TextStyle(fontWeight: FontWeight.w400),
            border: InputBorder.none, // No border
            enabledBorder: InputBorder.none, // No border when enabled
            focusedBorder: InputBorder.none,
          ),
          validator: widget.validator,
        ),
      ),
    );
    });
    

  }
}
