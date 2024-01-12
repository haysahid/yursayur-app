import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';
import 'package:pasar_sayur/common/app_styles.dart';
import 'package:pasar_sayur/common/shared_methods.dart';
import 'package:pasar_sayur/models/product.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.product,
    this.onTap,
  });

  final ProductModel product;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x3F5FD068),
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: 150,
            height: 300,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    color: AppColor.cream1.withOpacity(.5),
                    child: Image.network(
                      product.productImages!.first,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress != null &&
                            loadingProgress.cumulativeBytesLoaded <
                                loadingProgress.expectedTotalBytes!) {
                          return const Center(
                            child: CupertinoActivityIndicator(),
                          );
                        }
                        return child;
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 6,
                      bottom: 8,
                      left: 8,
                      right: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.body3,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          currencyFormatter.format(product.price),
                          style: AppTextStyle.body3.copyWith(
                            fontWeight: semiBold,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/ic_star_filled.png',
                              width: 12,
                              height: 12,
                              color: AppColor.yellowAccent,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              '4,6',
                              style: AppTextStyle.overline,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
