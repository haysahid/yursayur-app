import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';
import 'package:pasar_sayur/common/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.fillColor,
    this.fontSize,
    this.focusNode,
    this.onFocusChange,
    this.onEditingComplete,
    this.topMargin = false,
    this.enabled = true,
    this.autofocus = false,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsets? contentPadding;
  final Color? fillColor;
  final double? fontSize;
  final FocusNode? focusNode;
  final void Function(bool hasFocus)? onFocusChange;
  final VoidCallback? onEditingComplete;
  final bool topMargin;
  final bool enabled;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    const double borderWidth = 1.75;
    double _fontSize = fontSize ?? 14;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (topMargin) const SizedBox(height: 20),
        if (label != null)
          Column(
            children: [
              Text(
                label!,
                style: AppTextStyle.body2,
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        Focus(
          onFocusChange: onFocusChange,
          child: TextFormField(
            controller: controller,
            enabled: enabled,
            autofocus: autofocus,
            // onChanged: onChange,
            onEditingComplete: onEditingComplete,
            style: AppTextStyle.body2.copyWith(
              fontSize: _fontSize,
              fontWeight: label != null ? medium : null,
              color: AppColor.gray100,
            ),
            obscureText: obscureText,
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: fillColor ?? AppColor.cream1,
              focusColor: AppColor.primary,
              hintText: hintText,
              hintStyle: AppTextStyle.body2.copyWith(
                fontSize: _fontSize,
                color: AppColor.gray60,
              ),
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 15,
                  ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColor.cream1,
                  width: borderWidth,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColor.cream2,
                  width: borderWidth,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColor.cream1,
                  width: borderWidth,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColor.primary,
                  width: borderWidth,
                ),
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
