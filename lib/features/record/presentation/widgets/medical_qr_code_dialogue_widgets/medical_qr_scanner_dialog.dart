// import 'package:flutter/material.dart';
// import 'package:sehty/core/utils/extensions.dart';
// import 'package:sehty/core/utils/app_styles.dart';
// import 'package:sehty/core/utils/widgets/custom_dialog.dart';
// import 'package:sehty/core/themes/app_colors.dart';

// class MedicalQrScannerDialog extends StatelessWidget {
//   const MedicalQrScannerDialog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CustomDialog(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   context.l10n.scanQrCode,
//                   style: AppStyles.styleBold20(context),
//                 ),
//               ),
//               IconButton(
//                 onPressed: () => Navigator.pop(context),
//                 icon: const Icon(Icons.close, color: Colors.grey),
//                 padding: EdgeInsets.zero,
//               ),
//             ],
//           ),
//           const SizedBox(height: 24),
//           Container(
//             height: 300,
//             decoration: BoxDecoration(
//               color: Colors.black,
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: const Center(
//               child: Icon(Icons.qr_code_scanner, color: Colors.white, size: 64),
//             ),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             context.l10n.placeQrCodeInFrame,
//             textAlign: TextAlign.center,
//             style: AppStyles.styleRegular14(
//               context,
//             ).copyWith(color: AppColors.darkColor),
//           ),
//         ],
//       ),
//     );
//   }
// }
