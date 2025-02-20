// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ticket_app_ui/presentation/widgets/primary_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller =
      PageController(viewportFraction: 1.0, keepPage: true); // Full width pages

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> onBoardingInfo = [
      {
        "title": "Discover, book, enjoy!",
        "description":
            "Claim your tickets and get ready for your experience like no other",
        "image": "assets/images/onboarding/board1.png",
      },
      {
        "title": "Unlock your potential",
        "description": "Explore personalized recommendations and book your spot!",
        "image": "assets/images/onboarding/board2.png",
      },
      {
        "title": "Dive into Action",
        "description": "Book your ticket before it's to late and enjoy every thrilling moment!.",
        "image": "assets/images/onboarding/board3.png",
      },
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFC2AAFC),
              Color(0xFFEDD9FF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Page indicator and Skip button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: controller,
                      count: onBoardingInfo.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Theme.of(context).colorScheme.primary,
                        dotColor: const Color.fromARGB(255, 180, 149, 253),
                        dotHeight: 8,
                        dotWidth: 8,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Skip to the last page
                        controller.jumpToPage(onBoardingInfo.length - 1);
                      },
                      child: Row(
                        children: [
                          Text(
                            'Skip',
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // PageView for onboarding screens
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: onBoardingInfo.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                // Onboarding title
                                Text(
                                  onBoardingInfo[index]['title'],
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10),

                                // Onboarding description
                                Text(
                                  onBoardingInfo[index]['description'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Image(image: AssetImage(onBoardingInfo[index]['image']), fit: BoxFit.contain),
                            )
                            ),

                          PrimaryButton(
                            label: index != 2 ? 'Continue' : 'Get started',
                            onPressed: () {
                              if(index != 2){
                                controller.nextPage(duration: const Duration(seconds: 1), curve: Curves.fastLinearToSlowEaseIn);
                              }else{
                                Get.offNamed('/login');
                              }
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
