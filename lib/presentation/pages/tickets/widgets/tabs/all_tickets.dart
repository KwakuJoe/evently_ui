import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:ticket_app_ui/presentation/pages/tickets/widgets/event_review.dart';
import 'package:ticket_app_ui/store/theme_store.dart';
import 'package:ticket_app_ui/presentation/widgets/md_primary_button.dart';

class AllTickets extends StatelessWidget {
  final List<Map<String, dynamic>> events = [
    {"title": "Football Match", "date": DateTime(2024, 1, 16)},
    {"title": "Concert", "date": DateTime(2024, 1, 16)},
    {"title": "Conference", "date": DateTime(2024, 1, 17)},
    {"title": "Wedding", "date": DateTime(2024, 1, 17)},
    {"title": "Birthday Party", "date": DateTime(2024, 1, 18)},
  ];

     final ThemeController themeController = Get.find<ThemeController>();

  AllTickets({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔹 Group events by date
    Map<String, List<Map<String, dynamic>>> groupedData = {};

    for (var event in events) {
      String formattedDate = DateFormat('EEEE, d MMM').format(event["date"]);
      if (!groupedData.containsKey(formattedDate)) {
        groupedData[formattedDate] = [];
      }
      groupedData[formattedDate]!.add(event);
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: ListView.builder(
            itemCount: groupedData.keys.length,
            itemBuilder: (context, index) {
              String dateKey = groupedData.keys.elementAt(index);
              List<Map<String, dynamic>> eventList = groupedData[dateKey]!;

              return Column(
                spacing: 2,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔹 Date Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Text(
                      dateKey,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),

                  // 🔹 Events under the date
                  ...eventList.map(
                    (event) => Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: themeController.isDarkMode.value
                              ? const Color(0xFF08060E)
                              : Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed('/ticket');
                                },
                                child: Row(
                                  spacing: 20,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: const DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F911878343%2F30704669617%2F1%2Foriginal.20241204-231752?w=512&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C186%2C1080%2C540&s=a734db08284615746cf0369f5bf98802',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 5,
                                          right: 5,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.white,
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Icon(
                                                HugeIcons.strokeRoundedTicket01,
                                                color: Colors.black,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Expanded(
                                      child: Column(
                                        spacing: 1,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                '8 December 20:00',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: themeController
                                                            .isDarkMode.value
                                                        ? Colors.white
                                                        : Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 8,
                                                      vertical: 2),
                                                  child: Text(
                                                    'Paid',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: themeController
                                                                .isDarkMode
                                                                .value
                                                            ? Colors.black
                                                            : Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          const Text(
                                            'NBA Finals | Boston VS Golden State Warriors | Finals',
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                          const Text(
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Get.bottomSheet(
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            height: 300,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                spacing: 10,
                                                children: [
                                                  Column(
                                                    spacing: 10,
                                                    children: [
                                                      Container(
                                                        width: 50,
                                                        height: 3,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          color: Colors
                                                              .grey.shade200,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      const Text(
                                                        'Are you sure to cancel ?',
                                                        style: TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      const Text(
                                                        'Only 70% of funds will be refunded to your account according to policy.',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    spacing: 10,
                                                    children: [
                                                      MdPrimaryButton(
                                                        label:
                                                            'No, Let\'s keep',
                                                        isOutlined: false,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                      ),
                                                      MdPrimaryButton(
                                                        label: 'Yes, delete',
                                                        isOutlined: true,
                                                        color: Colors.redAccent,
                                                        onPressed: () {
                                                          Get.toNamed(
                                                              '/ticket-cancellation');
                                                        },
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
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.red,
                                    ),
                                    child: const Text("Cancel events"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.bottomSheet(const EventReview());
                                    },
                                    child: const Text("Leave a review"),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
