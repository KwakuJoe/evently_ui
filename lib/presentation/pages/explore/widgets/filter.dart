import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:ticket_app_ui/data/date_range_options.dart';
import 'package:ticket_app_ui/store/event_filter_store.dart';
import 'package:ticket_app_ui/presentation/widgets/multi_chip_selector.dart';
import 'package:ticket_app_ui/store/theme_store.dart';
import 'package:ticket_app_ui/presentation/widgets/primary_button.dart';
import 'package:ticket_app_ui/presentation/widgets/single_chip_selector.dart';

import '../../../../data/user_interests.dart';

class EventFilterOptions extends StatefulWidget {
  const EventFilterOptions({super.key});

  @override
  State<EventFilterOptions> createState() => _EventFilterOptionsState();
}

class _EventFilterOptionsState extends State<EventFilterOptions> {
  final ThemeController themeController = Get.find();
  final FilterController filterController = Get.put(FilterController());

  DateTime eventDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [TextButton(onPressed: () {}, child: const Text('Clear'))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 30,
              children: [
                // categories
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      PersonalizationMultiChipSelector(
                        chipOptions: chipOptions,
                        onSelectionChanged: (selectedItems) {
                          debugPrint(selectedItems.toString());
                        },
                      ),
                    ],
                  ),
                ),

                // date
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Date',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),

                      // date options
                      SingleChoiceSelector(
                        chipOptions: dateRangeOptions,
                        onSelectionChanged: (selectedItem) {
                          debugPrint('Selected item: $selectedItem');
                        },
                      ),
                      InkWell(
                        onTap: () {
                          BottomPicker.date(
                            backgroundColor: themeController.isDarkMode.value
                                ? const Color(0xFF13101B)
                                : Colors.white,
                            titlePadding: const EdgeInsets.only(
                                top: 20, left: 20, right: 20, bottom: 5),
                            // buttonContent: PrimaryButton(label: 'Select', onPressed: (){}),
                            buttonContent: const Center(
                                child: Text(
                              'Select Date',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )),
                            buttonSingleColor: Theme.of(context).primaryColor,
                            buttonWidth: 250,
                            buttonPadding: 20,
                            pickerTitle: Text(
                              'Select Event date',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: themeController.isDarkMode.value
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            height: MediaQuery.of(context).size.height * 05,
                            dateOrder: DatePickerDateOrder.dmy,
                            titleAlignment: Alignment.center,
                            closeIconColor: themeController.isDarkMode.value
                                ? Colors.white
                                : Colors.black,
                            initialDateTime: DateTime.now(),
                            maxDateTime: DateTime(5053),
                            minDateTime: DateTime(1980),
                            pickerTextStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: themeController.isDarkMode.value
                                    ? Colors.white
                                    : Colors.black),
                            onChange: (index) {
                              print(index);
                            },
                            onSubmit: (index) {
                              print(index);
                              setState(() {
                                eventDate = index;
                              });
                            },
                            bottomPickerTheme: BottomPickerTheme.plumPlate,
                          ).show(context);
                        },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: themeController.isDarkMode.value
                                ? const Color(0XFF1C1A25)
                                : Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    DateFormat.yMMMd().format(
                                      eventDate,
                                    ),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Icon(
                                  HugeIcons.strokeRoundedCalendar01,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),

            // button
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: PrimaryButton(
                    label: 'Apply Filters',
                    onPressed: () {
                      filterController.toggleShowFilterResult();
                      Get.back();
                      debugPrint('${filterController.showFilterResult.value}');
                    }))
          ],
        ),
      ),
    );
  }
}
