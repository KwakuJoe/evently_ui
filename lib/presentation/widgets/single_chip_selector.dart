import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app_ui/store/theme_store.dart';

class SingleChoiceSelector extends StatefulWidget {
  final List<Map<String, dynamic>> chipOptions;
  final void Function(dynamic) onSelectionChanged; // Callback to notify selected item

  const SingleChoiceSelector({
    Key? key,
    required this.chipOptions,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  State<SingleChoiceSelector> createState() => _SingleChoiceSelectorState();
}

class _SingleChoiceSelectorState extends State<SingleChoiceSelector> {
     final ThemeController themeController = Get.find<ThemeController>();
  int? selectedChipIndex;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // Space between chips horizontally
      runSpacing: 8.0, // Space between rows
      children: widget.chipOptions.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, dynamic> item = entry.value;
    
        return FilterChip(
          label: Text('${item["emoji"] ?? ''} ${item["label"] }'),
          selected: selectedChipIndex == index,
          side: BorderSide.none,
          selectedColor: Theme.of(context).primaryColor,
          checkmarkColor: Colors.white,
          backgroundColor: themeController.isDarkMode.value
              ? const Color(0XFF1C1A25)
              : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          onSelected: (selected) {
            setState(() {
              selectedChipIndex = selected ? index : null;
            });
    
            // Notify parent widget of the selected item
            widget.onSelectionChanged(
              selected ? item['value'] : null,
            );
          },
        );
      }).toList(),
    );
  }
}
