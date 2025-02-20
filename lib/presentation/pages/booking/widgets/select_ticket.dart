import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ticket_app_ui/store/theme_store.dart';
import 'package:ticket_app_ui/presentation/widgets/divider.dart';

// ignore: must_be_immutable
class TicketSelect extends StatefulWidget {
  void Function(Map<String, dynamic>) onSessionSelection;
  TicketSelect({super.key, required this.onSessionSelection});

  @override
  State<TicketSelect> createState() => _SelectSessionState();
}

class _SelectSessionState extends State<TicketSelect> {
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
            'Select an event ticket',
            style: TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.w600,
                color: themeController.isDarkMode.value
                    ? Colors.white54
                    : Colors.black45),
          ),
        ),
        ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: sessions.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, index) {
            final session = sessions[index];
            final isSelected = session["isSelected"] ?? false;

            return GestureDetector(
              onTap: () => toggleSelection(index),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Container(
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
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      spacing: 3,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              spacing: 10,
                              children: [
                                Text(
                                  'Ticket $index',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                 Icon(
                                    HugeIcons.strokeRoundedHelpCircle,
                                    size: 16,
                                    color: Theme.of(context).primaryColor,
                                  )
                              ],
                            ),
                            isSelected
                                ? Container(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 2),
                                      child: Text(
                                        'Selected',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                themeController.isDarkMode.value
                                                    ? Colors.black
                                                    : Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  )
                                : const SizedBox(
                                    width: 0,
                                  )
                          ],
                        ),
                        // divider
                        CustomDivider(),
                        Row(
                          spacing: 10,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(HugeIcons.strokeRoundedTicket01)
                                ],
                              ),
                            ),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    maxLines: 1,
                                    'Balcony Seat Tickets dddddddd ddd',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                  Text(
                                    'Ticket left: 20',
                                  ),
                                ],
                              ),
                            ),
                            const Text(
                              '\$50.00',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
