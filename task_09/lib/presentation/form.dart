import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_text.dart';
import 'package:surf_flutter_courses_template/assets/animal_types.dart';
import 'radio_button.dart';

class PetForm extends StatefulWidget {
  const PetForm({super.key});

  @override
  State<PetForm> createState() => _PetFormState();
}

class _PetFormState extends State<PetForm> {
  Animal _petFormState = Animal.dog;

  _changePetFormState(Animal animal) {
    setState(() {
      _petFormState = animal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundGray,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PetRadioButton(
                    image: 'assets/dog.png',
                    value: Animal.dog,
                    groupValue: _petFormState,
                    onChanged: _changePetFormState,
                    buttonName: AppText.dog,
                  ),
                  PetRadioButton(
                    image: 'assets/cat.png',
                    value: Animal.cat,
                    groupValue: _petFormState,
                    onChanged: _changePetFormState,
                    buttonName: AppText.cat,
                  ),
                  PetRadioButton(
                    image: 'assets/parrot.png',
                    value: Animal.parrot,
                    groupValue: _petFormState,
                    onChanged: _changePetFormState,
                    buttonName: AppText.parrot,
                  ),
                  PetRadioButton(
                    image: 'assets/hamster.png',
                    value: Animal.hamster,
                    groupValue: _petFormState,
                    onChanged: _changePetFormState,
                    buttonName: AppText.hamster,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
