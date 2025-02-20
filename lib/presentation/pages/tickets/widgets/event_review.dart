import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app_ui/presentation/widgets/primary_button.dart';

class EventReview extends StatefulWidget {
  const EventReview({super.key});

  @override
  State<EventReview> createState() => _EventReviewState();
}

class _EventReviewState extends State<EventReview> {
  final TextEditingController _textController =
      TextEditingController(); // Controller for text area

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Column(
                spacing: 10,
                children: [
                  Container(
                    width: 50,
                    height: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey.shade200,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Leave a review',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'How was your experience?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  AnimatedRatingStars(
                    initialRating: 4.5,
                    minRating: 0.0,
                    maxRating: 5.0,
                    filledColor: Theme.of(context).primaryColor,
                    emptyColor: Colors.grey,
                    filledIcon: Icons.star,
                    halfFilledIcon: Icons.star_half,
                    emptyIcon: Icons.star_border,
                    onChanged: (double rating) {
                      // Handle the rating change here
                      debugPrint('Rating: $rating');
                    },
                    displayRatingValue: true,
                    interactiveTooltips: true,
                    customFilledIcon: Icons.star,
                    customHalfFilledIcon: Icons.star_half,
                    customEmptyIcon: Icons.star_border,
                    starSize: 24.0,
                    animationDuration: const Duration(milliseconds: 300),
                    animationCurve: Curves.easeInOut,
                    readOnly: false,
                  ),
                  TextField(
                    controller: _textController,
                    maxLines: 5, // Set to `null` for unlimited lines
                    decoration: InputDecoration(
                      hintText: "Type here...",
                      border: OutlineInputBorder(
                        // Gray border
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2), // Blue when active
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  PrimaryButton(label: 'Submit a review', onPressed: (){})
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
