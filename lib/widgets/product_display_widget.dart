import 'package:flutter/material.dart';
import 'package:pasar_sayur/models/product.dart';
import 'package:pasar_sayur/pages/product_detail_page.dart';
import 'package:pasar_sayur/widgets/product_card_widget.dart';

class ProductRowDisplayWidget extends StatelessWidget {
  const ProductRowDisplayWidget({
    super.key,
    required this.productList,
  });

  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.separated(
        itemCount: productList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 8,
        ),
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 8,
          );
        },
        itemBuilder: (context, index) {
          final product = productList[index];

          return ProductCardWidget(
            product: product,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailPage(product: product)));
            },
          );
        },
      ),
    );
  }
}

class ProductGridDisplayWidget extends StatelessWidget {
  const ProductGridDisplayWidget({
    super.key,
    required this.productList,
  });

  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.landscape &&
                      constraints.maxWidth > 600
                  ? 5
                  : 2,
          childAspectRatio: MediaQuery.of(context).orientation ==
                      Orientation.landscape &&
                  constraints.maxWidth > 600
              ? 3 / 4
              : MediaQuery.of(context).orientation == Orientation.landscape &&
                      constraints.maxWidth < 600
                  ? 4 / 3
                  : 5 / 6,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 8,
          bottom: 16,
        ),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];

          return ProductCardWidget(
            product: product,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailPage(product: product)));
            },
          );
        },
      );
    });
  }
}
