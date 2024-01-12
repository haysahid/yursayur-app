import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';
import 'package:pasar_sayur/common/app_styles.dart';
import 'package:pasar_sayur/common/shared_methods.dart';
import 'package:pasar_sayur/widgets/message_tile.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

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
                    Text(
                      'Hubungi Penjual',
                      style: AppTextStyle.subtitle1.copyWith(
                        fontWeight: bold,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Gunakan fitur ini untuk menghubungi\npenjual',
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
                MessageTile(
                  avatarPath: 'assets/img_avatar1.png',
                  title: 'Sayur Makmur Bantul',
                  subtitle: 'Okee 👌',
                  topTrailing: timeFormatter(DateTime.now()),
                  bottomTrailing: '1',
                ),
                const MessageTile(
                  title: 'Sayuuur Bude',
                  subtitle: 'mantap...💛',
                  topTrailing: 'Yesterday',
                ),
                const MessageTile(
                  title: 'Gudang Buah Sehat',
                  subtitle: 'Ready 20 ton mba..',
                  topTrailing: '29/09/2023',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
