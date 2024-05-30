import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/domain/theme.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/done_button.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/bright_scheme_button.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/dark_scheme_button.dart';

class ThemeBottomSheet extends StatefulWidget {
  final String theme;

  const ThemeBottomSheet({super.key, required this.theme});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  late String _theme;

  @override
  void initState() {
    _theme = widget.theme;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              children: [
                Text(
                  AppStrings.themeType,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                    color: Theme.of(context).iconTheme.color)
              ],
            ),
          ),
          ListTile(
              title: const Text(AppStrings.systemTheme),
              leading: Radio(
                value: AppStrings.systemTheme,
                groupValue: _theme,
                onChanged: (String? value) {
                  setState(() {
                    _theme = value!;
                    context.read<AppTheme>().setAppTheme(value);
                  });
                },
              )),
          if (_theme == AppStrings.brightTheme) ...[
            ListTile(
                title: const Text(AppStrings.brightTheme),
                leading: Radio(
                  value: AppStrings.brightTheme,
                  groupValue: _theme,
                  onChanged: (String? value) {
                    setState(() {
                      _theme = value!;
                      context.read<AppTheme>().setAppTheme(value);
                    });
                  },
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: Row(
                children: [
                  Text(
                    AppStrings.colorTheme,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BrightSchemeButton(
                    buttonId: 1,
                    schemeId: context.watch<AppTheme>().brightThemeScheme,
                    schemeImage: const Image(
                        image: AssetImage('assets/app_icons/green.png')),
                    buttonText: AppStrings.colorThemeOne,
                  ),
                  BrightSchemeButton(
                    buttonId: 2,
                    schemeId: context.watch<AppTheme>().brightThemeScheme,
                    schemeImage: const Image(
                        image: AssetImage('assets/app_icons/blue.png')),
                    buttonText: AppStrings.colorThemeTwo,
                  ),
                  BrightSchemeButton(
                    buttonId: 3,
                    schemeId: context.watch<AppTheme>().brightThemeScheme,
                    schemeImage: const Image(
                        image: AssetImage('assets/app_icons/orange.png')),
                    buttonText: AppStrings.colorThemeThree,
                  )
                ],
              ),
            )
          ] else
            ListTile(
                title: const Text(AppStrings.brightTheme),
                leading: Radio(
                  value: AppStrings.brightTheme,
                  groupValue: _theme,
                  onChanged: (String? value) {
                    setState(() {
                      _theme = value!;
                      context.read<AppTheme>().setAppTheme(value);
                    });
                  },
                )),
          if (_theme == AppStrings.darkTheme) ...[
            ListTile(
                title: const Text(AppStrings.darkTheme),
                leading: Radio(
                  value: AppStrings.darkTheme,
                  groupValue: _theme,
                  onChanged: (String? value) {
                    setState(() {
                      _theme = value!;
                      context.read<AppTheme>().setAppTheme(value);
                    });
                  },
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: Row(
                children: [
                  Text(
                    AppStrings.colorTheme,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DarkSchemeButton(
                    buttonId: 1,
                    schemeId: context.watch<AppTheme>().darkThemeScheme,
                    schemeImage: const Image(
                        image: AssetImage('assets/app_icons/green.png')),
                    buttonText: AppStrings.colorThemeOne,
                  ),
                  DarkSchemeButton(
                    buttonId: 2,
                    schemeId: context.watch<AppTheme>().darkThemeScheme,
                    schemeImage: const Image(
                        image: AssetImage('assets/app_icons/blue.png')),
                    buttonText: AppStrings.colorThemeTwo,
                  ),
                  DarkSchemeButton(
                    buttonId: 3,
                    schemeId: context.watch<AppTheme>().darkThemeScheme,
                    schemeImage: const Image(
                        image: AssetImage('assets/app_icons/orange.png')),
                    buttonText: AppStrings.colorThemeThree,
                  )
                ],
              ),
            )
          ] else
            ListTile(
                title: const Text(AppStrings.darkTheme),
                leading: Radio(
                  value: AppStrings.darkTheme,
                  groupValue: _theme,
                  onChanged: (String? value) {
                    setState(() {
                      _theme = value!;
                      context.read<AppTheme>().setAppTheme(value);
                    });
                  },
                )),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: DoneButton(),
          )
        ],
      ),
    );
  }
}
