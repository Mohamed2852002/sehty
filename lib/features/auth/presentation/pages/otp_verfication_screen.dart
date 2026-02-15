import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sehty/core/router/routes.dart';
import 'package:sehty/core/utils/app_functions.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_button.dart';
import 'package:sehty/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sehty/features/auth/presentation/widgets/otp_digit_widget.dart';

class OtpVerficationScreen extends StatefulWidget {
  const OtpVerficationScreen({super.key, required this.phone});
  final String phone;

  @override
  State<OtpVerficationScreen> createState() => _OtpVerficationScreenState();
}

class _OtpVerficationScreenState extends State<OtpVerficationScreen> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;
  String _otpCode = '';

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(6, (index) => FocusNode());
    _controllers = List.generate(6, (index) => TextEditingController());
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onDigitChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 5) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        FocusScope.of(context).unfocus();
        // Construct code immediately to ensure we have the latest value
        final code = _controllers.map((e) => e.text).join();
        if (code.length == 6) {
          context.read<AuthBloc>().add(
            LoginEvent(phone: widget.phone, otp: code),
          );
        }
      }
    }
    _updateOtpCode();
  }

  void _updateOtpCode() {
    setState(() {
      _otpCode = _controllers.map((e) => e.text).join();
    });
  }

  void _onBackspace(int index) {
    if (index > 0) {
      _controllers[index - 1].clear();
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
    _updateOtpCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.go(Routes.mainShell);
          }
          if (state is AuthFailure) {
            AppFunctions.showCustomSnackBar(context, state.message);
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    context.l10n.enterVerificationCode,
                    style: AppStyles.styleBold16(context),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${context.l10n.enterVerificationCode} 01xxxxxxxxx',
                    style: AppStyles.styleRegular14(
                      context,
                    ).copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    spacing: 8,
                    children: List.generate(
                      6,
                      (index) => Expanded(
                        child: OtpDigitWidget(
                          index: index,
                          controller: _controllers[index],
                          focusNode: _focusNodes[index],
                          onChanged: (value) => _onDigitChanged(value, index),
                          onBackspace: () => _onBackspace(index),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    content: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return const CircularProgressIndicator(
                            color: Colors.white,
                          );
                        }
                        return Text(
                          context.l10n.verify,
                          style: AppStyles.styleBold16(
                            context,
                          ).copyWith(color: Colors.white),
                        );
                      },
                    ),
                    onTap: () {
                      if (_otpCode.isEmpty) {
                        AppFunctions.showCustomSnackBar(
                          context,
                          context.l10n.enterVerificationCode,
                        );
                        return;
                      }
                      context.read<AuthBloc>().add(
                        LoginEvent(phone: widget.phone, otp: _otpCode),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
