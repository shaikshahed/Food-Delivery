import 'package:engro_food/constants/color_constants.dart';
import 'package:flutter/material.dart';

class FoodElevatedButton extends StatefulWidget {
  final String btnText;
  final Function()? onTapFunction;
  const FoodElevatedButton(
      {super.key, required this.btnText, required this.onTapFunction});

  @override
  State<FoodElevatedButton> createState() => _FoodElevatedButtonState();
}

class _FoodElevatedButtonState extends State<FoodElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: appPrimaryColor,
        padding: const EdgeInsets.symmetric(vertical: 15),
        fixedSize: Size.fromWidth(MediaQuery.of(context).size.width - 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: widget.onTapFunction,
      child: Text(
        widget.btnText,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
