import 'package:flutter/material.dart';
import 'package:sehty/features/record/presentation/widgets/medical_records_list_widgets/share_tip_card.dart';

class MedicalRecordListView extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;

  const MedicalRecordListView({
    super.key,
    required this.children,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...children.map(
          (child) =>
              Padding(padding: const EdgeInsets.only(bottom: 16), child: child),
        ),
        const ShareTipCard(),
        const SizedBox(height: 40),
      ],
    );
  }
}
