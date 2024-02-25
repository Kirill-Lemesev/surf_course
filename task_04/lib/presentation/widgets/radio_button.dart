import 'package:flutter/material.dart';
import '../../entity/sort_types.dart';
import '../../entity/app_data.dart';


class _CustomFilledRadioIcon extends StatelessWidget {

  const _CustomFilledRadioIcon();

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        SizedBox.square(
          dimension: 20,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.lime,
              shape: BoxShape.circle,
            ),
          ),
        ),
        SizedBox.square(
          dimension: 6,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        )
      ],
    );
  }
}

class CustomLabeledRadio extends StatelessWidget {

  SortType chosenSortType;
  final SortType itemSortType;
  final String label;
  final Function sortFunction;

  CustomLabeledRadio(
      {
        required this.chosenSortType,
        required this.itemSortType,
        required this.label,
        required this.sortFunction,
        super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        chosenSortType = itemSortType;
        sortFunction(chosenSortType);
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            (itemSortType == chosenSortType)
                ? const _CustomFilledRadioIcon()
                : const Icon(Icons.radio_button_off, color: AppColors.gray, size: 20),
            const SizedBox(width: 20),
            Text(label, style: AppTextStyle.noColor16Style,
            )
          ],
        ),
      ),
    );
  }
}