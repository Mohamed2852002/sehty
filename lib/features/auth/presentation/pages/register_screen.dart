import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sehty/core/router/routes.dart';
import 'package:sehty/core/utils/app_functions.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sehty/features/auth/presentation/widgets/register_screen_widgets/chronic_diseases_section.dart';
import 'package:sehty/features/auth/presentation/widgets/register_screen_widgets/data_consent_widget.dart';
import 'package:sehty/features/auth/presentation/widgets/register_screen_widgets/personal_info_form.dart';
import 'package:sehty/features/auth/presentation/widgets/register_screen_widgets/register_header.dart';
import 'package:sehty/features/profile/presentation/bloc/profile_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  String? _name;
  int? _age;
  double? _weight;
  String? _gender;
  String? _state;
  String? _city;
  String _phoneNumber = '';
  String _otpCode = '';
  late List<FocusNode> _otpFocusNodes;
  late List<TextEditingController> _otpControllers;
  bool _otpSent = false;
  List<int> _chronicDiseases = [];
  bool _dataConsent = false;

  @override
  void initState() {
    super.initState();
    _otpFocusNodes = List.generate(6, (index) => FocusNode());
    _otpControllers = List.generate(6, (index) => TextEditingController());
    context.read<ProfileBloc>().add(GetChronicDiseasesEvent());
  }

  @override
  void dispose() {
    for (var node in _otpFocusNodes) {
      node.dispose();
    }
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onOtpDigitChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 5) {
        FocusScope.of(context).requestFocus(_otpFocusNodes[index + 1]);
      } else {
        FocusScope.of(context).unfocus();
      }
    }
    _updateOtpCode();
  }

  void _onOtpBackspace(int index) {
    if (index > 0) {
      _otpControllers[index - 1].clear();
      FocusScope.of(context).requestFocus(_otpFocusNodes[index - 1]);
    }
    _updateOtpCode();
  }

  void _updateOtpCode() {
    setState(() {
      _otpCode = _otpControllers.map((e) => e.text).join();
    });
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (!_otpSent) {
        AppFunctions.showCustomSnackBar(
          context,
          context.l10n.sendVerificationCode,
          backgroundColor: Colors.red,
        );
        return;
      }

      if (_otpCode.isEmpty) {
        AppFunctions.showCustomSnackBar(
          context,
          context.l10n.otpRequired,
          backgroundColor: Colors.red,
        );
        return;
      }
      if (!_dataConsent) {
        AppFunctions.showCustomSnackBar(
          context,
          context.l10n.dataConsentRequired,
          backgroundColor: Colors.red,
        );
      }

      context.read<AuthBloc>().add(
        RegisterEvent(
          phone: _phoneNumber,
          name: _name ?? '',
          otp: _otpCode,
          age: _age ?? 0,
          gender: _gender?.toLowerCase() ?? 'male',
          weight: _weight ?? 0.0,
          governorate: _state ?? 'Unknown',
          district: _city ?? 'Unknown',
          chronicDiseases: _chronicDiseases,
          dataSharingConsent: _dataConsent,
        ),
      );
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthOtpRegisterSentSuccessfully) {
          setState(() {
            _otpSent = true;
          });
        } else if (state is AuthFailure) {
          AppFunctions.showCustomSnackBar(context, state.message);
        } else if (state is AuthSuccess) {
          context.push(Routes.mainShell);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(height: 20),
                    const RegisterHeader(),
                    const SizedBox(height: 24),
                    Form(
                      key: _formKey,
                      autovalidateMode: _autovalidateMode,
                      child: PersonalInfoForm(
                        onSavedName: (v) => _name = v,
                        onSavedAge: (v) => _age = int.tryParse(v ?? ''),
                        onSavedWeight: (v) =>
                            _weight = double.tryParse(v ?? ''),
                        onSavedGender: (v) => _gender = v,
                        onStateChanged: (v) => _state = v,
                        onCityChanged: (v) => _city = v,
                        onSavedPhone: (v) => _phoneNumber = v ?? '',
                        onSendCodePressed: (phone) {
                          context.read<AuthBloc>().add(
                            SendRegisterOtpEvent(phone: phone),
                          );
                        },
                        isOtpSent: _otpSent,
                        onOtpChanged: _onOtpDigitChanged,
                        onOtpBackspace: _onOtpBackspace,
                        otpFocusNodes: _otpFocusNodes,
                        otpControllers: _otpControllers,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ChronicDiseasesSection(
                      onChanged: (selectedIds) {
                        _chronicDiseases = selectedIds;
                      },
                    ),
                    const SizedBox(height: 24),
                    DataConsentWidget(
                      onChanged: (value) {
                        _dataConsent = value;
                      },
                    ),
                    const SizedBox(height: 24),
                    InkWell(
                      onTap: _otpSent ? _submit : null,
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: _otpSent
                              ? const Color(0xff26C6DA)
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            if (_otpSent)
                              BoxShadow(
                                color: const Color(
                                  0xff26C6DA,
                                ).withValues(alpha: 0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                          ],
                        ),
                        child: BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            if (state is AuthLoading) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              );
                            }
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  context.l10n.createAccount,
                                  style: AppStyles.styleBold16(
                                    context,
                                  ).copyWith(color: Colors.white),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.send,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
