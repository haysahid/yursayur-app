import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';
import 'package:pasar_sayur/common/app_styles.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    required this.title,
    this.trailing,
    this.iconPath,
    this.subtitle,
  });

  final String? iconPath;
  final String title;
  final String? subtitle;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Icons.notifications_active,
              size: 24,
              color: AppColor.primary,
            ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.body2.copyWith(
                    fontWeight: medium,
                  ),
                ),
                if (subtitle != null)
                  const SizedBox(
                    height: 2,
                  ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: AppTextStyle.body3.copyWith(
                      color: AppColor.gray90,
                    ),
                  ),
              ],
            ),
          ),
          if (trailing != null)
            Row(
              children: [
                const SizedBox(
                  width: 12,
                ),
                Text(
                  trailing!,
                  style: AppTextStyle.caption.copyWith(
                    color: AppColor.gray90,
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
