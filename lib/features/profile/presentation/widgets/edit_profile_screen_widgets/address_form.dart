import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/core/utils/widgets/egypt_governorate_city_picker.dart';
import 'package:sehty/core/utils/widgets/icon_container.dart';

class AddressForm extends StatelessWidget {
  final TextEditingController governorateController;
  final TextEditingController districtController;

  const AddressForm({
    super.key,
    required this.governorateController,
    required this.districtController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        spacing: 16,
        children: [
          Row(
            spacing: 8,
            children: [
              IconContainer(
                child: SvgPicture.asset(AppAssets.iconsProfileAddressIcon),
              ),
              Text(
                context.l10n.address,
                style: AppStyles.styleBold16(
                  context,
                ).copyWith(color: AppColors.heavyBlueColor),
              ),
            ],
          ),
          EgyptGovernorateCityPicker(
            initialGovernorate: governorateController.text,
            initialCity: districtController.text,
            onGovernorateChanged: (val) =>
                governorateController.text = val ?? '',
            onCityChanged: (val) => districtController.text = val ?? '',
          ),
        ],
      ),
    );
  }
}
