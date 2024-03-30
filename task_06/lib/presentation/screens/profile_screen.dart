import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/user_icon.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/medals.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_outlined),
          title: Text(
            AppStrings.profile,
            style: AppFonts.bold18Style,
          ),
          centerTitle: true,
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text(
                  AppStrings.save,
                  style: AppFonts.noStyle16,
                ),
              ),
            ),
          ],
          elevation: 0,
        ),
        body: Column(
          children: [
            const UserIcon(),
            Text(AppStrings.myMedals, style: AppFonts.noStyle16,),
            const MedalRow()

          ],
        ),
      ),
    );
  }
}
