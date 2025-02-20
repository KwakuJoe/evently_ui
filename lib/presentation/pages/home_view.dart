import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ticket_app_ui/presentation/pages/explore/explore.dart';
import 'package:ticket_app_ui/presentation/pages/home/home.dart';
import 'package:ticket_app_ui/presentation/pages/profile/profile.dart';
import 'package:ticket_app_ui/presentation/pages/tickets/widgets/ticket_view.dart';
import 'package:ticket_app_ui/store/theme_store.dart';
import 'package:ticket_app_ui/presentation/widgets/keep_tab_alive.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
     final ThemeController themeController = Get.find<ThemeController>();
  List<Widget> pages = [
    const KeepAlivePage(
      child: Home(),
    ),
    const KeepAlivePage(child: ExploreScreen()),
    const KeepAlivePage(
      child: Center(
        child: Icon(
          HugeIcons.strokeRoundedTicket01,
        ),
      ),
    ),
    KeepAlivePage(child: TicketsView()),
     KeepAlivePage(
      child: ProfileScreen(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).disabledColor,
          backgroundColor: themeController.isDarkMode.value
              ? const Color(0xFF08060E)
              : Colors.white,
          iconSize: 28,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          onTap: (int newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
                label: 'Home', icon: Icon(HugeIcons.strokeRoundedHome01)),
            BottomNavigationBarItem(
                label: 'Explore', icon: Icon(HugeIcons.strokeRoundedCompass01)),
            BottomNavigationBarItem(
                label: 'Favorites',
                icon: Icon(HugeIcons.strokeRoundedFavourite)),
            BottomNavigationBarItem(
                label: 'My tickets', icon: Icon(HugeIcons.strokeRoundedTicket01)),
            BottomNavigationBarItem(
                label: 'Profile', icon: Icon(HugeIcons.strokeRoundedUserEdit01))
          ]),
    );
  }
}
