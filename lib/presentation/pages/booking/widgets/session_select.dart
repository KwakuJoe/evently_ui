import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app_ui/store/theme_store.dart';

// ignore: must_be_immutable
class SessionSelect extends StatefulWidget {
  void Function(Map<String, dynamic>) onSessionSelection;
  SessionSelect({super.key, required this.onSessionSelection});

  @override
  State<SessionSelect> createState() => _SelectSessionState();
}

class _SelectSessionState extends State<SessionSelect> {
     final ThemeController themeController = Get.find<ThemeController>();

  // List of sessions with initial selection state
  List<Map<String, dynamic>> sessions = [
    {"day": "Fri", "date": "8 Dec", "isSelected": false},
    {"day": "Sat", "date": "9 Dec", "isSelected": false},
    {"day": "Sun", "date": "10 Dec", "isSelected": false},
    {"day": "Mon", "date": "11 Dec", "isSelected": false},
    {"day": "Tue", "date": "12 Dec", "isSelected": false},
  ];

  // Toggle selection
  void toggleSelection(int index) {
    setState(() {
      // Reset all to unselected
      for (var session in sessions) {
        session["isSelected"] = false;
      }
      // Set the selected index to true
      sessions[index]["isSelected"] = true;

      widget.onSessionSelection(sessions[index]);
    });
  }

  // Get selected date
  String? getSelectedDate() {
    final selectedSession = sessions.firstWhere(
      (session) => session["isSelected"] == true,
      orElse: () => {},
    );

    return selectedSession.isNotEmpty ? selectedSession["date"] : null;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: invalid_use_of_protected_member
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Select an event session',
            style: TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.w600,
                color: themeController.isDarkMode.value
                    ? Colors.white54
                    : Colors.black45),
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sessions.length,
            itemBuilder: (BuildContext context, index) {
              final session = sessions[index];
              final isSelected = session["isSelected"] ?? false;

              return GestureDetector(
                onTap: () => toggleSelection(index),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 3,
                          color: isSelected
                              ? Theme.of(context).primaryColor
                              : Colors.transparent),
                      color: themeController.isDarkMode.value
                          ? const Color(0xFF08060E)
                          : Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          session["day"],
                          style: const TextStyle(
                            fontSize: 16,
                            // color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          session["date"],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            // color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
