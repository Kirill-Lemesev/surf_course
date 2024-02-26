import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:surf_flutter_courses_template/entity/app_data.dart';
import '../../entity/sort_types.dart';
import 'sort_type_bottom_sheet.dart';


class ShoppingListTitle extends StatelessWidget {

  final SortType sortType;
  final Function sortFunction;

  const ShoppingListTitle(this.sortType, this.sortFunction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Text(AppStrings.shoppingListTitle, style: AppTextStyle.boldBlack18Style,
      ),
      const Expanded(
          child: SizedBox(width: 10,)
      ),
      Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          color: AppColors.brightGray,
          borderRadius: BorderRadius.circular(5),
        ),
        child: badges.Badge(
          showBadge:  sortType != SortType.notSorted ? true : false,
          position: badges.BadgePosition.bottomEnd(bottom: 3, end: 3),
          badgeStyle: const badges.BadgeStyle(badgeColor: AppColors.lime),
          child: IconButton(
              icon: const Icon(Icons.sort),
              padding: const EdgeInsets.all(5.0),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                    builder: (BuildContext context) {
                      return SortTypeBottomSheet(sortType, sortFunction);
                    });
              }),
        ),
      )
    ]
    );
  }
}