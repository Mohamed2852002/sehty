import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_functions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_button.dart';
import 'package:sehty/core/utils/widgets/custom_dialog.dart';
import 'package:sehty/features/record/domain/entities/medical_record_entity.dart';
import 'package:sehty/features/record/presentation/bloc/record_bloc.dart';
import 'package:sehty/features/record/presentation/widgets/medical_qr_code_dialogue_widgets/build_qr_code.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MedicalQrCodeDialog extends StatefulWidget {
  final MedicalRecordEntity record;
  const MedicalQrCodeDialog({super.key, required this.record});

  @override
  State<MedicalQrCodeDialog> createState() => _MedicalQrCodeDialogState();
}

class _MedicalQrCodeDialogState extends State<MedicalQrCodeDialog> {
  String? _fileUrl;
  
  @override
  void initState() {
    super.initState();
    context.read<RecordBloc>().add(
      ShareMedicalRecordEvent(recordId: widget.record.id ?? 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecordBloc, RecordState>(
      listener: (context, state) {
        if (state is ShareMedicalRecordError) {
          AppFunctions.showCustomSnackBar(
            context,
            state.message,
            backgroundColor: Colors.red,
          );
        } else if (state is MedicalRecordShared) {
          final String shareToken = Uri.parse(
            state.sharedRecordInfo.shareUrl ?? '',
          ).pathSegments.last;
          if (shareToken.isNotEmpty) {
            context.read<RecordBloc>().add(
              GetSharedMedicalRecordEvent(shareToken: shareToken),
            );
          }
        } else if (state is SharedMedicalRecordLoaded) {
          setState(() {
            _fileUrl = state.sharedRecord.fileUrl;
          });
        }
      },
      builder: (context, state) {
        if (state is ShareMedicalRecordLoading) {
          return const CustomDialog(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        MedicalRecordEntity displayRecord = widget.record;
        if (state is MedicalRecordsLoaded) {
          try {
            displayRecord = state.records.firstWhere(
              (r) => r.id == widget.record.id,
              orElse: () => widget.record,
            );
          } catch (_) {
            displayRecord = widget.record;
          }
        }

        final qrData = displayRecord.qrCode ?? '';

        return CustomDialog(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        context.l10n.medicalQrCode,
                        style: AppStyles.styleBold20(context),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, color: Colors.grey),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Main Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary.withValues(alpha: 0.1),
                        AppColors.primary.withValues(alpha: 0.05),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        context.l10n.qrCodeNote,
                        textAlign: TextAlign.center,
                        style: AppStyles.styleRegular14(
                          context,
                        ).copyWith(color: AppColors.darkColor),
                      ),
                      const SizedBox(height: 20),

                      // QR Code Container
                      Container(
                        padding: const EdgeInsets.all(28),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            if (qrData.isNotEmpty)
                              BuildQrCode(qrData: qrData)
                            else
                              const Icon(
                                Icons.qr_code_2,
                                size: 150,
                                color: AppColors.primary,
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        context.l10n.patientCode,
                        style: AppStyles.styleRegular14(
                          context,
                        ).copyWith(color: AppColors.darkColor),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        displayRecord.id?.toString() ?? 'N/A',
                        style: AppStyles.styleBold24(
                          context,
                        ).copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Buttons
                Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: CustomButton(
                        content: state is GetSharedMedicalRecordLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    context.l10n.download,
                                    style: AppStyles.styleBold16(
                                      context,
                                    ).copyWith(color: Colors.white),
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(
                                    Icons.download_rounded,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                        onTap: () {
                          if (_fileUrl != null) {
                            launchUrlString(
                              _fileUrl!,
                              mode: LaunchMode.externalApplication,
                            );
                          } else if (displayRecord.qrCode != null) {
                            context.read<RecordBloc>().add(
                              GetSharedMedicalRecordEvent(
                                shareToken: displayRecord.qrCode!,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              context.l10n.share,
                              style: AppStyles.styleBold16(
                                context,
                              ).copyWith(color: AppColors.darkColor),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.share_outlined,
                              size: 20,
                              color: AppColors.darkColor,
                            ),
                          ],
                        ),
                        color: AppColors.greyButtonColor,
                        onTap: () {
                          if (_fileUrl != null) {
                            SharePlus.instance.share(
                              ShareParams(text: _fileUrl!),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Warning Box
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xffFEFCE8), // Light Yellow
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xffFFF085)),
                  ),
                  child: Text(
                    context.l10n.shareCodeWarning,
                    style: AppStyles.styleBold12(context).copyWith(
                      color: const Color(0xff894B00),
                    ), // Dark Orange/Yellow
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
