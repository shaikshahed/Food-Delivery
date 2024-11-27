import 'package:flutter/material.dart';

class RoundAppbarButton extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final Function()? onPressed;
  const RoundAppbarButton(
      {super.key,
      required this.icon,
      required this.iconColor,
      required this.bgColor,
      this.onPressed});

  @override
  State<RoundAppbarButton> createState() => _RoundAppbarButtonState();
}

class _RoundAppbarButtonState extends State<RoundAppbarButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      decoration: BoxDecoration(
          color: widget.bgColor, borderRadius: BorderRadius.circular(35)),
      child: IconButton(
        icon: Icon(
          widget.icon,
          size: 20,
          color: widget.iconColor,
        ),
        onPressed: widget.onPressed,
      ),
    );
  }
}
