import 'package:fahimak_ai/features/settings/widgets/settings_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/utils/app_colors.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary10,
      appBar: AppBar(
        backgroundColor: AppColors.primary15,
        // backgroundColor: AppColors.primaryDark,
        // backgroundColor: Colors.white,
        // foregroundColor: AppColors.primary10,
        // elevation: 0,
        scrolledUnderElevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Center(
          child: Text(
            'الإعدادات',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        centerTitle: true,
      ),
      body: const SettingsViewBody(),
    );
  }
}
