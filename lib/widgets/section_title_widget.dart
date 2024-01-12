import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';
import 'package:pasar_sayur/common/app_styles.dart';

class SectionHeaderWidget extends StatelessWidget {
  const SectionHeaderWidget({
    super.key,
    required this.title,
    this.moreText,
    this.moreAction,
    this.padding,
  });

  final String title;
  final String? moreText;
  final VoidCallback? moreAction;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.only(
            top: 16,
            bottom: 4,
            left: 24,
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyle.body1,
          ),
          if (moreText != null)
            GestureDetector(
              onTap: moreAction,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Text(
                  moreText!,
                  style: AppTextStyle.caption.copyWith(
                    color: AppColor.primaryDark,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
