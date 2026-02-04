import 'package:flutter/material.dart';

import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Color(0xff29B6F6),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person_outline,
                color: Colors.white,
                size: 40,
              ),
            ),
            /*
               // If there was an image, we would use:
               CircleAvatar(
                 radius: 40,
                 backgroundImage: AssetImage(AppAssets.imagesUserAvatar),
               ),
               */
          ],
        ),
        const SizedBox(height: 16),
        Text(
          AppStrings.welcomeTitle, // "Welcome"
          style: AppStyles.styleBold24(context),
        ),
        const SizedBox(height: 8),
        Text(
          AppStrings
              .registerSubtitle, // "Sign up with us to start your health journey"
          textAlign: TextAlign.center,
          style: AppStyles.styleRegular14(context).copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
