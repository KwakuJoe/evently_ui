import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app_ui/store/theme_store.dart';

class HomeFilterChipsSelector extends StatefulWidget {
  const HomeFilterChipsSelector({super.key});

  @override
  State<HomeFilterChipsSelector> createState() =>
      _HomeFilterChipsSelectorState();
}

class _HomeFilterChipsSelectorState extends State<HomeFilterChipsSelector> {
     final ThemeController themeController = Get.find();

  final List<String> items = [
    "All",
    "Seminars",
    "Party",
    "Stand-up shows",
    "Sport",
    "Conferences"
  ];

  String? selectedChip = "All";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50, // Fixed height to avoid overflow
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final label = items[index];
          final isSelected = selectedChip == label;
    
          return Obx(() => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ChoiceChip(
              label: Text(
                label,
                style: TextStyle(
                    color: themeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black),
              ),
              selected: isSelected,
              backgroundColor: themeController.isDarkMode.value
                  ? const Color(0xFF08060E)
                  : Colors.white,
              selectedColor: Theme.of(context).primaryColor,
              shape: const StadiumBorder(
                side: BorderSide(
                  style: BorderStyle.none,
                ),
              ),
              onSelected: (bool selected) {
                setState(() {
                  selectedChip = selected ? label : null;
                });
              },
            ),
          )) ;
        },
      ),
    );
  }
}
