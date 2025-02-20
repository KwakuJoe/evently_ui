import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app_ui/data/general_data.dart';
import 'package:ticket_app_ui/store/theme_store.dart';
import 'package:ticket_app_ui/presentation/widgets/divider.dart';

class AllShowsList extends StatelessWidget {
  AllShowsList({super.key});

     final ThemeController themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          const Text(
            'All Shows',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          ListView.builder(
              itemCount: allShows.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    spacing: 20,
                    children: [
                      const Row(
                        spacing: 30,
                        
                        children: [
                          // date
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '23',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Nov',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
      
                          // title
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.start,
                              'Chamber and Organ Musical Hall of Accra',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
      
                          Text(
                            '₵20',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      CustomDivider()
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}


// from ₵20