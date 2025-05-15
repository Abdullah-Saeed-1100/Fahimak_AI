import 'package:fahimak_ai/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../../features/chat_ai/views/chat_ai_view.dart';
import '../../features/settings/views/settings_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _currentIndex = 0;

  // List of taps, defined here so we can access widget properties
  final List<Widget> taps = [ChatAiView(), const SettingsView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: taps),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  NavigationBar _buildNavigationBar() {
    return NavigationBar(
      indicatorColor: AppColors.primary,
      onDestinationSelected: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      selectedIndex: _currentIndex,
      backgroundColor: Colors.white,

      // context.isDarkMode
      //     ? AppColors.backgroundColorDark
      //     : AppColors.backgroundColorLight,
      labelTextStyle: WidgetStateProperty.all(
        // TextStyle(fontSize: 14, fontFamily: "Kufam", color: Colors.black),
        Theme.of(context).textTheme.bodyLarge,
      ),
      destinations: [
        NavigationDestination(
          icon:
              _currentIndex == 0
                  ? const Icon(Icons.home, color: AppColors.primary50)
                  : const Icon(Icons.home, color: AppColors.primary),
          // _currentIndex == 0
          //     ? const Icon(IconlyBold.home, color: AppColors.iconColor)
          //     : const Icon(IconlyBroken.home),
          label: "المحادثة",
        ),
        NavigationDestination(
          icon:
              _currentIndex == 1
                  ? const Icon(Icons.settings, color: AppColors.primary50)
                  : const Icon(Icons.settings, color: AppColors.primary),
          // _currentIndex == 1
          //     ? const Icon(IconlyBold.user_3, color: AppColors.iconColor)
          //     : const Icon(IconlyBroken.user_3),
          label: "الإعدادات",
        ),
      ],
    );
  }
}
