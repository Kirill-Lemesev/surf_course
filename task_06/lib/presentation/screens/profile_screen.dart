import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/user_icon.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/medals.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/form_item.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/log_out_button.dart';
import 'package:surf_flutter_courses_template/presentation/screens/theme_bottom_sheet.dart';
import 'package:surf_flutter_courses_template/domain/theme.dart';

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
          leading: Icon(Icons.arrow_back,
              color: Theme.of(context).iconTheme.color,
              size: Theme.of(context).iconTheme.size),
          title: Text(AppStrings.profile,
              style: Theme.of(context).textTheme.titleMedium),
          centerTitle: true,
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text(
                  AppStrings.save,
                  style: Theme.of(context).textTheme.titleMedium,
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
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const MedalRow(),
            const SizedBox(
              height: 10,
            ),
            FormItem(
              itemName: AppStrings.name,
              itemData: AppStrings.personName,
              showButton: false,
            ),
            FormItem(
              itemName: AppStrings.email,
              itemData: AppStrings.personEmail,
              showButton: false,
            ),
            FormItem(
              itemName: AppStrings.birthDate,
              itemData: AppStrings.personBirthDate,
              showButton: false,
            ),
            FormItem(
              itemName: AppStrings.team,
              itemData: AppStrings.personTeam,
              showButton: true,
            ),
            FormItem(
              itemName: AppStrings.position,
              itemData: AppStrings.personPosition,
              showButton: true,
            ),
            FormItem(
              itemName: AppStrings.themeType,
              itemData: context.watch<AppTheme>().themeName,
              showButton: true,
              modalBottomSheet:
                  ThemeBottomSheet(theme: context.watch<AppTheme>().themeName),
            ),
            const Expanded(
                child: SizedBox(
              height: 10,
            )),
            const LogOutButton()
          ],
        ),
      ),
    );
  }
}
