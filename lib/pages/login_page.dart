import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';
import 'package:pasar_sayur/common/app_styles.dart';
import 'package:pasar_sayur/pages/main_page.dart';
import 'package:pasar_sayur/pages/register_page.dart';
import 'package:pasar_sayur/widgets/custom_buttons.dart';
import 'package:pasar_sayur/widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();

    obscurePassword = true;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setObscurePassword() {
      setState(() {
        obscurePassword = !obscurePassword;
      });
    }

    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 600,
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 40,
              ),
              children: [
                Column(
                  children: [
                    Text(
                      'Masuk',
                      style: AppTextStyle.title1,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Silahkan masuk untuk\nmulai belanja',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.body2.copyWith(
                        color: AppColor.gray90,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                CustomTextFormField(
                  controller: _emailController,
                  label: 'Email',
                  hintText: 'Masukkan Email',
                  topMargin: true,
                ),
                CustomTextFormField(
                  controller: _passwordController,
                  label: 'Password',
                  hintText: 'Password',
                  obscureText: obscurePassword,
                  topMargin: true,
                  suffixIcon: IconButton(
                    onPressed: setObscurePassword,
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 24,
                      color: AppColor.gray80,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomFilledButton(
                  title: 'Masuk',
                  isActive: true,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainPage()),
                        (route) => false);
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum punya akun?',
                      style: AppTextStyle.body2.copyWith(
                        color: AppColor.gray90,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Daftar',
                          style: AppTextStyle.body2.copyWith(
                            fontWeight: semiBold,
                            color: AppColor.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
