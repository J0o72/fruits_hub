import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'حساب جديد', hasLeadingIcon: true),
      body: SafeArea(child: Center(child: Text('قم بانشاء ايميل'))),
    );
  }
}
