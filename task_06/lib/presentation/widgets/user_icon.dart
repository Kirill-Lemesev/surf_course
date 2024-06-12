import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_images.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SizedBox.square(
            dimension: 80,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    AppImages.user,
                  ),
                ),
                Center(
                  child: Text(
                    AppStrings.edit,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
