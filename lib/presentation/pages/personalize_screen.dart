import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app_ui/data/user_interests.dart';
import 'package:ticket_app_ui/store/theme_store.dart';
import 'package:ticket_app_ui/presentation/widgets/multi_chip_selector.dart';
import 'package:ticket_app_ui/presentation/widgets/primary_button.dart';

class PersonalizeScreen extends StatefulWidget {
  const PersonalizeScreen({super.key});

  @override
  State<PersonalizeScreen> createState() => _PersonalizeScreenState();
}

class _PersonalizeScreenState extends State<PersonalizeScreen> {
     final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Skip to the last page
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
                        )
                      ],
                    ),
                    const Text(
                      'Let\'s personalize you experience',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Choose your favourite 4 interest to display on your home page',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          color: themeController.isDarkMode.value
                              ? Colors.white54
                              : Colors.black45),
                    ),
          
                    // chips
                     Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: PersonalizationMultiChipSelector(
                        chipOptions: chipOptions,
                        onSelectionChanged: (selectedItems){
                          debugPrint(selectedItems.toString());
                        },
                      ),
                    ),
          
                    // button
                    PrimaryButton(label: 'Continue', onPressed: (){
                      Get.offAllNamed('/home-view');
                    },)

                  ],
                )
              ],
            ),
          )),
    );
  }
}
