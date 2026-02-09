import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sehty/core/utils/app_styles.dart';

class OtpDigitWidget extends StatelessWidget {
  const OtpDigitWidget({
    super.key,
    required this.index,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.onBackspace,
  });

  final int index;
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final VoidCallback onBackspace;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
      ),
      child: Center(
        child: KeyboardListener(
          focusNode: FocusNode(),
          onKeyEvent: (event) {
            if (event is KeyDownEvent &&
                event.logicalKey == LogicalKeyboardKey.backspace) {
              if (controller.text.isEmpty && index > 0) {
                onBackspace();
              }
            }
          },
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            onChanged: onChanged,
            decoration: const InputDecoration(
              counterText: "",
              border: InputBorder.none,
            ),
            style: AppStyles.styleBold16(context),
          ),
        ),
      ),
    );
  }
}
