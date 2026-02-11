import 'package:flutter/material.dart';

class MedicalRecordTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  MedicalRecordTabBarDelegate({required this.child});

  @override
  double get minExtent => 72;

  @override
  double get maxExtent => 72;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(MedicalRecordTabBarDelegate oldDelegate) {
    return false;
  }
}
