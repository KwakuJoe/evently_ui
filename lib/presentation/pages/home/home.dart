import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app_ui/data/general_data.dart';
import 'package:ticket_app_ui/data/personalized_event_lists.dart';
import 'package:ticket_app_ui/presentation/pages/home/widgets/bg_time_event.dart';
import 'package:ticket_app_ui/presentation/pages/home/widgets/filter_chips.dart';
import 'package:ticket_app_ui/presentation/pages/home/widgets/home_navbar.dart';
import 'package:ticket_app_ui/presentation/pages/home/widgets/personal_categories_event_lists.dart';
import 'package:ticket_app_ui/presentation/pages/home/widgets/search_field.dart';
import 'package:ticket_app_ui/presentation/pages/home/widgets/top_ten.dart';
import 'package:ticket_app_ui/presentation/pages/home/widgets/you_might_like.dart';
import 'package:ticket_app_ui/store/theme_store.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController searchController = TextEditingController();
  final ThemeController themeController = Get.find(); // Retrieve the instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // header navigation
              HomeNavBar(),
              HomeSearchField(
                name: 'search',
                label: 'Search events',
                controller: searchController,
                leadingIcon: const Icon(Icons.search),
                trailingIcon: const Icon(Icons.filter_list),
              ),
              const HomeFilterChipsSelector(),
              TopTenList(),
              YouMightLike(
                data: youMightLike,
                label: 'You might like',
              ),
              BigTimeEvent(),
              ListView.builder(
                  itemCount: personalizedEventLists.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: PersonalCategoryEventLists(
                        event: personalizedEventLists[index],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
