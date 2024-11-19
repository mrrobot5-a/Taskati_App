import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/fontFamily.dart';
import 'package:flutter_application_1/core/utils/colors.dart';

class CustomTextFromField extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  VoidCallback? onTap;
  final ValueChanged<String>? onchanged; // Updated type
  String? noteText;
  int? maxlines;
  bool? isReadOnly = false;
  Icon? suffixIcons;
  final String? Function(String?)? validatorFunction;

  // void ontap;
  CustomTextFromField({
    super.key,
    this.noteText,
    this.maxlines,
    this.isReadOnly,
    this.suffixIcons,
    this.controller,
    this.validatorFunction,
    this.onTap,
    this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      validator: validatorFunction,
      controller: controller,
      readOnly: isReadOnly ?? false,
      maxLines: maxlines ?? 1,
      onChanged: onchanged,
      decoration: InputDecoration(
        suffixIcon: suffixIcons ?? null,
        suffixIconColor: AppColor.primary,
        labelText: noteText ?? "",
        alignLabelWithHint: true,
        labelStyle: TextStyle(
          fontFamily: FontFamily.fontFamilyName,
          color: AppColor.primary,
          fontSize: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: AppColor.grey,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: AppColor.primary,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: AppColor.red,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: AppColor.red,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
