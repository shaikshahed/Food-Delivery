
import 'package:engro_food/constants/color_constants.dart';
import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final String input;
  final IconData? icon;
  final FormFieldValidator<String>? validator;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? onIconPressed;
  final TextEditingController controller;
  const Textfield({
    Key? key,
    required this.input,
    this.icon, this.validator, this.isPassword=false, this.onIconPressed, this.obscureText=false, required this.controller, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: appFieldsColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none

        ),
        hintText: input,
        suffixIcon: isPassword ? IconButton(onPressed: onIconPressed, icon: Icon(obscureText? Icons.visibility_off : Icons.visibility))
        :icon != null ? Icon(icon) : null,
      ),
      validator: validator,
      obscureText: isPassword ? obscureText : false,
    );
  }
}