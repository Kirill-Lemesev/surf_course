import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/presentation/screens/profile_screen.dart';
import 'domain/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var controller = AppTheme();
  await controller.loadTheme();
  return runApp(MainApp(themeNotifier: controller));
}

class MainApp extends StatelessWidget {
  final AppTheme themeNotifier;

  const MainApp({super.key, required this.themeNotifier});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => themeNotifier,
        child: Consumer<AppTheme>(builder: (context, AppTheme notifier, child) {
          return MaterialApp(
            home: const ProfileScreen(),
            themeMode: notifier.themeMode,
            theme: notifier.brightTheme,
            darkTheme: notifier.darkTheme,
          );
        }));
  }
}
