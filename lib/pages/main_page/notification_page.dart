import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';
import 'package:pasar_sayur/common/app_styles.dart';
import 'package:pasar_sayur/widgets/notification_tile.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

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
            child: Column(children: [
              Column(
                children: [
                  Text(
                    'Notifikasi',
                    style: AppTextStyle.subtitle1.copyWith(
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Gunakan fitur ini untuk melihat\nnotifikasi',
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
              const NotificationTile(
                iconPath: 'assets/ic_truck_delivery_filled.png',
                title: 'Pesanan sedang diantar',
                trailing: '08:34',
              ),
              const NotificationTile(
                iconPath: 'assets/ic_package_down_filled.png',
                title: 'Pesanan berhasil di-checkout',
                subtitle: 'Penjual sedang menyiapkan pengiriman',
                trailing: '07:49',
              ),
              const NotificationTile(
                title: 'Selamat bergabung',
                trailing: '06:12',
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
