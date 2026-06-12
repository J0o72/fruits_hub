import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/helpers/spacing.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(children: [
            

          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(75),
            border: Border.all(width: 2, color: Color(0xffF1F1F5)),
            // color: Colors.amberAccent,
          ),
          child: IconButton(
            iconSize: 20,
            padding: EdgeInsets.all(0),
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back_ios_rounded),
          ),
        ),
        horizontalSpace(MediaQuery.of(context).size.width * 0.25),
        Text('تسجيل دخول', style: TextStyles.font19LightBlackBold),
      ],
    );
  }
}
