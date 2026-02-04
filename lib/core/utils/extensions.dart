import 'package:flutter/material.dart';
import 'package:sehty/generated/l10n.dart';

extension L10n on BuildContext {
  S get l10n => S.of(this);
}
