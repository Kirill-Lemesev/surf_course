import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/user_icon.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/medals.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/form_item.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/log_out_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with WidgetsBindingObserver {
  late String _appTheme;
  late String _systemBrightness; //Brightness.light
  late int _lightThemeScheme;
  late int _darkThemeScheme;

  @override
  void initState() {
    _loadTheme();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _appTheme = prefs.getString('appTheme') ?? 'system';
      _systemBrightness = prefs.getString('systemBrightness') ??
          SchedulerBinding.instance.platformDispatcher.platformBrightness
              .toString();
      _lightThemeScheme = prefs.getInt('lightThemeScheme') ?? 1;
      _darkThemeScheme = prefs.getInt('darkThemeScheme') ?? 1;
    });
  }

  Future<void> _setAppTheme(String value) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('appTheme', value);
      _appTheme = value;
    });
  }

  Future<void> _setSystemBrightness() async {
    var currentPlatformBrightness = SchedulerBinding
        .instance.platformDispatcher.platformBrightness
        .toString();
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('systemBrightness', currentPlatformBrightness);
      _systemBrightness = currentPlatformBrightness;
    });
  }

  Future<void> _setLightThemeScheme(int value) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setInt('lightThemeScheme', value);
      _lightThemeScheme = value;
    });
  }

  Future<void> _setDarkThemeScheme(int value) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setInt('lightThemeScheme', value);
      _darkThemeScheme = value;
    });
  }

  @override
  void didChangePlatformBrightness() {
    _setSystemBrightness();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

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
              itemName: AppStrings.formButtonText,
              itemData: AppStrings.systemTheme,
              showButton: true,
              //modalBottomSheet: ,
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
