import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';

import 'package:sehty/core/utils/app_styles.dart';

class DataConsentWidget extends StatefulWidget {
  const DataConsentWidget({super.key});

  @override
  State<DataConsentWidget> createState() => _DataConsentWidgetState();
}

class _DataConsentWidgetState extends State<DataConsentWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffEFFBF1), // Light Green bg
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'الموافقة على مشاركة البيانات', // "Consent to share data"
                  style: AppStyles.styleBold14(
                    context,
                  ).copyWith(color: AppColors.darkColor),
                ),
                const SizedBox(height: 4),
                Text(
                  'أوافق على مشاركة بياناتي الطبية مع مقدمي الرعاية الصحية المعتمدين لتحسين جودة الخدمة والرعاية الصحية المقدمة لي', // "I agree to share..."
                  textAlign: TextAlign.right,
                  style: AppStyles.styleRegular12(
                    context,
                  ).copyWith(color: Colors.grey[700], height: 1.5),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: _isChecked,
                onChanged: (val) {
                  setState(() {
                    _isChecked = val!;
                  });
                },
                activeColor: AppColors.greenColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: const BorderSide(color: AppColors.greenColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
