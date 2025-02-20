import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app_ui/store/theme_store.dart';

// ignore: must_be_immutable
class BigTimeEvent extends StatelessWidget {
  BigTimeEvent({super.key});
     final ThemeController themeController = Get.find<ThemeController>();
  Map<String, dynamic> event = {
    'id': 0001,
    'title': 'Tidal Rave 2025',
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    'image':
        'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F909093663%2F1611177855063%2F1%2Foriginal.20241130-194238?crop=focalpoint&fit=crop&w=512&auto=format%2Ccompress&q=75&sharp=10&fp-x=0.5&fp-y=0.5&s=50db8e5b5261a8b8b7487951d2f8bd8a',
    "position": '1',
    'date': '27 December, 2025',
    'location': 'Accra, Ghana',
    'time': '20:30',
    'sessions': [
      {"date": '10 November, 2025', "title": 'Dance Hall Rave', "price_from": '150'},
      {"date": '10 November, 2025', "title": 'Dance Hall Rave', "price_from": '150'},
      {"date": '10 November, 2025', "title": 'Dance Hall Rave', "price_from": '150'}
    ]
  };
  @override
  Widget build(BuildContext context) {
    return Obx(() =>  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        spacing: 20,
        children: [
          const Row(
            children: [
              Text(
                'Tidal Rave 2025',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),

          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: themeController.isDarkMode.value
                  ? const Color(0xFF1C1A25)
                  : const Color(0xFFEFEAFF),
              child: Column(
                spacing: 25,
                children: [
                  CachedNetworkImage(
                    height: 180,
                    width: double.infinity,
                    imageUrl: event['image'], // Replace with your image URL
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 25,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event['description'],
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 15),
                        ),
                        const Text(
                          'Upcoming',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Flexible(
                            child: ListView.builder(
                                itemCount: event['sessions'].length,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, index) {
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: themeController
                                                              .isDarkMode.value
                                                          ? Colors.white54
                                                          : Colors.black12,
                                                width: 1))),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 15),
                                          child: Column(
                                            spacing: 5,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                               Text(
                                                event['sessions'][index]['title'],
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(event['sessions'][index]['date'],
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: themeController
                                                              .isDarkMode.value
                                                          ? Colors.white54
                                                          : Colors.black45))
                                            ],
                                          ),
                                        )),
                                        Container(
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
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black
                                                  ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ); 
                                })),

                                const SizedBox(height: 10,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )

          // SizedBox(
          //   height: 210,
          //   child: ListView.builder(
          //       itemCount: youMightLike.length,
          //       scrollDirection: Axis.horizontal,
          //       itemBuilder: (BuildContext context, index) {
          //         return Padding(
          //           padding: const EdgeInsets.only(right: 0, left: 20),
          //           child: ClipRRect(
          //             borderRadius: BorderRadius.circular(10),
          //             child: Container(
          //               width: 300,
          //               height: 210,
          //               color: themeController.isDarkMode.value
          //                   ? const Color(0xFF08060E)
          //                   : Colors.white,
          //               child: Column(
          //                 children: [
          //                   Stack(
          //                     children: [
          //                       CachedNetworkImage(
          //                         height: 120,
          //                         width: double.infinity,
          //                         imageUrl: youMightLike[index]
          //                             ['image'], // Replace with your image URL
          //                         fit: BoxFit.cover,
          //                         placeholder: (context, url) => const Center(
          //                           child: CircularProgressIndicator(),
          //                         ),
          //                         errorWidget: (context, url, error) =>
          //                             const Icon(Icons.error),
          //                       ),
          //                       Positioned(
          //                           bottom: 10,
          //                           right: 10,
          //                           child: Container(
          //                             decoration: BoxDecoration(
          //                                 color: Colors.white,
          //                                 borderRadius:
          //                                     BorderRadius.circular(100)),
          //                             child: const Padding(
          //                               padding: EdgeInsets.symmetric(
          //                                   horizontal: 8, vertical: 2),
          //                               child: Text(
          //                                 'from ₵20',
          //                                 style: TextStyle(
          //                                     fontSize: 12,
          //                                     fontWeight: FontWeight.w600),
          //                               ),
          //                             ),
          //                           ))
          //                     ],
          //                   ),
          //                   Padding(
          //                     padding: const EdgeInsets.symmetric(
          //                         horizontal: 20, vertical: 15),
          //                     child: Row(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         Expanded(
          //                           child: Column(
          //                             spacing: 1.5,
          //                             crossAxisAlignment:
          //                                 CrossAxisAlignment.start,
          //                             children: [
          //                               Text(
          //                                 '${youMightLike[index]['date']} - ${youMightLike[index]['time']}',
          //                                 style: TextStyle(
          //                                     fontSize: 12,
          //                                     color:
          //                                         themeController.isDarkMode.value
          //                                             ? Colors.white54
          //                                             : Colors.black45),
          //                               ),
          //                               Text(youMightLike[index]['title'],
          //                                   maxLines: 1,
          //                                   style: const TextStyle(
          //                                       overflow: TextOverflow.ellipsis,
          //                                       fontSize: 16,
          //                                       fontWeight: FontWeight.w600)),
          //                               Text(
          //                                 '${youMightLike[index]['location']} ',
          //                                 style: TextStyle(
          //                                     fontSize: 12,
          //                                     color:
          //                                         themeController.isDarkMode.value
          //                                             ? Colors.white54
          //                                             : Colors.black45),
          //                               )
          //                             ],
          //                           ),
          //                         ),
          //                         IconButton(
          //                             onPressed: () {},
          //                             icon: Icon(Icons.favorite_border_outlined))
          //                       ],
          //                     ),
          //                   )
          //                 ],
          //               ),
          //             ),
          //           ),
          //         );
          //       }),
          // )
        ],
      ),
    ));
  }
}
