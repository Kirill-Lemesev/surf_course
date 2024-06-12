import 'package:flutter/material.dart';

class FormItem extends StatelessWidget {
  final String itemName;
  final String itemData;
  final bool showButton;
  final Widget? modalBottomSheet;

  const FormItem(
      {super.key,
      required this.itemName,
      required this.itemData,
      required this.showButton,
      this.modalBottomSheet});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        child: ElevatedButton(
            onPressed: (modalBottomSheet != null)
                ? () {
                    showModalBottomSheet(
                        backgroundColor:
                            Theme.of(context).bottomSheetTheme.backgroundColor,
                        context: context,
                        builder: (BuildContext context) {
                          return modalBottomSheet!;
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)));
                  }
                : () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(itemName,
                                style: Theme.of(context).textTheme.labelMedium),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(itemData,
                                style: Theme.of(context).textTheme.bodyMedium),
                          ],
                        ),
                      ]),
                  if (showButton) ...[
                    const Expanded(
                        child: SizedBox(
                      height: 10,
                    )),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Theme.of(context).iconTheme.color,
                      size: Theme.of(context).iconTheme.size,
                    )
                  ]
                ],
              ),
            )));
  }
}
