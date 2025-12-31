import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silancar_bloc/src/ui/auth/login/cubit/login_cubit.dart';
import 'package:silancar_bloc/src/ui/profile/view/profile_view.dart';
import 'package:silancar_bloc/src/utils/app_colors.dart';
import 'package:silancar_bloc/src/utils/app_text_style.dart';
import 'package:silancar_bloc/src/widget/app_primary_button.dart';
import 'package:silancar_bloc/src/widget/app_secondary_button.dart';
import 'package:silancar_bloc/src/widget/app_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController(text: "hilman6262@gmail.com");
  final passwordController = TextEditingController(text: "Zezen123@");
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    AppInputField(
                      label: 'Email',
                      hint: 'Masukkan email',
                      controller: emailController,
                    ),
                    const SizedBox(height: 16),
                    AppInputField(
                      label: 'Kata sandi',
                      hint: 'Masukkan kata sandi',
                      controller: passwordController,
                      obscureText: isObscure,
                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Lupa kata sandi ?',
                        style: AppTextStyle.link,
                      ),
                    ),
                    const SizedBox(height: 24),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return PrimaryButton(
                          text: state == LoginLoading()
                              ? 'Loading...'
                              : 'Masuk',
                          onPressed: () async {
                            await context.read<LoginCubit>().login(
                              emailController.text,
                              passwordController.text,
                              context,
                            );
                            // if (state is LoginSuccess) {
                            //   log("#${state.loginDataModel.data.name}");
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => ProfileView(),
                            //     ),
                            //   );
                            // }
                            if (state is LoginError) {
                              log("#${state.message}");
                            }
                            ;
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    SecondaryButton(text: 'Daftar Sekarang', onPressed: () {}),
                    const SizedBox(height: 24),
                    _buildFooter(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 260,
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Text('Selamat Datang', style: AppTextStyle.heading),
          const SizedBox(height: 8),
          Text(
            'Silahkan Masuk Untuk Melamar Pekerjaan',
            textAlign: TextAlign.center,
            style: AppTextStyle.subtitle,
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppTextStyle.footer,
        children: const [
          TextSpan(text: 'Dengan masuk atau mendaftar, saya menyetujui\n'),
          TextSpan(text: 'Ketentuan Penggunaan ', style: AppTextStyle.link),
          TextSpan(text: 'dan '),
          TextSpan(text: 'Kebijakan Privasi', style: AppTextStyle.link),
        ],
      ),
    );
  }
}
