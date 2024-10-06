import 'package:blockto_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.labelText,
    this.hintText,
    this.style,
    this.labelStyle,
    this.hintStyle,
    this.errorStyle,
    this.errorMaxLines,
    this.isPassword,
    this.prefixIcon,
    this.suffixIcon,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.textInputType = TextInputType.text,
    this.prefixIconConstraints,
    this.contentPadding,
    this.radius = 12.0,
    this.maxLines,
    this.initialValue,
    this.textAlignVertical,
    this.inputFormatters,
    this.enabled,
    this.shouldChangeColor,
    this.autofocus,
  });

  final bool? autofocus;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final VoidCallback? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final String? labelText;
  final String? hintText;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final int? errorMaxLines;
  final bool? isPassword;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final BoxConstraints? prefixIconConstraints;
  final EdgeInsets? contentPadding;
  final double radius;
  final int? maxLines;
  final String? initialValue;
  final TextAlignVertical? textAlignVertical;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final bool? shouldChangeColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus!,
      cursorColor: TColors.secondary,
      inputFormatters: inputFormatters,
      enabled: enabled,
      initialValue: initialValue,
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      onEditingComplete: onEditingComplete,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      style: style,
      obscureText: isPassword ?? false,
      cursorWidth: 1.6.w,
      scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 600),
      // expands: true,
      keyboardType: textInputType,
      maxLines: maxLines,
      textAlignVertical: textAlignVertical,
      autocorrect: false,
      enableSuggestions: false,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle,
        isDense: true,
        errorStyle: errorStyle,
        errorMaxLines: errorMaxLines,
        hintText: hintText,
        prefixIconConstraints: prefixIconConstraints,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        // suffixIconConstraints: BoxConstraints(maxHeight: 80.w, maxWidth: 80.w),

        contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
        hintStyle: hintStyle,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius.r)),
          borderSide:
              BorderSide(color: const Color(0xffF5C249).withOpacity(0.4), width: 1.6),
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius.r)),
            borderSide: const BorderSide(color: TColors.primary, width: 1.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius.r)),
          borderSide: const BorderSide(color: Color(0xffF5C249), width: 1.6),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius.r)),
          borderSide:
              BorderSide(color: const Color(0xffF5C249).withOpacity(0.4), width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide:
              BorderSide(color: const Color(0xffF5C249).withOpacity(0.4), width: 1.0),
        ),
      ),
    );
  }
}
