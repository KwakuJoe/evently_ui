import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app_ui/store/theme_store.dart';

// ignore: must_be_immutable
class TopTenList extends StatelessWidget {
  TopTenList({super.key});

     final ThemeController themeController = Get.find<ThemeController>();
  List<Map<String, dynamic>> topTenList = [
    {
      'id': 0001,
      'title': 'The Shakespeare annual Conference',
      'image':
          'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F911878343%2F30704669617%2F1%2Foriginal.20241204-231752?w=512&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C186%2C1080%2C540&s=a734db08284615746cf0369f5bf98802',
      "position": '1',
      'date': '12/09/2025',
    },
    {
      'id': 0002,
      'title': 'All Night for Jesus | Revival',
      'image':
          'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F909093663%2F1611177855063%2F1%2Foriginal.20241130-194238?crop=focalpoint&fit=crop&w=512&auto=format%2Ccompress&q=75&sharp=10&fp-x=0.5&fp-y=0.5&s=50db8e5b5261a8b8b7487951d2f8bd8a',
      "position": '2',
      'date': '12/09/2025',
    },
    {
      'id': 0003,
      'title': 'Biggest Party of the year',
      'image':
          'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F897860553%2F261210139653%2F1%2Foriginal.20241113-032433?crop=focalpoint&fit=crop&auto=format%2Ccompress&q=75&sharp=10&fp-x=0.5&fp-y=0.5&s=c53b73f621408e5ac52b76765598800d',
      "position": '3',
      'date': '12/09/2025',
    },
    {
      'id': 0004,
      'title': 'The Shakespeare annual Conference',
      'image':
          'https://images.unsplash.com/photo-1531058020387-3be344556be6?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8ZXZlbnR8ZW58MHx8MHx8fDA%3D',
      "position": '4',
      'date': '12/09/2025',
    },
    {
      'id': 0006,
      'title': 'The Shakespeare annual Conference',
      'image':
          'https://images.unsplash.com/photo-1580130732478-4e339fb6836f?q=80&w=3402&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      "position": '5',
      'date': '12/09/2025',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            children: [
              Text(
                'Top10 in Dansoman',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topTenList.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                    padding: const EdgeInsets.only(right: 0, left: 20),
                    child: Stack(
                      clipBehavior: Clip.none, // Allows overflow for the text
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: 160,
                            height: 200,
                          
                            child: CachedNetworkImage(
                              imageUrl: topTenList[index]
                                  ['image'], // Replace with your image URL
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -5, // Overlap by adjusting this value
                          left: -5, // Overlap horizontally
                          child: Text(
                            topTenList[index]['position'],
                            style: TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,

                              foreground: Paint()
                                ..style = PaintingStyle
                                    .stroke // Use fill for text color
                                // Text fill color
                                ..strokeWidth = 3 // Border width
                                ..color = themeController.isDarkMode.value
                                    ? Colors.white
                                    : Colors.black, // Border color
                              // Border color
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -7, // Overlap by adjusting this value
                          left: -7, // Overlap horizontally
                          child: Text(
                            topTenList[index]['position'],
                            style: TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,

                              foreground: Paint()
                                ..style = PaintingStyle
                                    .fill // Use fill for text color
                                // Text fill color
                                ..strokeWidth = 3 // Border width
                                ..color = themeController.isDarkMode.value
                                    ? Colors.black
                                    : Colors.white, // Border color
                              // Border color
                            ),
                          ),
                        ),
                      ],
                    ));
    
              }),
        ),
      ],
    );
  }
}
