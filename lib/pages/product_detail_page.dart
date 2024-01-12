import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';
import 'package:pasar_sayur/common/app_styles.dart';
import 'package:pasar_sayur/common/shared_methods.dart';
import 'package:pasar_sayur/models/product.dart';
import 'package:pasar_sayur/models/review.dart';
import 'package:pasar_sayur/pages/cart_page.dart';
import 'package:pasar_sayur/pages/search_product_page.dart';
import 'package:pasar_sayur/widgets/count_input.dart';
import 'package:pasar_sayur/widgets/custom_buttons.dart';
import 'package:pasar_sayur/widgets/review_card_widget.dart';
import 'package:pasar_sayur/widgets/section_title_widget.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final _scrollController = ScrollController();
  late final PageController _imageController;

  int totalPrice = 0;
  int count = 0;
  int currentImage = 0;

  bool scrolled = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.offset > 0) {
          scrolled = true;
        } else {
          scrolled = false;
        }
      });
    });

    _imageController = PageController(initialPage: currentImage);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth < 600) {
          return _buildMobileView(context);
        } else {
          return _buildWebView(context);
        }
      },
    );
  }

  Widget _buildWebView(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: _buildAppBar(false),
      body: Center(
        child: SizedBox(
          width: 1200,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(
                    top: 0,
                  ),
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                              left: 24,
                            ),
                            child: _buildImages(context),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(height: 4),
                                  _buildBaseInfo(),
                                  _buildStoreInfo(),
                                  _buildDescription(),
                                  _buildReviews(),
                                ],
                              ),
                              const SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ],
                    ),
                    _buildFooter(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileView(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(true),
      body: Center(
        child: SizedBox(
          width: 600,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(
                    top: 0,
                  ),
                  children: [
                    _buildImages(context),
                    _buildBaseInfo(),
                    _buildStoreInfo(),
                    _buildDescription(),
                    _buildReviews(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(bool dynamic) {
    return AppBar(
      forceMaterialTransparency: dynamic,
      iconTheme: IconThemeData(
        color: !dynamic || scrolled ? AppColor.gray100 : AppColor.white,
      ),
      flexibleSpace: !dynamic || scrolled
          ? Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x3F5FD068).withOpacity(.1),
                    blurRadius: 8,
                    offset: Offset.zero,
                    spreadRadius: 0,
                  ),
                ],
              ),
            )
          : Container(
              decoration: const BoxDecoration(
                backgroundBlendMode: BlendMode.multiply,
                gradient: LinearGradient(
                  colors: [
                    Color(0x00607d8b),
                    Color(0x1a50695d),
                    Color(0x293e463b),
                    Color(0x3d32352e),
                    Color(0x40232320),
                    Color(0x52000000)
                  ],
                  stops: [0, 0.15, 0.25, 0.5, 0.7, 1],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SearchProductPage()));
          },
          icon: Image.asset(
            'assets/ic_search_outline.png',
            color: !dynamic || scrolled ? AppColor.gray100 : AppColor.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.share,
            size: 22,
            color: !dynamic || scrolled ? AppColor.gray100 : AppColor.white,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartPage()));
          },
          icon: Image.asset(
            'assets/ic_shopping_cart_outline.png',
            color: !dynamic || scrolled ? AppColor.gray100 : AppColor.white,
          ),
        ),
        const SizedBox(width: 4),
      ],
    );
  }

  Widget _buildImages(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return SizedBox(
        height: constraint.maxWidth,
        child: Stack(
          children: [
            PageView.builder(
              controller: _imageController,
              onPageChanged: (value) {
                setState(() {
                  currentImage = value;
                });
              },
              restorationId: 'image',
              pageSnapping: true,
              itemCount: widget.product.productImages!.length,
              itemBuilder: (context, index) {
                final image = widget.product.productImages![index];
                PageStorageKey(index);

                return ImageViewWidget(image: image);
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.product.productImages!.length,
                    (index) {
                      return Container(
                        width: currentImage == index ? 16 : 8,
                        height: 8,
                        margin: index < widget.product.productImages!.length
                            ? const EdgeInsets.only(right: 8)
                            : null,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentImage == index
                              ? AppColor.greenAccent
                              : AppColor.gray40,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: 24,
            right: 8,
            top: 12,
            bottom: 12,
          ),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style: AppTextStyle.body2,
                    ),
                    Text(
                      currencyFormatter.format(totalPrice),
                      style: AppTextStyle.subtitle2,
                    ),
                  ],
                ),
              ),
              CountInputWidget(
                onMinusPressed: () {
                  setState(() {
                    count--;
                    totalPrice -= widget.product.price!;
                  });
                },
                onPlusPressed: () {
                  setState(() {
                    count++;
                    totalPrice += widget.product.price!;
                  });
                },
                value: count,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 60,
          child: Row(
            children: [
              Expanded(
                child: CustomFooterButton(
                  title: 'Hubungi Penjual',
                  iconPath: 'assets/ic_chat_bubble_outline.png',
                  backgroundColor: AppColor.primary,
                  onTap: () {},
                ),
              ),
              Expanded(
                child: CustomFooterButton(
                  title: '+ Keranjang',
                  iconPath: 'assets/ic_shopping_cart_outline.png',
                  backgroundColor: AppColor.primaryHover,
                  onTap: () {},
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Column _buildReviews() {
    return Column(
      children: [
        SectionHeaderWidget(
          title: 'Ulasan',
          moreText: 'Selengkapnya',
          moreAction: () {},
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 10,
          ),
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 8,
            );
          },
          itemCount: reviews.length,
          itemBuilder: (context, index) {
            final review = reviews[index];

            return ReviewCardWidget(
              review: review,
            );
          },
        ),
      ],
    );
  }

  Padding _buildBaseInfo() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 24,
        left: 24,
        right: 23,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name!,
                  style: AppTextStyle.subtitle1.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    buildRating(4),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '(1.023)',
                      style: AppTextStyle.caption.copyWith(
                        fontWeight: medium,
                        color: AppColor.gray90,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                currencyFormatter.format(
                  widget.product.price,
                ),
                style: AppTextStyle.subtitle2.copyWith(
                  color: AppColor.redAccent,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              if (widget.product.unit != null)
                Text(
                  '/ ${widget.product.unit!}',
                  style: AppTextStyle.caption,
                ),
            ],
          )
        ],
      ),
    );
  }

  Padding _buildDescription() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 10,
      ),
      child: Column(
        children: [
          const SectionHeaderWidget(
            title: 'Deskripsi',
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Text(
              widget.product.description!,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildStoreInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      color: AppColor.white,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/img_avatar1.png',
                ),
              ),
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
                  'Sayur Makmur Bantul',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.body2.copyWith(
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 12,
                      height: 12,
                      child: Center(
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.greenAccent,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Flexible(
                      child: Text(
                        'Online',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.caption.copyWith(
                          color: AppColor.gray90,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/ic_location_filled.png',
                      width: 12,
                      height: 12,
                      color: AppColor.gray80,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Flexible(
                      child: Text(
                        'Sleman, DIY',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.caption.copyWith(
                          color: AppColor.gray90,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomSmallFilledButton(
            title: 'Kunjungi Toko',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class ImageViewWidget extends StatefulWidget {
  const ImageViewWidget({
    super.key,
    required this.image,
  });

  final String image;

  @override
  State<ImageViewWidget> createState() => _ImageViewWidgetState();
}

class _ImageViewWidgetState extends State<ImageViewWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Image.network(
      widget.image,
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}
