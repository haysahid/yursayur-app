import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';
import 'package:pasar_sayur/common/app_styles.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    required this.title,
    this.isActive = true,
    required this.onPressed,
  });

  final String title;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: isActive ? AppColor.primary : AppColor.gray40,
        foregroundColor: isActive ? null : AppColor.gray40,
      ),
      child: Text(
        title,
        style: AppTextStyle.body1.copyWith(
          color: isActive ? AppColor.white : AppColor.gray100.withOpacity(.3),
        ),
      ),
    );
  }
}

class CustomSmallFilledButton extends StatelessWidget {
  const CustomSmallFilledButton({
    super.key,
    required this.title,
    this.isActive = true,
    required this.onPressed,
  });

  final String title;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: isActive ? AppColor.primary : AppColor.gray40,
        foregroundColor: isActive ? null : AppColor.gray40,
      ),
      child: Text(
        title,
        style: AppTextStyle.body3.copyWith(
          color: isActive ? AppColor.white : AppColor.gray100.withOpacity(.3),
        ),
      ),
    );
  }
}

class CustomFooterButton extends StatelessWidget {
  const CustomFooterButton({
    super.key,
    required this.title,
    this.iconPath,
    required this.onTap,
    this.backgroundColor,
  });

  final String title;
  final String? iconPath;
  final VoidCallback onTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColor.primary,
        shape: const RoundedRectangleBorder(),
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 18,
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (iconPath != null)
              Row(
                children: [
                  Image.asset(
                    iconPath!,
                    width: 24,
                    height: 24,
                    color: AppColor.white,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
            Flexible(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.body2.copyWith(
                  color: AppColor.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
