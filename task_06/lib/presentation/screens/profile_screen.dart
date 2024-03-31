import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/user_icon.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/medals.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/form_item.dart';

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
            Text(
              AppStrings.myMedals,
              style: AppFonts.noStyle16,
            ),
            const MedalRow(),
            const SizedBox(height: 10,),
            FormItem(itemName: AppStrings.name, itemData: AppStrings.personName, showButton: false,),
            FormItem(itemName: AppStrings.email, itemData: AppStrings.personEmail, showButton: false,),
            FormItem(itemName: AppStrings.birthDate, itemData: AppStrings.personBirthDate, showButton: false,),
            FormItem(itemName: AppStrings.team, itemData: AppStrings.personTeam, showButton: true,),
            FormItem(itemName: AppStrings.position, itemData: AppStrings.personPosition, showButton: true,),
            FormItem(itemName: AppStrings.formButtonText, itemData: AppStrings.systemTheme, showButton: true,),
          ],
        ),
      ),
    );
  }
}
