import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';
import 'package:pasar_sayur/common/app_styles.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.title,
    this.iconPath,
    this.onTap,
  });

  final String? iconPath;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColor.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 2,
        ),
        child: Row(
          children: [
            if (iconPath != null)
              Image.asset(
                iconPath!,
                width: 24,
                height: 24,
                color: AppColor.primary,
              )
            else
              Icon(
                Icons.settings,
                size: 24,
                color: AppColor.primary,
              ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                title,
                style: AppTextStyle.body2.copyWith(
                  fontWeight: medium,
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 24,
              color: AppColor.gray80,
            ),
          ],
        ),
      ),
    );
  }
}
