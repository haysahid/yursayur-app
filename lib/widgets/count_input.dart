import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';
import 'package:pasar_sayur/common/app_styles.dart';

class CountInputWidget extends StatelessWidget {
  const CountInputWidget({
    super.key,
    required this.onMinusPressed,
    required this.onPlusPressed,
    required this.value,
    this.minimum = 0,
  });

  final VoidCallback onMinusPressed;
  final VoidCallback onPlusPressed;
  final int value;
  final int minimum;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: value == minimum ? null : onMinusPressed,
          icon: Icon(
            Icons.remove_circle,
            color: value == minimum ? AppColor.gray60 : AppColor.primary,
          ),
        ),
        Text(
          '$value',
          style: AppTextStyle.body1,
        ),
        IconButton(
          onPressed: onPlusPressed,
          icon: Icon(
            Icons.add_circle,
            color: AppColor.primary,
          ),
        ),
      ],
    );
  }
}
