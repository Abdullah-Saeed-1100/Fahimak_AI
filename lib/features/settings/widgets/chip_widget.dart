import 'package:fahimak_ai/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  final String name;
  final bool? isSelected;
  final VoidCallback? onTap;
  const ChipWidget({
    super.key,
    this.isSelected,
    required this.name,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isSelected == true ? AppColors.primary : null,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primary),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Text(
            name,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isSelected == true ? Colors.white : null,
              fontWeight: isSelected == true ? FontWeight.bold : null,
            ),
          ),
        ),
      ),
    );
  }
}

// class Majors {
//   final String name;
//   final VoidCallback onTap;
//   Majors({required this.name, required this.onTap});
// }
