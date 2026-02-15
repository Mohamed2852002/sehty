import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/features/record/presentation/bloc/record_bloc.dart';
import 'package:sehty/features/record/presentation/widgets/upload_medical_dialogue_widgets/upload_medical_record_dialog.dart';

class RecordHeader extends StatelessWidget {
  const RecordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.medicalRecord,
                style: AppStyles.styleBold24(context),
              ),
              const SizedBox(height: 4),
              Text(
                context.l10n.medicalFilesSecure,
                style: AppStyles.styleRegular14(
                  context,
                ).copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
        Row(
          spacing: 8,
          children: [
            InkWell(
              onTap: () async {
                final recordBloc = context.read<RecordBloc>();
                final result = await showDialog<bool>(
                  context: context,
                  builder: (_) => BlocProvider.value(
                    value: recordBloc,
                    child: const UploadMedicalRecordDialog(),
                  ),
                );
                if (result == true) {
                  recordBloc.add(GetMedicalRecordsEvent());
                }
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.file_upload_outlined,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     showDialog(
            //       context: context,
            //       builder: (context) => const MedicalQrScannerDialog(),
            //     );
            //   },
            //   borderRadius: BorderRadius.circular(12),
            //   child: Container(
            //     padding: const EdgeInsets.all(12),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(12),
            //       border: Border.all(color: AppColors.primary),
            //     ),
            //     child: const Icon(
            //       Icons.qr_code_2,
            //       color: AppColors.primary,
            //       size: 24,
            //     ),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
