import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';

class PetForm extends StatefulWidget {
  const PetForm({super.key});

  @override
  State<PetForm> createState() => _PetFormState();
}

class _PetFormState extends State<PetForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.backgroundGray);
  }
}
