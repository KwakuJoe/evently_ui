// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:readmore/readmore.dart';
import 'package:ticket_app_ui/presentation/pages/event_detail/widgets/all_shows.dart';
import 'package:ticket_app_ui/presentation/pages/event_detail/widgets/map_preview.dart';
import 'package:ticket_app_ui/presentation/pages/event_detail/widgets/reviews.dart';
import 'package:ticket_app_ui/presentation/pages/home/widgets/you_might_like.dart';
import 'package:ticket_app_ui/store/theme_store.dart';
import 'package:ticket_app_ui/presentation/widgets/divider.dart';
import 'package:ticket_app_ui/presentation/widgets/primary_button.dart';

import '../../../data/general_data.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({super.key});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
     final ThemeController themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Event'),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            HugeIcons.strokeRoundedArrowLeft01,
            // color: Colors.white,
              size: 32,

          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              HugeIcons.strokeRoundedActivity03,
              // color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 10,),

          InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              HugeIcons.strokeRoundedFavourite,
              // color: Colors.white,
            ),
          ),
          const SizedBox(width: 20,)
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: SizedBox(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: PrimaryButton(
              label: 'Buy Tickets',
              onPressed: () {
                Get.toNamed('/select-session');
              },
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 30,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 550,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F911878343%2F30704669617%2F1%2Foriginal.20241204-231752?w=512&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C186%2C1080%2C540&s=a734db08284615746cf0369f5bf98802', // Replace with your image URL
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  spacing: 10,
                  children: [
                    const Text(
                      'Last One Party 2025 | Kumasi Year',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // avatars
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: Theme.of(context).primaryColor)),
                          child: const Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                            child: Text(
                              '50+ going',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(100)),
                          child: const Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                            child: Text(
                              'from ₵20',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                    // divider
                    CustomDivider()
                  ],
                ),
              ),
              // price range
        
              // description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'About event',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    ReadMoreText(
                      '"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt',
                      trimMode: TrimMode.Line,
                      trimLines: 4,
                      style: const TextStyle(fontSize: 16),
                      colorClickableText: Theme.of(context).primaryColor,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
        
              // Mp
              const MapPreview(),
        
              // all shows
              AllShowsList(),
        
              // reviews
              Reviews(),
        
              // similar events
              YouMightLike(data: youMightLike, label: "Similar events"),
            ],
          ),
        ),
      ),
    );
  }
}
