import 'package:fahimak_ai/core/widgets/custom_app_bar.dart';
import 'package:fahimak_ai/features/settings/presentation/widgets/settings_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary10,
      appBar: CustomAppBar(title: 'الإعدادات'),
      body: const SettingsViewBody(),
    );
  }
}
