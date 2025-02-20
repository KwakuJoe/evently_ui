import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ticket_app_ui/presentation/controllers/auth_controller.dart';
import 'package:ticket_app_ui/store/theme_store.dart';
import 'package:ticket_app_ui/presentation/widgets/divider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
     final ThemeController themeController = Get.find<ThemeController>();
     final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                spacing: 15,
                children: [
                  // avatar & name
                  Row(
                    spacing: 20,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 1,
                            )),
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: CircleAvatar(
                            radius: 32,
                            backgroundImage: AssetImage(
                              'assets/images/splash/splash.png',
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'James Mars',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'james@gmail.com',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Get.toNamed('/update-profile');
                        },
                        label: const Text(
                          'Edit',
                        ),
                        icon: const Icon(HugeIcons.strokeRoundedEdit01),
                      )
                    ],
                  ),
                  CustomDivider(),
                  // first set
                  Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(10),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 7.0),
                          child: Row(
                            spacing: 10,
                            children: [
                              Icon(HugeIcons.strokeRoundedGlobe02),
                              Expanded(child: Text('Country')),
                              Icon(HugeIcons.strokeRoundedArrowRight01)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7.0),
                        child: Row(
                          spacing: 10,
                          children: [
                            const Icon(HugeIcons.strokeRoundedMoon02),
                            Expanded(
                                child: Text(
                                    'Change Theme - ${themeController.isDarkMode.value ? 'Dark Mode' : 'Light Mode'}')),
                            Switch(
                              value: themeController.isDarkMode.value,
                              onChanged: (val) {
                                themeController.toggleTheme();
                              },
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed('/change-password');
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 7.0),
                          child: Row(
                            spacing: 10,
                            children: [
                              Icon(HugeIcons.strokeRoundedLockPassword),
                              Expanded(child: Text('Change password')),
                              Icon(HugeIcons.strokeRoundedArrowRight01)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // second set
                  CustomDivider(),
                  // second set

                  const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          spacing: 10,
                          children: [
                            Icon(HugeIcons.strokeRoundedMessage01),
                            Expanded(child: Text('Support & FAQ')),
                            Icon(HugeIcons.strokeRoundedArrowRight01),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          spacing: 10,
                          children: [
                            Icon(HugeIcons.strokeRoundedLock),
                            Expanded(child: Text('Privacy policy')),
                            Icon(HugeIcons.strokeRoundedArrowRight01),
                          ],
                        ),
                      )
                    ],
                  ),
                  CustomDivider(),
                  // third set
                  InkWell(
                    onTap: () {
                      authController.logout();
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            spacing: 10,
                            children: [
                              Icon(HugeIcons.strokeRoundedLogout01),
                              Expanded(child: Text('Logout')),
                              // Icon(HugeIcons.strokeRoundedArrowRight01),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
