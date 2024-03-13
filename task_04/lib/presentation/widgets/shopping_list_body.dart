import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surf_flutter_courses_template/domain/entity/product_entity.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/shopping_list_title.dart';
import 'package:surf_flutter_courses_template/domain/entity/sort_types.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/product_list_item.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/category_title_list_item.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/cheque_title.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/cheque_info_row.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';

class ShoppingListBody extends StatefulWidget {
  final List shoppingList;
  const ShoppingListBody({super.key, required this.shoppingList});

  @override
  State<ShoppingListBody> createState() => _ShoppingListBodyState();
}

class _ShoppingListBodyState extends State<ShoppingListBody> {
  late Future<List<Widget>> _shoppingList;
  late int _productsCount;
  late String _sum;
  late int _discountSize;
  late String _discount;
  late String _finalSum;
  late SortType _sortType;

  @override
  void initState() {
    super.initState();
    _sortType = SortType.notSorted;
    _shoppingList = makeCategoryProductList(widget.shoppingList, _sortType);
    _productsCount = widget.shoppingList.length;
    _sum = numberFormatter(sumCounter(widget.shoppingList));
    _discountSize = discountSize(widget.shoppingList);
    _discount = numberFormatter(discountCounter(widget.shoppingList));
    _finalSum = numberFormatter(finalSum(widget.shoppingList));
  }

  double priceWithDiscount(ProductEntity x) =>
      x.price.toDouble() - (x.price * x.sale) / 100;

  String numberFormatter(double unformatedDigit) {
    var dividedDigit = unformatedDigit / 100;
    var formatter = NumberFormat('#,##0.00');
    var formattedDigit =
        formatter.format(dividedDigit).replaceAll(',', ' ').toString();
    return formattedDigit;
  }

  String howManyGoods(int numberOfGoods) => Intl.plural(numberOfGoods,
      one: AppStrings.oneItem, other: AppStrings.manyItems);

  int sortByPriceAsc(a, b) {
    final double aProperty =
        (a.sale == 0) ? a.price.toDouble() : priceWithDiscount(a);
    final double bProperty =
        (b.sale == 0) ? b.price.toDouble() : priceWithDiscount(b);

    if (aProperty < bProperty) {
      return -1;
    } else if (aProperty > bProperty) {
      return 1;
    } else {
      return 0;
    }
  }

  int sortByPriceDesc(a, b) {
    final double aProperty =
        (a.sale == 0) ? a.price.toDouble() : priceWithDiscount(a);
    final double bProperty =
        (b.sale == 0) ? b.price.toDouble() : priceWithDiscount(b);

    if (aProperty > bProperty) {
      return -1;
    } else if (aProperty < bProperty) {
      return 1;
    } else {
      return 0;
    }
  }

  List<Widget> makeProductItemList(List sortedList) {
    List<Widget> widgetList = [];

    for (var i in sortedList) {
      var price = numberFormatter(i.price.toDouble());
      var sale = (i.sale > 0) ? numberFormatter(priceWithDiscount(i)) : '0';
      widgetList.add(ProductItem(i.imageUrl, i.title, price, i.amount, sale));
    }

    return widgetList;
  }

  Future<List<Widget>> makeCategoryProductList(
      List nonSeparated, SortType sortType) {
    Map<String, List> categoryProducts = {};
    List<Widget> widgetList = [];

    if (sortType == SortType.byCategoryAsc) {
      nonSeparated.sort((a, b) => a.category.name.compareTo(b.category.name));
    } else if (sortType == SortType.byCategoryDesc) {
      nonSeparated.sort((b, a) => a.category.name.compareTo(b.category.name));
    }

    for (var e in nonSeparated) {
      if (categoryProducts.containsKey(e.category.name)) {
        categoryProducts[e.category.name]?.add(e);
      } else {
        categoryProducts[e.category.name] = [e];
      }
    }

    for (var e in categoryProducts.keys) {
      widgetList.add(CategoryTitleItem(e));
      if (sortType == SortType.byNameAsc) {
        categoryProducts[e]!.sort((a, b) => a.title.compareTo(b.title));
      } else if (sortType == SortType.byNameDesc) {
        categoryProducts[e]!.sort((b, a) => a.title.compareTo(b.title));
      } else if (sortType == SortType.byPriceAsc) {
        categoryProducts[e]!.sort(sortByPriceAsc);
      } else if (sortType == SortType.byPriceDesc) {
        categoryProducts[e]!.sort(sortByPriceDesc);
      }
      widgetList.addAll(makeProductItemList(categoryProducts[e]!));
      widgetList.add(const Divider());
    }

    return Future.delayed(const Duration(seconds: 5), () => widgetList);
  }

  double sumCounter(List productList) {
    double sum =
        productList.fold(0, (previousValue, e) => previousValue + (e.price));
    return sum;
  }

  double discountCounter(List productList) {
    double discount = productList.fold(0,
        (previousValue, e) => previousValue + e.price - priceWithDiscount(e));
    return discount;
  }

  int discountSize(List productList) {
    return ((discountCounter(productList) / sumCounter(productList)) * 100)
        .round();
  }

  double finalSum(List productList) {
    return sumCounter(productList) - discountCounter(productList);
  }


   void changeSort(sortType) {
     setState((){
        _sortType = sortType;
        _shoppingList = makeCategoryProductList(widget.shoppingList, _sortType);
      });
   }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ShoppingListTitle(_sortType, changeSort),
          Expanded(
              child: FutureBuilder(
            future: _shoppingList,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(
                    child: CircularProgressIndicator(color: AppColors.lime));
              }
              if (snapshot.hasData) {
                return ListView(children: snapshot.requireData);
              } else if (snapshot.hasError) {
                return const Text('Something went wrong');
              }
              return const Center(
                  child: CircularProgressIndicator(color: AppColors.lime));
            },
          )),
          const Divider(),
          const ChequeTitle(),
          ChequeInfoRow(
              title: '$_productsCount ${howManyGoods(_productsCount)}',
              titleStyle: AppTextStyle.noColor12Style,
              amount: _sum,
              amountStyle: AppTextStyle.boldBlack12Style),
          ChequeInfoRow(
              title: '${AppStrings.discount} $_discountSize%',
              titleStyle: AppTextStyle.noColor12Style,
              amount: '-$_discount',
              amountStyle: AppTextStyle.boldBlack12Style),
          ChequeInfoRow(
              title: AppStrings.sumWithDiscount,
              titleStyle: AppTextStyle.boldBlack16Style,
              amount: _finalSum,
              amountStyle: AppTextStyle.boldBlack16Style)
        ],
      ),
    );
  }
}
