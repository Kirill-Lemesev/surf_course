import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/shopping_list_body.dart';
import 'package:surf_flutter_courses_template/presentation/screens/empty_screen.dart';
import 'package:intl/intl.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';
import 'package:surf_flutter_courses_template/domain/entity/cheque_entity.dart';

class ChequeScreen extends StatefulWidget {
  final int id;
  const ChequeScreen({super.key, required this.id});

  @override
  State<ChequeScreen> createState() => _ChequeScreenState();
}

class _ChequeScreenState extends State<ChequeScreen> {
  late Future<ChequeEntity> _chequeEntity;

  @override
  void initState() {
    super.initState();
    _chequeEntity = getCheque(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: _chequeEntity,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
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
                  title: Column(children: [
                    Text('${AppStrings.chequeNumber} ${snapshot.data!.id}',
                        style: AppTextStyle.boldBlack16Style),
                    Text(
                      DateFormat('yy.MM.dd в hh:mm')
                          .format(snapshot.data!.date),
                      style: AppTextStyle.gray10Style,
                    )
                  ]),
                ),
                body: ShoppingListBody(
                  shoppingList: snapshot.data!.products,
                ),
              );
            } else if (snapshot.hasError) {
              return const EmptyScreen();
            }
            return const CircularProgressIndicator(color: AppColors.lime);
          }),
    );
  }
}
