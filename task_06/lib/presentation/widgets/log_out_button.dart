import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: OutlinedButton(
        style: Theme.of(context).outlinedButtonTheme.style,
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(AppStrings.logOut)]),
        ),
      ),
    );
  }
}
