import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';
import 'package:pasar_sayur/pages/cart_page.dart';
import 'package:pasar_sayur/pages/main_page/account_page.dart';
import 'package:pasar_sayur/pages/main_page/chat_page.dart';
import 'package:pasar_sayur/pages/main_page/home_page.dart';
import 'package:pasar_sayur/pages/main_page/notification_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final _pageController = PageController(initialPage: 0);
  late int currentIndex;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingActionButton(),
      body: SafeArea(
        child: SizedBox(
          width: 1200,
          child: Center(
            child: _buildBody(),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return PageView(
      controller: _pageController,
      pageSnapping: true,
      onPageChanged: (value) {
        setState(() {
          currentIndex = value;
        });
      },
      children: const [
        HomePage(),
        ChatPage(),
        NotificationPage(),
        AccountPage(),
      ],
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const CartPage()));
      },
      backgroundColor: AppColor.primary,
      shape: const OvalBorder(),
      child: Image.asset(
        'assets/ic_shopping_cart_outline.png',
        width: 24,
        color: AppColor.white,
      ),
    );
  }

  Widget _buildBottomAppBar() {
    return Container(
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
      child: BottomAppBar(
        height: 60,
        color: AppColor.white,
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.zero,
        shadowColor: AppColor.cream2,
        elevation: 0,
        notchMargin: 0,
        child: Center(
          child: SizedBox(
            width: 400,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => changePage(0),
                  icon: SizedBox(
                    width: 40,
                    child: Image.asset(
                      'assets/ic_home_outline.png',
                      width: 24,
                      height: 24,
                      color: currentIndex == 0
                          ? AppColor.primary
                          : AppColor.gray60,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => changePage(1),
                  icon: SizedBox(
                    width: 40,
                    child: Image.asset(
                      'assets/ic_chat_bubble_outline.png',
                      width: 24,
                      height: 24,
                      color: currentIndex == 1
                          ? AppColor.primary
                          : AppColor.gray60,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                IconButton(
                  onPressed: () => changePage(2),
                  icon: SizedBox(
                    width: 40,
                    child: Image.asset(
                      'assets/ic_notificaation_outline.png',
                      width: 24,
                      height: 24,
                      color: currentIndex == 2
                          ? AppColor.primary
                          : AppColor.gray60,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => changePage(3),
                  icon: SizedBox(
                    width: 40,
                    child: Image.asset(
                      'assets/ic_account_outline.png',
                      width: 24,
                      height: 24,
                      color: currentIndex == 3
                          ? AppColor.primary
                          : AppColor.gray60,
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
