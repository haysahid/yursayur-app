import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';
import 'package:pasar_sayur/common/app_styles.dart';
import 'package:pasar_sayur/common/shared_methods.dart';
import 'package:pasar_sayur/models/review.dart';

class ReviewCardWidget extends StatelessWidget {
  const ReviewCardWidget({
    super.key,
    required this.review,
  });

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                review.name,
                style: AppTextStyle.body2.copyWith(
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              buildRating(review.rating),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            review.description,
            style: AppTextStyle.body3,
          ),
        ],
      ),
    );
  }
}
