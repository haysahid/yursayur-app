import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';
import 'package:pasar_sayur/common/app_styles.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    super.key,
    this.avatarPath,
    required this.title,
    this.subtitle,
    this.topTrailing,
    this.bottomTrailing,
  });

  final String? avatarPath;
  final String title;
  final String? subtitle;
  final String? topTrailing;
  final String? bottomTrailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 2,
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.secondary.withOpacity(.15),
              image: avatarPath != null
                  ? DecorationImage(
                      image: AssetImage(
                        avatarPath!,
                      ),
                    )
                  : null,
            ),
            child: avatarPath == null
                ? Center(
                    child: Text(
                      title[0].toUpperCase(),
                      style: AppTextStyle.title2.copyWith(
                        fontWeight: semiBold,
                        color: AppColor.primary,
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: AppTextStyle.body2.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                    if (topTrailing != null && topTrailing!.isNotEmpty)
                      Text(
                        topTrailing!,
                        style: AppTextStyle.caption.copyWith(
                          color: AppColor.gray90,
                        ),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                if (subtitle != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        subtitle!,
                        style: AppTextStyle.caption.copyWith(
                          color: AppColor.gray90,
                        ),
                      ),
                      if (bottomTrailing != null && bottomTrailing!.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 1,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.primaryHover,
                          ),
                          child: Center(
                            child: Text(
                              bottomTrailing!,
                              style: AppTextStyle.overline.copyWith(
                                fontWeight: medium,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                        )
                    ],
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
