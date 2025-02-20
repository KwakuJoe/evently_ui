import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ticket_app_ui/store/theme_store.dart';
import 'package:ticket_app_ui/presentation/widgets/divider.dart';
import 'package:ticket_app_ui/presentation/widgets/primary_button.dart';

class EventCheckout extends StatefulWidget {
  EventCheckout({super.key});

  @override
  State<EventCheckout> createState() => _EventCheckoutState();
}

class _EventCheckoutState extends State<EventCheckout> {
     final ThemeController themeController = Get.find<ThemeController>();

  int amount = 1;

  void increaseAmount() {
    if (amount > 9) {
      return;
    }
    setState(() {
      amount++;
    });
  }

  void decreaseAmount() {
    if (amount < 1) {
      return;
    }

    setState(() {
      amount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(
                    spacing: 10,
                    children: [
                      Icon(
                        HugeIcons.strokeRoundedMegaphone02,
                        color: Theme.of(context).primaryColor,
                      ),
                      Text(
                        'Free Cancellation before 5 Dec, 2023',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // card
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: themeController.isDarkMode.value
                      ? const Color(0xFF08060E)
                      : Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    spacing: 20,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F911878343%2F30704669617%2F1%2Foriginal.20241204-231752?w=512&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C186%2C1080%2C540&s=a734db08284615746cf0369f5bf98802',
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Column(
                          spacing: 1,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '8 December 20:00',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'NBA Finals | Boston VS Golden State Warriors | Finals',
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Text(
                              'Ticket : Balcony Seat Tickets ',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 1,
              ),

              // order summary
              const Text('Order summary'),

              // spacer

              // list
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'jamesdoe@gmail.com',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'GHS 50.00',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),

              // divider

              CustomDivider(),

              // quantity
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Amount',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: themeController.isDarkMode.value
                            ? const Color(0xFF4A435B)
                            : const Color(0xFFD9D5E4),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        spacing: 20,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: decreaseAmount,
                            child: const Icon(
                              HugeIcons.strokeRoundedMinusSign,
                              size: 16,
                            ),
                          ),
                          CircleAvatar(
                            radius: 18,
                            backgroundColor:
                                Theme.of(context).primaryColor.withOpacity(0.2),
                            child: Text(
                              amount.toString(),
                              style: TextStyle(
                                fontSize: 16,
                                color: themeController.isDarkMode.value
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: increaseAmount,
                            child: const Icon(
                              HugeIcons.strokeRoundedPlusSign,
                              size: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              // divider
              CustomDivider(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sub total',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'GHS 50.00',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Service Fee',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'GHS 2.00',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              // divider
              CustomDivider(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle( 
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'GHS 52.00',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),

              const SizedBox(
                height: 15,
              ),
              PrimaryButton(
                  label: 'Buy now',
                  onPressed: () {
                    Get.toNamed('/checkout-successful');
                  })
            ],
          ),
        ),
      ),
    );
  }
}
