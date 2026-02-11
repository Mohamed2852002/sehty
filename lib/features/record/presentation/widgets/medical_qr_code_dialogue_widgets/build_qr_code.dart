import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/features/record/presentation/widgets/medical_qr_code_dialogue_widgets/build_qr_error_placeholder.dart';

class BuildQrCode extends StatelessWidget {
  const BuildQrCode({super.key, required this.qrData});
  final String qrData;
  @override
  Widget build(BuildContext context) {
    String qrTextToUse = qrData;
    if (qrData.length > 2800) {
      try {
        // Compress and encode as Base64
        final compressedBytes = zlib.encode(utf8.encode(qrData));
        qrTextToUse = base64Encode(compressedBytes);
      } catch (e) {
        return BuildQrErrorPlaceholder(message: context.l10n.qrCodeTooLarge);
      }
    }

    // Generate QR code
    return QrImageView(
      data: qrTextToUse,
      size: 200.0,
      errorStateBuilder: (context, error) =>
          const BuildQrErrorPlaceholder(message: ''),
    );
  }
}
