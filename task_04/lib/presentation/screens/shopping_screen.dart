import 'package:flutter/material.dart';
import '../../entity/app_data.dart';
import '../widgets/shopping_list_body.dart';


class ShoppingScreen extends StatelessWidget {

  final checkNumber;
  final checkDateTime;

  const ShoppingScreen({required this.checkNumber, required this.checkDateTime, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
              color: AppColors.lime),
          title: Column(
              children: [
                Text(checkNumber, style:  AppTextStyle.boldBlack16Style),
                Text(checkDateTime, style: AppTextStyle.gray10Style,)
              ]),
        ),
        body: const ShoppingListBody(),
    );
  }
}