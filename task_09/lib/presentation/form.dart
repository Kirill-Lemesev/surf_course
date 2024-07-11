import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';
import 'package:surf_flutter_courses_template/assets/app_text.dart';
import 'package:surf_flutter_courses_template/assets/animal_types.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/vaccine_checkbox.dart';
import 'widgets/radio_button.dart';
import 'package:intl/intl.dart';

class PetForm extends StatefulWidget {
  const PetForm({super.key});

  @override
  State<PetForm> createState() => _PetFormState();
}

class _PetFormState extends State<PetForm> {
  Animal _petFormState = Animal.dog;
  final _petFormKey = GlobalKey<FormState>();
  bool _petNameError = false;
  final TextEditingController _date = TextEditingController();
  bool _petDateError = false;
  final TextEditingController _vaccineDate = TextEditingController();
  bool _vaccineDateError = false;
  bool _petWeightError = false;
  bool _mailError = false;
  bool _isRage = false;
  bool _isCovid = false;
  bool _isMalaria = false;
  bool _isLoading = false;

  @override
  void initState() {
    _date.text = '';
    super.initState();
  }

  void _changePetFormState(Animal animal) {
    setState(() {
      _petFormState = animal;
    });
  }

  void _rageSwitcher() {
    setState(() {
      _isRage = !_isRage;
    });
  }

  void _covidSwitcher() {
    setState(() {
      _isCovid = !_isCovid;
    });
  }

  void _malariaSwitcher() {
    setState(() {
      _isMalaria = !_isMalaria;
    });
  }

