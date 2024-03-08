import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';

class ChequeInfoRow extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final String amount;
  final TextStyle amountStyle;

  const ChequeInfoRow(
      {super.key,
      required this.title,
      required this.titleStyle,
      required this.amount,
      required this.amountStyle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(title, textAlign: TextAlign.start, style: titleStyle),
          const Expanded(
              child: SizedBox(
            height: 10,
          )),
          Text('$amount ${AppStrings.rub}',
              textAlign: TextAlign.end, style: amountStyle),
        ],
      ),
    );
  }
}
