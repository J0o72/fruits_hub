import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';
import 'package:fruit_hub/features/auth/login/ui/widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text('تسجيل دخول', style: TextStyles.font19LightBlackBold),
      ),
      body: SafeArea(child: LoginScreenBody()),
    );
  }
}
