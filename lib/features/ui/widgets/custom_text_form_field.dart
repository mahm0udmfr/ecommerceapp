import 'package:flutter/material.dart';
import 'package:ecommerceapp/core/utils/colors.dart';

//ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  Color borderColor;
  String? hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextStyle? hintStyle;
  TextStyle? style;
  bool obscureText;
  bool isPassword;
  int? maxLines;
  Color? filledColor;
  bool? isFilled;
  bool readOnly;
  Widget? label;
  TextStyle? labelStyle;
  String? Function(String?)? validator;
  TextEditingController? controller;
  TextInputType? keyboardType;
  CustomTextFormField(
      {super.key,
      this.borderColor = AppColors.whiteColor,
      required this.hintText,
      this.isPassword = false,
      this.hintStyle,
      this.prefixIcon,
      this.suffixIcon,
      this.style,
      this.label,
      this.obscureText = false,
      this.maxLines,
      this.labelStyle,
      this.validator,
      this.controller,
      this.keyboardType,
      this.filledColor = AppColors.whiteColor,
      this.readOnly = false,
      this.isFilled});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      maxLines: widget.maxLines,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      obscuringCharacter: "*",
      cursorColor: AppColors.whiteColor,
      style: widget.style,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        fillColor: widget.filledColor,
        label: widget.label,
        labelStyle: widget.labelStyle,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  widget.obscureText = !widget.obscureText;
                  setState(() {});
                },
                icon: Icon(widget.obscureText
                    ? Icons.visibility_off
                    : Icons.visibility))
            : widget.suffixIcon,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: widget.borderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: widget.borderColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.redColor, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.redColor, width: 1),
        ),
      ),
    );
  }
}
