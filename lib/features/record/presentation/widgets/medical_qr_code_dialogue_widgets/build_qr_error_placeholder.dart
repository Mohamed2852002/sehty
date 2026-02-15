import 'package:flutter/material.dart';
import 'package:sehty/core/utils/app_styles.dart';

class BuildQrErrorPlaceholder extends StatelessWidget {
  const BuildQrErrorPlaceholder({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.error_outline, color: Colors.red, size: 64),
        if (message.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: AppStyles.styleRegular12(
              context,
            ).copyWith(color: Colors.red),
          ),
        ],
      ],
    );
  }
}
