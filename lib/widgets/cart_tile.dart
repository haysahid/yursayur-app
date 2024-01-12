import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';
import 'package:pasar_sayur/common/app_styles.dart';
import 'package:pasar_sayur/common/shared_methods.dart';
import 'package:pasar_sayur/models/cart_item.dart';
import 'package:pasar_sayur/widgets/count_input.dart';

class CartTileWidget extends StatefulWidget {
  const CartTileWidget({
    super.key,
    required this.cartItem,
    required this.onChange,
  });

  final CartItemModel cartItem;
  final void Function(CartItemModel cartItem) onChange;

  @override
  State<CartTileWidget> createState() => _CartTileWidgetState();
}

class _CartTileWidgetState extends State<CartTileWidget> {
  late CartItemModel cartItem;

  @override
  void initState() {
    super.initState();

    cartItem = widget.cartItem;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cartItem = widget.cartItem;
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.cartItem.product;

    return Container(
      color: AppColor.white,
      margin: const EdgeInsets.symmetric(
        vertical: 2,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      child: Row(
        children: [
          Checkbox(
            value: cartItem.isSelected,
            side: BorderSide(
              color: AppColor.gray80,
            ),
            activeColor: AppColor.primaryHover,
            onChanged: (value) {
              setState(() {
                cartItem = cartItem.copyWith(
                  isSelected: value,
                );
                widget.onChange(cartItem);
              });
            },
          ),
          const SizedBox(
            width: 4,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Image.network(
              product.productImages!.first,
              width: 60,
              height: 60,
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
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cartItem.product.name!,
                  style: AppTextStyle.body2.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '${currencyFormatter.format(product.price)} / ${product.unit}',
                  style: AppTextStyle.body3,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          CountInputWidget(
            onMinusPressed: () {
              setState(() {
                cartItem = cartItem.copyWith(
                  quantity: cartItem.quantity - 1,
                );
                widget.onChange(cartItem);
              });
            },
            onPlusPressed: () {
              setState(() {
                cartItem = cartItem.copyWith(
                  quantity: cartItem.quantity + 1,
                );
                widget.onChange(cartItem);
              });
            },
            value: widget.cartItem.quantity,
            minimum: 1,
          ),
        ],
      ),
    );
  }
}
