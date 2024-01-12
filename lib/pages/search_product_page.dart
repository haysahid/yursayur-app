import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';
import 'package:pasar_sayur/common/app_styles.dart';
import 'package:pasar_sayur/models/product.dart';
import 'package:pasar_sayur/widgets/product_display_widget.dart';
import 'package:pasar_sayur/widgets/search_bar_widget.dart';

class SearchProductPage extends StatefulWidget {
  const SearchProductPage({super.key});

  @override
  State<SearchProductPage> createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {
  List<ProductModel> filteredProductList = [];

  search(String keyword) {
    setState(() {
      filteredProductList.clear();

      keyword = keyword.toLowerCase();

      print('Searching...');

      for (var product in productList) {
        final name = product.name!.toLowerCase();
        final description = product.description!.toLowerCase();
        final tags = product.tags!.join(',');

        if (name.contains(keyword) ||
            description.contains(keyword) ||
            tags.contains(keyword)) {
          filteredProductList.add(product);
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();

    filteredProductList = List.from(productList);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mau cari apa?',
          style: AppTextStyle.body1,
        ),
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 1200,
            padding: const EdgeInsets.only(
              top: 16,
            ),
            child: Column(
              children: [
                SearchBarWidget(
                  isFocused: true,
                  onSearch: search,
                ),
                if (filteredProductList.isNotEmpty)
                  const SizedBox(
                    height: 16,
                  ),
                Expanded(
                  child: filteredProductList.isNotEmpty
                      ? ProductGridDisplayWidget(
                          productList: filteredProductList,
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search_off_rounded,
                                size: 100,
                                color: AppColor.gray60,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Produk tidak ditemukan',
                              ),
                            ],
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
