import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ticket_app_ui/presentation/pages/explore/evemt_filter_result.dart';
import 'package:ticket_app_ui/presentation/pages/explore/widgets/explore_by_interest.dart';
import 'package:ticket_app_ui/presentation/pages/explore/widgets/filter.dart';
import 'package:ticket_app_ui/presentation/pages/home/widgets/search_field.dart';
import 'package:ticket_app_ui/store/event_filter_store.dart';
import 'package:ticket_app_ui/store/theme_store.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController searchController = TextEditingController();
  final FilterController filterController = Get.put(FilterController());
  final ThemeController themeController = Get.find(); // Retrieve the instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeSearchField(
                name: 'search',
                label: 'Search events ',
                controller: searchController,
                leadingIcon: const Icon(Icons.search),
                trailingIcon: IconButton(
                  onPressed: () {
                    showMaterialModalBottomSheet(
                      context: context,
                      builder: (context) => const EventFilterOptions(),
                    );
                  },
                  icon: const Icon(HugeIcons.strokeRoundedFilter),
                ),
              ),
              filterController.showFilterResult.value
                  ? const EventFilterResult()
                  : ExploreByInterest()
            ],
          ),
        ),
      );
    }));
  }
}
