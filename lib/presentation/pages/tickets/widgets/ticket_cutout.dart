import 'package:flutter/material.dart';

class TicketCutOut extends StatelessWidget {
  const TicketCutOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration:  BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor, // Match background color to create cut effect
        shape: BoxShape.circle,
      ),
    );
  }
}