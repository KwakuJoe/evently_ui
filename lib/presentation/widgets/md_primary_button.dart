import 'package:flutter/material.dart';

class MdPrimaryButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isOutlined;
  final Color color;
  final double? width;

  const MdPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isOutlined,
    required this.color,
    this.width
  });

  @override
  State<MdPrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<MdPrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity, // Full width
      height: 50.0, // Fixed height
      child: TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          backgroundColor: widget.isOutlined ? Colors.transparent : widget.color, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side:  BorderSide(
              color: widget.color
            )
          ),
        ),
        child: Text(widget.label,
            style:  TextStyle(
              color:  widget.isOutlined ? widget.color : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            )),
      ),
    );
  }
}
