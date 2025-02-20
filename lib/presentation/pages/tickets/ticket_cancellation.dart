import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ticket_app_ui/store/theme_store.dart';
import 'package:ticket_app_ui/presentation/widgets/primary_button.dart';

class TicketCancellationScreen extends StatefulWidget {
  const TicketCancellationScreen({super.key});

  @override
  State<TicketCancellationScreen> createState() =>
      _TicketCancellationScreenState();
}

class _TicketCancellationScreenState extends State<TicketCancellationScreen> {
     final ThemeController themeController = Get.find<ThemeController>();

  String? selectedAnswer; // Variable to hold selected answer

  final List<String> options = [
    "I have another event, so it collides",
    "I'm sick, can't make it",
    "I have an urgent need",
    "I have no transparent to come",
    "I want to book another event",
    "I just want to cancel",
    "Another reason"
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cancel Booking'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            spacing: 20,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: themeController.isDarkMode.value
                      ? const Color(0xFF08060E)
                      : Colors.white,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 15,
                  ),
                  child: Row(
                    spacing: 10,
                    children: [
                      Icon(HugeIcons.strokeRoundedWallet01),
                      Text(
                        'Funds will be return in two working days',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    const Text(
                      "Select the reason for cancellation:", // Example question
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: options.map((option) {
                        return RadioListTile<String>(
                          title: Text(option),
                          value: option,
                          groupValue: selectedAnswer,
                          onChanged: (value) {
                            setState(() {
                              selectedAnswer = value; // Update selected answer
                            });
                          },
                          // activeColor: Colors.blue, // Color of selected radio
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
        
              PrimaryButton(label: 'Cancel Booking', onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}
