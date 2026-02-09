import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/widgets/custom_button.dart';
import 'package:sehty/features/auth/presentation/bloc/auth_bloc.dart';

class SendCodeButton extends StatefulWidget {
  const SendCodeButton({
    super.key,
    required this.onTap,
    this.color = AppColors.primary,
    this.borderRadius = 10,
    this.verticalPadding = 10,
  });

  final Function() onTap;
  final Color color;
  final double borderRadius;
  final double verticalPadding;

  @override
  State<SendCodeButton> createState() => _SendCodeButtonState();
}

class _SendCodeButtonState extends State<SendCodeButton> {
  Timer? _timer;
  int _start = 60;
  bool _isTimerRunning = false;

  void startTimer() {
    setState(() {
      _isTimerRunning = true;
      _start = 60;
    });
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          _isTimerRunning = false;
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          _isTimerRunning = false;
        }
      },
      child: CustomButton(
        content: _isTimerRunning
            ? Text(
                '$_start ${context.l10n.s}',
                style: AppStyles.styleRegular16(
                  context,
                ).copyWith(color: Colors.white),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  Text(
                    context.l10n.sendCode,
                    style: AppStyles.styleRegular16(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                  SvgPicture.asset(AppAssets.iconsRegisterSendIcon),
                ],
              ),
        onTap: _isTimerRunning
            ? null
            : () {
                widget.onTap();
                startTimer();
              },
      ),
    );
  }
}
