import 'package:fahimak_ai/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  final ChipWidgetInput chipWidgetInput;
  const ChipWidget({super.key, required this.chipWidgetInput});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: chipWidgetInput.onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: chipWidgetInput.isSelected == true ? AppColors.primary : null,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primary),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Text(
            chipWidgetInput.name,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: chipWidgetInput.isSelected == true ? Colors.white : null,
              fontWeight:
                  chipWidgetInput.isSelected == true ? FontWeight.bold : null,
            ),
          ),
        ),
      ),
    );
  }
}

class ChipWidgetInput {
  final String name;
  final bool? isSelected;
  final VoidCallback? onTap;
  const ChipWidgetInput({
    this.isSelected = false,
    required this.name,
    this.onTap,
  });
}

class CustomAnimatedForChipWidget extends StatelessWidget {
  final ChipWidgetInput chipWidgetInput;
  const CustomAnimatedForChipWidget({super.key, required this.chipWidgetInput});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: ChipWidget(chipWidgetInput: chipWidgetInput),
      secondChild: ChipWidget(chipWidgetInput: chipWidgetInput),
      crossFadeState:
          chipWidgetInput.isSelected!
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 300),
    );
  }
}
