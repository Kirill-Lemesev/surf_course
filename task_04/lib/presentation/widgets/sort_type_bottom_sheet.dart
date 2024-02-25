import 'package:flutter/material.dart';
import '../../entity/app_data.dart';
import '../../entity/sort_types.dart';
import 'radio_button.dart';

class SortTypeBottomSheet extends StatelessWidget {

  SortType sortType;
  Function sortFunction;

  SortTypeBottomSheet(this.sortType, this.sortFunction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: FractionallySizedBox(
          heightFactor: 0.8,
          child: Column(
            children: [
              Row(
                children: [
                  const Text(AppStrings.sortTypeBottomSheetTitle, style: AppTextStyle.boldBlack24Style),
                  const Expanded(child: SizedBox(width: 10),),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              CustomLabeledRadio(
                chosenSortType: sortType,
                itemSortType: SortType.notSorted,
                label: AppStrings.notSorted,
                sortFunction: sortFunction,
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(AppStrings.nameSortTitle, style: AppTextStyle.gray10Style,
                    )
                  ],),
              ),
              CustomLabeledRadio(
                chosenSortType: sortType,
                itemSortType: SortType.byNameAsc,
                label: AppStrings.byNameAsc,
                sortFunction: sortFunction,
              ),
              CustomLabeledRadio(
                chosenSortType: sortType,
                itemSortType: SortType.byNameDesc,
                label: AppStrings.byNameDesc,
                sortFunction: sortFunction,
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(AppStrings.priceSortTitle, style: AppTextStyle.gray10Style),
                  ],
                ),
              ),
              CustomLabeledRadio(
                chosenSortType: sortType,
                itemSortType: SortType.byPriceAsc,
                label: AppStrings.byPriceAsc,
                sortFunction: sortFunction,
              ),
              CustomLabeledRadio(
                chosenSortType: sortType,
                itemSortType: SortType.byPriceDesc,
                label: AppStrings.byPriceDesc,
                sortFunction: sortFunction,
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(AppStrings.categorySortTitle, style: AppTextStyle.gray10Style),
                  ],
                ),
              ),
              CustomLabeledRadio(
                chosenSortType: sortType,
                itemSortType: SortType.byCategoryAsc,
                label: AppStrings.byTypeAsc,
                sortFunction: sortFunction,
              ),
              CustomLabeledRadio(
                chosenSortType: sortType,
                itemSortType: SortType.byCategoryDesc,
                label: AppStrings.byTypeDesc,
                sortFunction: sortFunction,
              ),
              const SizedBox(height: 30,),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style:ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lime
                        ),
                        child: const Text(AppStrings.sortTypeBottomSheetButton, style: AppTextStyle.whiteStyle,),
                      )
                  )
                ],
              )
            ],
          ),
        )
      );
  }
}