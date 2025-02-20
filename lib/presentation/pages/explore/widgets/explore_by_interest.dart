import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app_ui/store/theme_store.dart';

// ignore: must_be_immutable
class ExploreByInterest extends StatelessWidget {
  ExploreByInterest({super.key});

  final ThemeController themeController = Get.find(); // Retrieve the instance

  List<Map<String, dynamic>> userInterests = [
    {"id": 1, "label": "Fashion", "emoji": '👠', "value": "fashion"},
    {"id": 2, "label": "Sports", "emoji": '🏅', "value": "sports"},
    {"id": 3, "label": " Concert", "emoji": '🕺', "value": "concern"},
    {"id": 4, "label": "Art", "emoji": '🎨', "value": "art"}
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 15),
      child: Column(
        spacing: 10,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Explore By Interest',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: userInterests.length,
              itemBuilder: (BuildContext context, index) {
                return Obx(() {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              color: themeController.isDarkMode.value
                                  ? const Color(0xFF08060E)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            spacing: 2,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(userInterests[index]['emoji'],
                                  style: const TextStyle(fontSize: 28)),
                              Text(
                                userInterests[index]['label'],
                                style: const TextStyle(fontSize: 12),
                              )
                            ],
                          )),
                    ),
                  );
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
