import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app_ui/presentation/pages/booking/widgets/select_ticket.dart';
import 'package:ticket_app_ui/presentation/pages/booking/widgets/session_select.dart';
import 'package:ticket_app_ui/presentation/widgets/primary_button.dart';

class SelectSession extends StatefulWidget {
  const SelectSession({super.key});

  @override
  State<SelectSession> createState() => _SelectSessionState();
}

class _SelectSessionState extends State<SelectSession> {
  Map<String, dynamic>? selectedDate;
  Map<String, dynamic>? selectedTicket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session selection & ticket'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Main content
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  spacing: 20,
                  children: [
                    SessionSelect(
                      onSessionSelection: (session) {
                        debugPrint('$session');
                        selectedDate = session;
                      },
                    ),
                    TicketSelect(
                      onSessionSelection: (ticket) {
                        debugPrint('$ticket');
                        selectedTicket = ticket;
                      },
                    )
                  ],
                ),
              ),
            ),
        
          ],
          
        ),
      ),
            bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: SizedBox(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: PrimaryButton(
              label: 'Continue',
             onPressed: () {
                if (selectedDate != null) {
                  print('Selected date: $selectedDate');
                  Get.toNamed('/event-checkout');
                } else {
                  print('No date selected');
                }
              },
            ),
          ),
        ),
      )
    );
  }
}
