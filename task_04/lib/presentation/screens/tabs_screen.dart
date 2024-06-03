import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/presentation/screens/cheque_screen.dart';
import 'package:surf_flutter_courses_template/presentation/screens/empty_screen.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 3;

  final List<Widget> _screens = [
    const EmptyScreen(),
    const EmptyScreen(),
    const EmptyScreen(),
    const ChequeScreen(id: 54)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.white,
        unselectedItemColor: AppColors.gray,
        selectedItemColor: AppColors.lime,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined), label: AppStrings.catalog),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: AppStrings.search),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: AppStrings.basket),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity_sharp),
              label: AppStrings.personal),
        ],
      ),
    );
  }
}
