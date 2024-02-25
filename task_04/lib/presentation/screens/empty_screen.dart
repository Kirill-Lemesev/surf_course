import 'package:flutter/material.dart';
import '../../entity/app_data.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: AppColors.white,
      child: Center(
          child: Text(AppStrings.emptyText, style: AppTextStyle.noColor18Style)
      ),
    );
  }
}