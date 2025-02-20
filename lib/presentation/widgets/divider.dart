import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app_ui/store/theme_store.dart';

class CustomDivider extends StatelessWidget {
  CustomDivider({super.key});
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: themeController.isDarkMode.value
          ? const Color(0xFF4A435B)
          : const Color(0xFFD9D5E4), // Line color
      thickness: 1, // Line thickness
    );
  }
}
