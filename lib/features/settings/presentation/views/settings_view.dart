import 'package:fahimak_ai/core/extensions/app_extensions.dart';
import 'package:fahimak_ai/core/widgets/custom_app_bar.dart';
import 'package:fahimak_ai/features/settings/presentation/widgets/settings_view_body.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: CustomAppBar(title: 'الإعدادات'),
      body: const SettingsViewBody(),
    );
  }
}