  Future<void> _loadingData() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2), () {});

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundGray,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
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
                    state: _isLoading,
                  ),
                  PetRadioButton(
                    image: 'assets/cat.png',
                    value: Animal.cat,
                    groupValue: _petFormState,
                    onChanged: _changePetFormState,
                    buttonName: AppText.cat,
                    state: _isLoading,
                  ),
                  PetRadioButton(
                    image: 'assets/parrot.png',
                    value: Animal.parrot,
                    groupValue: _petFormState,
                    onChanged: _changePetFormState,
                    buttonName: AppText.parrot,
                    state: _isLoading,
                  ),
                  PetRadioButton(
                    image: 'assets/hamster.png',
                    value: Animal.hamster,
                    groupValue: _petFormState,
                    onChanged: _changePetFormState,
                    buttonName: AppText.hamster,
                    state: _isLoading,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Form(
                  key: _petFormKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: TextFormField(
                            readOnly: (_isLoading) ? true : false,
                            style: (_petNameError)
                                ? AppFonts.redTextSize16
                                : AppFonts.blackTextSize16,
                            validator: (value) {
                              var cleanValue = value!.trim();
                              if (cleanValue.isEmpty ||
                                  cleanValue.length < 3 ||
                                  cleanValue.length > 20) {
                                setState(() {
                                  _petNameError = true;
                                });
                                return AppText.petNameError;
                              }
                              setState(() {
                                _petNameError = false;
                              });
                              return null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        width: 0, style: BorderStyle.none)),
                                filled: true,
                                fillColor: AppColors.white,
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        width: 0, style: BorderStyle.none)),
                                labelText: AppText.petName,
                                labelStyle: (_petNameError)
                                    ? AppFonts.redTextSize16
                                    : AppFonts.grayTextSize16,
                                errorStyle: AppFonts.redTextSize12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: TextFormField(
                            readOnly: (_isLoading) ? true : false,
                            controller: _date,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context, //context of current state
                                  initialDate: DateTime.now()
                                      .subtract(const Duration(days: 1)),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime.now()
                                      .subtract(const Duration(days: 1)));
                              if (pickedDate != null) {
                                setState(() {
                                  _date.text = DateFormat('dd-MM-yyyy')
                                      .format(pickedDate);
                                });
                              }
                            },
                            style: (_petDateError)
                                ? AppFonts.redTextSize16
                                : AppFonts.blackTextSize16,
                            validator: (value) {
                              if (value!.isEmpty) {
                                setState(() {
                                  _petDateError = true;
                                });
                                return AppText.dateError;
                              } else {
                                setState(() {
                                  _petDateError = false;
                                });
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        width: 0, style: BorderStyle.none)),
                                filled: true,
                                fillColor: AppColors.white,
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        width: 0, style: BorderStyle.none)),
                                labelText: AppText.birthDate,
                                labelStyle: (_petDateError)
                                    ? AppFonts.redTextSize16
                                    : AppFonts.grayTextSize16,
                                errorStyle: AppFonts.redTextSize12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: TextFormField(
                            readOnly: (_isLoading) ? true : false,
                            keyboardType: TextInputType.number,
                            style: (_petWeightError)
                                ? AppFonts.redTextSize16
                                : AppFonts.blackTextSize16,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  double.parse(value) == 0) {
                                setState(() {
                                  _petWeightError = true;
                                });
                                return AppText.petWeightError;
                              }
                              setState(() {
                                _petWeightError = false;
                              });
                              return null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        width: 0, style: BorderStyle.none)),
                                filled: true,
                                fillColor: AppColors.white,
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        width: 0, style: BorderStyle.none)),
                                labelText: AppText.petWeight,
                                labelStyle: (_petWeightError)
                                    ? AppFonts.redTextSize16
                                    : AppFonts.grayTextSize16,
                                errorStyle: AppFonts.redTextSize12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: TextFormField(
                            readOnly: (_isLoading) ? true : false,
                            style: (_mailError)
                                ? AppFonts.redTextSize16
                                : AppFonts.blackTextSize16,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !value.contains("@")) {
                                setState(() {
                                  _mailError = true;
                                });
                                return AppText.ownerMailError;
                              }
                              setState(() {
                                _mailError = false;
                              });
                              return null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        width: 0, style: BorderStyle.none)),
                                filled: true,
                                fillColor: AppColors.white,
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        width: 0, style: BorderStyle.none)),
                                labelText: AppText.ownerMail,
                                labelStyle: (_mailError)
                                    ? AppFonts.redTextSize16
                                    : AppFonts.grayTextSize16,
                                errorStyle: AppFonts.redTextSize12),
                          ),
                        ),
                        if (_petFormState == Animal.dog ||
                            _petFormState == Animal.cat) ...[
                          const SizedBox(height: 10),
                          const Text(
                            AppText.vaccinations,
                            style: AppFonts.blueTextSize24,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: VaccineCheckbox(
                              _isRage,
                              AppText.rage,
                              _rageSwitcher,
                              state: _isLoading,
                            ),
                          ),
                          if (_isRage) ...[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: TextFormField(
                                readOnly: (_isLoading) ? true : false,
                                controller: _vaccineDate,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context:
                                          context, //context of current state
                                      initialDate: DateTime.now()
                                          .subtract(const Duration(days: 1)),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime.now()
                                          .subtract(const Duration(days: 1)));
                                  if (pickedDate != null) {
                                    setState(() {
                                      _vaccineDate.text =
                                          DateFormat('dd-MM-yyyy')
                                              .format(pickedDate);
                                    });
                                  }
                                },
                                style: (_vaccineDateError)
                                    ? AppFonts.redTextSize16
                                    : AppFonts.blackTextSize16,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    setState(() {
                                      _vaccineDateError = true;
                                    });
                                    return AppText.dateError;
                                  } else {
                                    setState(() {
                                      _vaccineDateError = false;
                                    });
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            width: 0, style: BorderStyle.none)),
                                    filled: true,
                                    fillColor: AppColors.white,
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            width: 0, style: BorderStyle.none)),
                                    labelText: AppText.rageVaccinations,
                                    labelStyle: (_vaccineDateError)
                                        ? AppFonts.redTextSize16
                                        : AppFonts.grayTextSize16,
                                    errorStyle: AppFonts.redTextSize12),
                              ),
                            )
                          ],
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: VaccineCheckbox(
                              _isCovid,
                              AppText.covid,
                              _covidSwitcher,
                              state: _isLoading,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: VaccineCheckbox(
                              _isMalaria,
                              AppText.malaria,
                              _malariaSwitcher,
                              state: _isLoading,
                            ),
                          ),
                        ],
                        const Expanded(
                            child: SizedBox(
                          width: 10,
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                minimumSize: const Size(double.infinity, 56),
                                backgroundColor: AppColors.pink,
                              ),
                              onPressed: () {
                                if (_petFormKey.currentState!.validate()) {
                                  _loadingData();
                                }
                              },
                              child: (_isLoading)
                                  ? const CircularProgressIndicator(
                                      color: AppColors.white,
                                    )
                                  : const Text(AppText.button,
                                      style: AppFonts.whiteTextSize18)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
