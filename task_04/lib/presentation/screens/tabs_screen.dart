import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/presentation/screens/shopping_screen.dart';
import 'empty_screen.dart';
import '../../entity/app_data.dart';
import '../../data/repository/shopping_list_repository.dart';

final shoppingListRepository = ShoppingListRepository();

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const EmptyScreen(),
    const EmptyScreen(),
    const EmptyScreen(),
    ShoppingScreen(checkNumber: shoppingListRepository.checkNumberInfo, checkDateTime: shoppingListRepository.checkDateTime)
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
              icon: Icon(Icons.article_outlined),
              label: AppStrings.catalog
            ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: AppStrings.search
            ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                label: AppStrings.basket
            ),
              BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity_sharp),
                label: AppStrings.personal
            ),
          ],
        ),
      );
  }
}
