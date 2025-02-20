import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app_ui/store/theme_store.dart';

// ignore: must_be_immutable
class YouMightLike extends StatelessWidget {

  List<Map<String, dynamic>> data;
  String label;

  YouMightLike({super.key, required this.data, required this.label});
     final ThemeController themeController = Get.find<ThemeController>();


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
                label,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 210,
          child: ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, index) {
                return Obx(() =>                 GestureDetector(
                  onTap: (){
                    Get.toNamed('/event-detail');
                  },
                  child: Padding(
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
                                  imageUrl: data[index]
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      spacing: 1.5,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${data[index]['date']} - ${data[index]['time']}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color:
                                                  themeController.isDarkMode.value
                                                      ? Colors.white54
                                                      : Colors.black45),
                                        ),
                                        Text(data[index]['title'],
                                            maxLines: 1,
                                            style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                        Text(
                                          '${data[index]['location']} ',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: themeController.isDarkMode.value
                                                  ? Colors.white54
                                                  : Colors.black45),
                                        )
                                      ],
                                    ),
                                  ),
                  
                                  IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border_outlined))
                                ],
                              ),
                            )
                          ],
                        ),
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
