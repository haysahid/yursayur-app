import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';
import 'package:pasar_sayur/common/app_styles.dart';
import 'package:pasar_sayur/pages/login_page.dart';
import 'package:pasar_sayur/widgets/setting_tile.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
        ),
        child: Center(
          child: SizedBox(
            width: 600,
            child: Column(
              children: [
                Column(
                  children: [
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
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Mamanya Mia',
                      style: AppTextStyle.subtitle1.copyWith(
                        fontWeight: bold,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Jl. Condongcatur, Sleman, Yogyakarta',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.body2.copyWith(
                        color: AppColor.gray90,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                const SettingTile(
                  iconPath: 'assets/ic_edit_document_filled.png',
                  title: 'Ubah Profil',
                ),
                const SettingTile(
                  iconPath: 'assets/ic_order_list.png',
                  title: 'Pesanan Saya',
                ),
                SettingTile(
                  iconPath: 'assets/ic_sign_out_filled.png',
                  title: 'Keluar',
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (route) => false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
