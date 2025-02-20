import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app_ui/store/theme_store.dart';

class UpdateUserInterest extends StatefulWidget {
  final List<Map<String, dynamic>> chipOptions;
  final void Function(List<String>) onSelectionChanged; // Callback to notify selected items

  const UpdateUserInterest({
    super.key,
    required this.chipOptions,
    required this.onSelectionChanged,
  });

  @override
  State<UpdateUserInterest> createState() =>
      _MultiChipSelectorState();
}

class _MultiChipSelectorState extends State<UpdateUserInterest> {
     final ThemeController themeController = Get.find<ThemeController>();

  // Maintain local state for chip options
  late List<Map<String, dynamic>> localChipOptions;

  @override
  void initState() {
    super.initState();
    // Initialize local state
    localChipOptions = List.from(widget.chipOptions);
  }

  // Function to toggle selection and notify parent widget
  void toggleSelection(int index) {
    setState(() {
      localChipOptions[index]["isSelected"] =
          !localChipOptions[index]["isSelected"];
    });

    // Emit selected items to the parent widget
    widget.onSelectionChanged(
      localChipOptions
          .where((item) => item["isSelected"] == true)
          .map((item) => item["value"] as String)
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // Space between chips horizontally
      runSpacing: 8.0, // Space between rows
      children: localChipOptions.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, dynamic> item = entry.value;

        return FilterChip(
          label: Text('${item["emoji"]} ${item["label"]}'),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: themeController.isDarkMode.value? const Color(0XFF1C1A25) : Colors.white,
          selected: item["isSelected"] ?? false,
          onSelected: (_) => toggleSelection(index),
          selectedColor: Theme.of(context).primaryColor,
          checkmarkColor: Colors.white,
        );
      }).toList(),
    );
  }
}
