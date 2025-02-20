import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app_ui/store/theme_store.dart';

// ignore: must_be_immutable
class PersonalCategoryEventLists extends StatelessWidget {
  Map<String, dynamic> event;
  PersonalCategoryEventLists({super.key, required this.event});
     final ThemeController themeController = Get.find<ThemeController>();
  List<Map<String, dynamic>> youMightLike = [
    {
      'id': 0001,
      'title': 'The Shakespeare annual Conference',
      'image':
          'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F909093663%2F1611177855063%2F1%2Foriginal.20241130-194238?crop=focalpoint&fit=crop&w=512&auto=format%2Ccompress&q=75&sharp=10&fp-x=0.5&fp-y=0.5&s=50db8e5b5261a8b8b7487951d2f8bd8a',
      "position": '1',
      'date': '27 December, 2025',
      'location': 'Accra, Ghana',
      'time': '20:30'
    },
    {
      'id': 0002,
      'title': 'All Night for Jesus | Revival',
      'image':
          'https://images.unsplash.com/photo-1531058020387-3be344556be6?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8ZXZlbnR8ZW58MHx8MHx8fDA%3D',
      "position": '2',
      'date': '27 December, 2025',
      'location': 'Accra, Ghana',
      'time': '20:30'
    },
    {
      'id': 0006,
      'title': 'The Shakespeare annual Conference',
      'image':
          'https://images.unsplash.com/photo-1580130732478-4e339fb6836f?q=80&w=3402&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      "position": '5',
      'date': '27 December, 2025',
      'location': 'Accra, Ghana',
      'time': '20:30'
    },
    {
      'id': 0003,
      'title': 'Biggest Party of the year',
      'image':
          'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F897860553%2F261210139653%2F1%2Foriginal.20241113-032433?crop=focalpoint&fit=crop&auto=format%2Ccompress&q=75&sharp=10&fp-x=0.5&fp-y=0.5&s=c53b73f621408e5ac52b76765598800d',
      "position": '3',
      'date': '27 December, 2025',
      'location': 'Accra, Ghana',
      'time': '20:30'
    },
    {
      'id': 0004,
      'title': 'The Shakespeare annual Conference',
      'image':
          'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F911878343%2F30704669617%2F1%2Foriginal.20241204-231752?w=512&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C186%2C1080%2C540&s=a734db08284615746cf0369f5bf98802',
      "position": '4',
      'date': '27 December, 2025',
      'location': 'Accra, Ghana',
      'time': '20:30'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        spacing: 20,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              children: [
                Text(
                  event['label'],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 210,
            child: ListView.builder(
                itemCount: event['events'].length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, index) {
                  return Obx(() =>  Padding(
                    padding: const EdgeInsets.only(right: 0, left: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 300,
                        height: 210,
                        color: themeController.isDarkMode.value
                            ? const Color(0xFF08060E)
                            : Colors.white,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                CachedNetworkImage(
                                  height: 120,
                                  width: double.infinity,
                                  imageUrl: event['events'][index]
                                      ['image'], // Replace with your image URL
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                                Positioned(
                                    bottom: 10,
                                    right: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 2),
                                        child: Text(
                                          'from ₵20',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      spacing: 1.5,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${event['events'][index]['date']} - ${event['events'][index]['time']}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: themeController
                                                      .isDarkMode.value
                                                  ? Colors.white54
                                                  : Colors.black45),
                                        ),
                                        Text(event['events'][index]['title'],
                                            maxLines: 1,
                                            style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                        Text(
                                          '${event['events'][index]['location']} ',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: themeController
                                                      .isDarkMode.value
                                                  ? Colors.white54
                                                  : Colors.black45),
                                        )
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.favorite_border_outlined))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
                }),
          )
        ],
    );
  }
}
