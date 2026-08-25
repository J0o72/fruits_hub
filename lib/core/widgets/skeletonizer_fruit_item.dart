import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theme/text_styles.dart';

class SkeletonizerFruitItem extends StatelessWidget {
  const SkeletonizerFruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      width: double.infinity,
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.transparent),
            width: 100,
            height: 100,
            child: Icon(Icons.add, color: Colors.white, size: 100),
          ),

          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                'Apple',
                textAlign: TextAlign.right,
                style: TextStyles.font13LightBlackSemiBold,
              ),
            ),
            subtitle: Text.rich(
              textAlign: TextAlign.start,
              TextSpan(
                children: [
                  TextSpan(
                    text: '30 جنية / ',
                    style: TextStyles.font13SecondaryYelloBold,
                  ),

                  TextSpan(
                    text: 'الكيلو',
                    style: TextStyles.font13SecondaryLightYelloSemiBold,
                  ),
                ],
              ),
            ),

            trailing: Icon(Icons.add, color: Colors.white, size: 34),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
        ],
      ),
    );
  }
}
