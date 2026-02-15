import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/features/record/presentation/bloc/record_bloc.dart';

class ErrorRecordWidget extends StatelessWidget {
  final String message;
  const ErrorRecordWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 48),
          Text(message, textAlign: TextAlign.center),
          TextButton.icon(
            onPressed: () {
              context.read<RecordBloc>().add(GetMedicalRecordsEvent());
            },
            icon: const Icon(Icons.refresh),
            label: Text(context.l10n.retry),
          ),
        ],
      ),
    );
  }
}
