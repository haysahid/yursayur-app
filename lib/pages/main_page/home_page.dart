import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';
import 'package:pasar_sayur/common/app_styles.dart';
import 'package:pasar_sayur/models/product.dart';
import 'package:pasar_sayur/pages/search_product_page.dart';
import 'package:pasar_sayur/widgets/product_display_widget.dart';
import 'package:pasar_sayur/widgets/search_bar_widget.dart';
import 'package:pasar_sayur/widgets/section_title_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SizedBox(
          width: 1200,
          child: ListView(
            padding: const EdgeInsets.only(
              bottom: 40,
            ),
            children: [
              const Header(),
              SearchBarWidget(
                enabled: false,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchProductPage()));
                },
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeaderWidget(
                    title: 'Sayuran',
                    moreText: 'Selengkapnya',
                    moreAction: () {},
                  ),
                  ProductRowDisplayWidget(
                    productList: productList
                        .where((product) => product.category == 'Sayur')
                        .toList(),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeaderWidget(
                    title: 'Buah-buahan',
                    moreText: 'Selengkapnya',
                    moreAction: () {},
                  ),
                  ProductRowDisplayWidget(
                    productList: productList
                        .where((product) => product.category == 'Buah')
                        .toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,',
                    style: AppTextStyle.title2,
                  ),
                  Text(
                    'Mamanya Mia!',
                    style: AppTextStyle.title2,
                  ),
                ],
              ),
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/img_avatar1.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Divider(
            height: 2,
            thickness: 2,
            color: AppColor.secondary,
            endIndent: MediaQuery.of(context).size.width * .77,
          )
        ],
      ),
    );
  }
}
