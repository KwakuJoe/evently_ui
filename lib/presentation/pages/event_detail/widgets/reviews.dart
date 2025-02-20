import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ticket_app_ui/data/general_data.dart';
import 'package:ticket_app_ui/store/theme_store.dart';

class Reviews extends StatelessWidget {
  Reviews({super.key});

     final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // title
              Row(
                spacing: 7,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Reviews  ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    height: 4,
                    width: 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: themeController.isDarkMode.value
                            ? Colors.white
                            : Colors.black),
                  ),
                  const Text(
                    '23',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              // see more
              InkWell(
                onTap: () {},
                child: const Row(
                  spacing: 2,
                  children: [
                    Text(
                      'See more',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Icon(HugeIcons.strokeRoundedArrowDown01)
                  ],
                ),
              )
            ],
          ),
          ListView.builder(
              itemCount: allShows.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    spacing: 7,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedRatingStars(
                        initialRating: 4.5,
                        minRating: 0.0,
                        maxRating: 5.0,
                        filledColor: Theme.of(context).primaryColor,
                        emptyColor: Colors.grey,
                        filledIcon: Icons.star,
                        halfFilledIcon: Icons.star_half,
                        emptyIcon: Icons.star_border,
                        onChanged: (double rating) {
                          // Handle the rating change here
                          debugPrint('Rating: $rating');
                        },
                        displayRatingValue: true,
                        interactiveTooltips: true,
                        customFilledIcon: Icons.star,
                        customHalfFilledIcon: Icons.star_half,
                        customEmptyIcon: Icons.star_border,
                        starSize: 8.0,
                        animationDuration: const Duration(milliseconds: 300),
                        animationCurve: Curves.easeInOut,
                        readOnly: false,
                      ),
                      const Text(
                        'by Lela Authurson on 16 June, 2025',
                        style:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      )
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