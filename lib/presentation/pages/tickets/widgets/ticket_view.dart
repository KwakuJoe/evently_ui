import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app_ui/presentation/pages/tickets/widgets/tabs/all_tickets.dart';
import 'package:ticket_app_ui/store/theme_store.dart';


class TicketsView extends StatelessWidget {
   TicketsView({super.key});
     final ThemeController themeController = Get.find<ThemeController>();


  @override
Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Tickets'),
          bottom: TabBar(
            padding:  const EdgeInsets.only(left:20, right: 20, top: 5 ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: Theme.of(context).primaryColor, // Active tab color
                  borderRadius: BorderRadius.circular(30),
                ),
                tabs: const [
                  Tab(text: "All Tickets"),
                  Tab(text: "Cancelled"), // Adjust text as needed
                ],
              ),
        ),
        body:  TabBarView(
          children: [
            AllTickets(),
            AllTickets(),
          ],
        ),
      ),
    );
  }
}

