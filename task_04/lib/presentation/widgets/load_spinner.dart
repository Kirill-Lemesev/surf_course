import 'package:flutter/material.dart';
import '../../entity/app_data.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircularProgressIndicator(color: AppColors.lime,),
      ],
    );
  }
}
