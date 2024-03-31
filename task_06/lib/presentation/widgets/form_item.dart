import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';

class FormItem extends StatelessWidget {
  final String itemName;
  final String itemData;
  final bool showButton;
  final Function? buttonFunc;

  const FormItem(
      {super.key,
      this.buttonFunc,
      required this.itemName,
      required this.itemData,
      required this.showButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          onPressed: (buttonFunc == null) ? () {} : buttonFunc!(),
          child: (showButton)
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(itemName, style: AppFonts.noStyle16),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(itemData, style: AppFonts.noStyle16),
                              ],
                            ),
                          ]),
                      const Expanded(
                          child: SizedBox(
                        height: 10,
                      )),
                      const Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 16,
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  itemName,
                                  style: AppFonts.noStyle16,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(itemData, style: AppFonts.noStyle16),
                              ],
                            ),
                          ]),
                    ],
                  ),
                )),
    );
  }
}
