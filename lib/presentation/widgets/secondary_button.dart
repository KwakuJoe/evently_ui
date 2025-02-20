import 'package:flutter/material.dart';

class SecondaryButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;

  const SecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  State<SecondaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Full width
      height: 60.0, // Fixed height
      child: TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 3
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(widget.label,
            style:  TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            )),
      ),
    );
  }
}
