import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sehty/core/router/routes.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/features/auth/presentation/widgets/chronic_diseases_section.dart';
import 'package:sehty/features/auth/presentation/widgets/data_consent_widget.dart';
import 'package:sehty/features/auth/presentation/widgets/personal_info_form.dart';
import 'package:sehty/features/auth/presentation/widgets/register_header.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                const PersonalInfoForm(),
                const SizedBox(height: 24),
                const ChronicDiseasesSection(),
                const SizedBox(height: 24),
                const DataConsentWidget(),
                const SizedBox(height: 24),
                InkWell(
                  onTap: () {
                    context.push(Routes.mainShell);
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xff26C6DA), // Cyan/Teal
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff26C6DA).withValues(alpha: 0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.createAccount,
                          style: AppStyles.styleBold16(
                            context,
                          ).copyWith(color: Colors.white),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.send, color: Colors.white, size: 18),
                      ],
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
  }
}
