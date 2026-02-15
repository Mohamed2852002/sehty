import 'package:flutter/material.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/widgets/notification_bottom_sheet_widgets/bottom_sheet_footer.dart';
import 'package:sehty/core/utils/widgets/notification_bottom_sheet_widgets/bottom_sheet_header.dart';
import 'package:sehty/core/utils/widgets/notification_bottom_sheet_widgets/notification_item.dart';

class NotificationBottomSheet extends StatelessWidget {
  const NotificationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.65,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BottomSheetHeader(),
            const Divider(height: 1),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  NotificationItem(
                    title: context.l10n.medicationTime,
                    subtitle: 'معاد دواء أملوديبين - 08:00 م',
                    time: context.l10n.minutesAgo,
                    iconData: Icons.link,
                    iconColor: Colors.blue,
                    iconBgColor: Colors.blue.withValues(alpha: 0.1),
                    isUnread: true,
                  ),
                  NotificationItem(
                    title: context.l10n.familyTrackingRequest,
                    subtitle: 'أحمد (أخ) يريد الاطمئنان عليك',
                    time: context.l10n.hourAgo,
                    iconData: Icons.person_add_alt_1_outlined,
                    iconColor: Colors.green,
                    iconBgColor: Colors.green.withValues(alpha: 0.1),
                    isUnread: true,
                    showButtons: true,
                  ),
                  NotificationItem(
                    title: context.l10n.medicationConfirmed,
                    subtitle: 'تم تأكيد تناول دواء ميتفورمين - 12:00 م',
                    time: context.l10n.hoursAgo,
                    iconData: Icons.check_circle_outline,
                    iconColor: Colors.green,
                    iconBgColor: Colors.green.withValues(alpha: 0.1),
                  ),
                  NotificationItem(
                    title: context.l10n.medicationRemind,
                    subtitle: 'لم تقم بتأكيد دواء أسبرين - 08:00 ص',
                    time: context.l10n.threeHoursAgo,
                    iconData: Icons.access_time,
                    iconColor: Colors.red,
                    iconBgColor: Colors.red.withValues(alpha: 0.1),
                  ),
                  NotificationItem(
                    title: context.l10n.medicalFileAdded,
                    subtitle: context.l10n.bloodSugarUploaded,
                    time: context.l10n.yesterday,
                    iconData: Icons.description_outlined,
                    iconColor: Colors.blue.shade300,
                    iconBgColor: Colors.blue.withValues(alpha: 0.1),
                  ),
                  NotificationItem(
                    title: context.l10n.invitationAccepted,
                    subtitle: 'سارة (أخت) قبلت دعوة المتابعة العائلية',
                    time: context.l10n.twoDaysAgo,
                    iconData: Icons.person_add_alt_1_outlined,
                    iconColor: Colors.green,
                    iconBgColor: Colors.green.withValues(alpha: 0.1),
                  ),
                ],
              ),
            ),
            const BottomSheetFooter(),
          ],
        ),
      ),
    );
  }
}
