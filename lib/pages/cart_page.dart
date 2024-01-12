import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';
import 'package:pasar_sayur/common/app_styles.dart';
import 'package:pasar_sayur/common/shared_methods.dart';
import 'package:pasar_sayur/models/cart_item.dart';
import 'package:pasar_sayur/pages/search_product_page.dart';
import 'package:pasar_sayur/widgets/cart_tile.dart';
import 'package:pasar_sayur/widgets/custom_buttons.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<CartItemModel> listCartItem;

  @override
  void initState() {
    super.initState();

    listCartItem = List.of(cartItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return _buildMobileView(context);
        } else {
          return _buildWebView();
        }
      }),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'Keranjang Saya',
        style: AppTextStyle.body1,
      ),
      backgroundColor: AppColor.white,
      scrolledUnderElevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColor.cream2,
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildWebView() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: listCartItem.isNotEmpty
                ? SingleChildScrollView(
                    child: _buildCartItems(),
                  )
                : _buildEmptyCart(context),
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.only(top: 4),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        left: 24,
                        right: 8,
                        top: 12,
                        bottom: 12,
                      ),
                      color: AppColor.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sub Total',
                            style: AppTextStyle.body2,
                          ),
                          Text(
                            currencyFormatter.format(
                              listCartItem
                                  .where((e) => e.isSelected == true)
                                  .toList()
                                  .fold(
                                    0,
                                    (total, cartItem) => total +=
                                        cartItem.quantity *
                                            cartItem.product.price!,
                                  ),
                            ),
                            style: AppTextStyle.subtitle2,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      child: CustomFooterButton(
                        title: 'Checkout',
                        backgroundColor: AppColor.primary,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _buildMobileView(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: listCartItem.isNotEmpty
              ? SingleChildScrollView(
                  child: Center(
                    child: _buildCartItems(),
                  ),
                )
              : _buildEmptyCart(context),
        ),
        _buildFooter(),
      ],
    );
  }

  Center _buildEmptyCart(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_shopping_cart_rounded,
                size: 100,
                color: AppColor.gray60,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Oops! Keranjang kosong',
              ),
              const SizedBox(
                height: 24,
              ),
              CustomFilledButton(
                title: 'Mulai belanja',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchProductPage()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartItems() {
    return ListView.builder(
      padding: const EdgeInsets.only(
        top: 2,
        bottom: 40,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: listCartItem.length,
      itemBuilder: (context, index) {
        final cartItem = listCartItem[index];

        return Dismissible(
          key: Key('${cartItem.product.id}'),
          confirmDismiss: (direction) async {
            bool confirmation = false;

            confirmation = await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return _buildDeleteConfirmation(cartItem, context);
              },
            );

            if (confirmation == true) {
              setState(() {
                listCartItem
                    .removeWhere((e) => e.product.id == cartItem.product.id);
              });

              return true;
            }

            return false;
          },
          child: CartTileWidget(
            cartItem: cartItem,
            onChange: (cartItem) {
              setState(() {
                listCartItem[index] = cartItem;
              });
            },
          ),
        );
      },
    );
  }

  AlertDialog _buildDeleteConfirmation(
      CartItemModel cartItem, BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.white,
      title: Column(
        children: [
          Text(
            'Hapus?',
            textAlign: TextAlign.center,
            style: AppTextStyle.title2,
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            'Yakin ingin menghapus item ini dari keranjang?',
            textAlign: TextAlign.center,
            style: AppTextStyle.body2,
          ),
        ],
      ),
      titlePadding: const EdgeInsets.only(
        left: 32,
        right: 32,
        top: 32,
        bottom: 16,
      ),
      content: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              cartItem.product.productImages!.first,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  cartItem.product.name!,
                  style: AppTextStyle.body1,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '${currencyFormatter.format(cartItem.product.price!)} / ${cartItem.product.unit!}',
                  style: AppTextStyle.body3,
                ),
              ],
            ),
          ],
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      actionsPadding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 4,
            ),
          ),
          child: Text(
            'Batal',
            style: AppTextStyle.body1.copyWith(
              fontWeight: regular,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 4,
            ),
          ),
          child: Text(
            'Hapus',
            style: AppTextStyle.body1.copyWith(
              color: AppColor.redAccent,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F5FD068),
            blurRadius: 16,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.only(
                left: 24,
                right: 8,
                top: 12,
                bottom: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sub Total',
                    style: AppTextStyle.body2,
                  ),
                  Text(
                    currencyFormatter.format(
                      listCartItem
                          .where((e) => e.isSelected == true)
                          .toList()
                          .fold(
                            0,
                            (total, cartItem) => total +=
                                cartItem.quantity * cartItem.product.price!,
                          ),
                    ),
                    style: AppTextStyle.subtitle2,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomFooterButton(
              title: 'Checkout',
              backgroundColor: AppColor.primary,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
