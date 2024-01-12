import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';
import 'package:pasar_sayur/common/app_styles.dart';
import 'package:pasar_sayur/widgets/custom_buttons.dart';
import 'package:pasar_sayur/widgets/custom_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();

    obscurePassword = true;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();

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
                      'Daftar',
                      style: AppTextStyle.title1,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Silahkan daftar\nuntuk mulai belanja',
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
                  controller: _nameController,
                  label: 'Nama Lengkap',
                  hintText: 'Masukkan Nama Lengkap',
                  topMargin: true,
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
                  topMargin: true,
                  obscureText: obscurePassword,
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
                CustomTextFormField(
                  controller: _passwordConfirmationController,
                  label: 'Konfirmasi Password',
                  hintText: 'Konfirmasi Password',
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
                  title: 'Daftar',
                  isActive: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah punya akun?',
                      style: AppTextStyle.body2.copyWith(
                        color: AppColor.gray90,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Masuk',
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
