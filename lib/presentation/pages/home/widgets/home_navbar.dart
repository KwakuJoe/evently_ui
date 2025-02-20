import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app_ui/store/theme_store.dart';

class HomeNavBar extends StatelessWidget {
  HomeNavBar({super.key});

     final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Location',
                style: TextStyle(
                    fontSize: 12,
                    color: themeController.isDarkMode.value
                        ? Colors.white54
                        : Colors.black45),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 5,
                      children: [
                        Text(
                          'Dansoman, Accra',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.keyboard_arrow_down_outlined)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
      
          // action icons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 0,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_bag_outlined)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none_sharp))
            ],
          )
        ],
      ),
    );
  }
}
