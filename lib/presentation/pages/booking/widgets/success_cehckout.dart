import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app_ui/store/theme_store.dart';
import 'package:ticket_app_ui/presentation/widgets/divider.dart';
import 'package:ticket_app_ui/presentation/widgets/primary_button.dart';
import 'package:ticket_app_ui/presentation/widgets/secondary_button.dart';

class CheckoutSuccessFull extends StatelessWidget {
  CheckoutSuccessFull({super.key});
     final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 50,
          ),
          child: Column(
            children: [
              const Center(
                child: SizedBox(
                  height: 250,
                  child: Image(
                    image:
                        AssetImage('assets/images/general/ticket-success.png'),
                  ),
                ),
              ),
              Column(
                spacing: 5,
                children: [
                  const Text(
                    'Ticket Purchase Successful!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Your ticket has been booked successfully. Show this at the event entrance.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: themeController.isDarkMode.value
                            ? Colors.white54
                            : Colors.black45),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                spacing: 7,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Event',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: const Text(
                          'NBA Finals | Boston VS Golden States | Lorem',
                          textAlign: TextAlign.end,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  ),

                  // divider
                  CustomDivider(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Date',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: const Text(
                          '17 Nov, 2025 - 8:00PM ',
                          textAlign: TextAlign.end,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  ),

                  // divider
                  CustomDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ticket',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: const Text(
                          'Balcony Seat VIP',
                          textAlign: TextAlign.end,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  ),

                  // divider
                  CustomDivider(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Order ID',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: const Text(
                          '0D37477',
                          textAlign: TextAlign.end,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  ),

                  CustomDivider(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total paid',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: const Text(
                          'GHS 200.00',
                          textAlign: TextAlign.end,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  ),

                  CustomDivider(),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              PrimaryButton(label: 'View tickets', onPressed: () {}),
              SizedBox(
                height: 10,
              ),
              SecondaryButton(label: 'Go back', onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
