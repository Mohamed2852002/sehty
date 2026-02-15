import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sehty/core/router/routes.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_functions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/widgets/custom_button.dart';
import 'package:sehty/core/utils/widgets/custom_text_form_field.dart';
import 'package:sehty/features/auth/presentation/bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthOtpLoginSentSuccessfully) {
              context.push(Routes.otpVerification, extra: phoneNumber);
            }
            if (state is AuthFailure) {
              AppFunctions.showCustomSnackBar(context, state.message);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.l10n.welcomeTitle,
                  style: AppStyles.styleBold24(context),
                ),
                Text(
                  context.l10n.registerSubtitle,
                  textAlign: TextAlign.center,
                  style: AppStyles.styleRegular14(
                    context,
                  ).copyWith(color: AppColors.darkColor),
                ),
                const SizedBox(height: 32),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    context.l10n.mobileNumber,
                    style: AppStyles.styleBold16(context),
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  keyboardType: TextInputType.phone,
                  hint: '01xxxxxxxxx',
                  onChanged: (value) {
                    phoneNumber = value;
                  },
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    content: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return const CircularProgressIndicator(
                            color: Colors.white,
                          );
                        }
                        return Text(
                          context.l10n.sendCode,
                          style: AppStyles.styleBold16(
                            context,
                          ).copyWith(color: Colors.white),
                        );
                      },
                    ),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.read<AuthBloc>().add(
                          SendLoginOtpEvent(phone: phoneNumber),
                        );
                      } else {
                        setState(() {
                          _autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    context.push(Routes.register);
                  },
                  child: Text(
                    context.l10n.noAccount,
                    style: AppStyles.styleBold16(
                      context,
                    ).copyWith(color: AppColors.primary),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
