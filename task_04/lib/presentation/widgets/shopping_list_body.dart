import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/shopping_list_title.dart';
import '../../data/repository/shopping_list_repository.dart';
import '../../entity/sort_types.dart';
import '../../entity/app_data.dart';
import 'product_list_item.dart';
import 'category_title_list_item.dart';



final shoppingListRepository = ShoppingListRepository();

class ShoppingListBody extends StatefulWidget {
  const ShoppingListBody ({super.key});

  @override
  State<ShoppingListBody > createState() => _ShoppingListBodyState();
}

class _ShoppingListBodyState extends State<ShoppingListBody> {
  late List<Widget> _shoppingList;
  late int _productsCount;
  late String _sum;
  late int _discountSize;
  late String _discount;
  late String _finalSum;
  late SortType _sortType;
  late bool _loading;

  @override
  void initState() {
    super.initState();
    _shoppingList = makeCategoryProductList(shoppingListRepository.shoppingList);
    _productsCount = shoppingListRepository.shoppingList.length;
    _sum = numberFormatter(sumCounter(shoppingListRepository.shoppingList));
    _discountSize = discountSize(shoppingListRepository.shoppingList);
    _discount = numberFormatter(discountCounter(shoppingListRepository.shoppingList));
    _finalSum = numberFormatter(finalSum(shoppingListRepository.shoppingList));
    _sortType = SortType.notSorted;
    _loading = false;

  }

  void switchSpinner () {
    setState(() {
      _loading != _loading;
    });
  }


  String numberFormatter(int unformatedDigit) {
    var formatter = NumberFormat('#,###');
    var formattedDigit = unformatedDigit >= 1000
        ? formatter.format(unformatedDigit).replaceAll(',', ' ')
        : unformatedDigit.toString();
    return formattedDigit;
  }


  String howManyGoods(int numberOfGoods) => Intl.plural(
      numberOfGoods,
      one: 'товар',
      other:'товаров'
  );


  List<Widget> makeProductItemList (List sortedList) {

    List<Widget> widgetList = [];

    for (var i in sortedList) {
      var price = numberFormatter((i.price / 100).toInt());
      var sale = (i.sale > 0) ? numberFormatter(((i.price ~/ 100) * ((100 - i.sale) / 100)).toInt()) : '0';
      widgetList.add(ProductItem(i.imageUrl,i.title, price, i.amount, sale));
    }

    return widgetList;
  }

  List<Widget> makeCategoryProductList(List nonSeparated) {
    Map categoryProducts = {};
    List<Widget> widgetList = [];

    for (var e in nonSeparated) {
      if (categoryProducts.containsKey(e.category.name)) {
        categoryProducts[e.category.name].add(e);
      } else {
        categoryProducts[e.category.name] = [e];
      }
    }

    categoryProducts.keys.forEach((e) {
      widgetList.add(CategoryTitleItem(e));
      widgetList.addAll(makeProductItemList(categoryProducts[e]));
      widgetList.add(const Divider());
      }
    );

    return widgetList;
  }

  int sumCounter(List productList) {
    double sum = 0;
    productList.forEach((e) {
      sum += e.price / 100;
    });

    return sum.toInt();
  }

  int discountCounter(List productList) {
    double discount = 0;
    productList.forEach((e) {
      if (e.sale > 0) {
        discount += (e.price / 100) - ((e.price ~/ 100) * ((100 - e.sale) / 100)).toInt();
      }
    });
    return discount.toInt();
  }

  int finalSum(List productList) {
    return sumCounter(productList) - discountCounter(productList);
  }

  int discountSize(List productList) {
    return ((discountCounter(productList) / sumCounter(productList)) * 100)
        .round();
  }

  List sortPriceAsc(List list) {

    List sortedList = List.from(list);

    for (var i = 0; i < sortedList.length -1; i++ ) {
      for (var j = i + 1; j < sortedList.length; j++) {
        var iPrice = sortedList[i].sale > 0 ? ((sortedList[i].price ~/ 100) * ((100 - sortedList[i].sale) / 100).toInt()) : sortedList[i].price;
        var jPrice = sortedList[j].sale > 0 ? ((sortedList[j].price ~/ 100) * ((100 - sortedList[j].sale) / 100).toInt()) : sortedList[j].price;
        if(iPrice > jPrice) {
          var temp = sortedList[i];
          sortedList[i] = sortedList[j];
          sortedList[j] = temp;
        }
      }
    }
    return sortedList;
  }

  List sortPriceDesc(List list) {

    List sortedList = List.from(list);

    for (var i = 0; i < sortedList.length -1; i++ ) {
      for (var j = i + 1; j < sortedList.length; j++) {
        var iPrice = sortedList[i].sale > 0 ? ((sortedList[i].price ~/ 100) * ((100 - sortedList[i].sale) / 100).toInt()) : sortedList[i].price;
        var jPrice = sortedList[j].sale > 0 ? ((sortedList[j].price ~/ 100) * ((100 - sortedList[j].sale) / 100).toInt()) : sortedList[j].price;
        if(iPrice < jPrice) {
          var temp = sortedList[i];
          sortedList[i] = sortedList[j];
          sortedList[j] = temp;
        }
      }
    }
    return sortedList;
  }

  List sortNameAsc(List list) {

    List sortedList = List.from(list);

    for (var i = 0; i < sortedList.length - 1; i++ ) {
      for (var j = i + 1; j < sortedList.length; j++) {
        if(sortedList[i].title.compareTo(sortedList[j].title) > 0) {
          var temp = sortedList[i];
          sortedList[i] = sortedList[j];
          sortedList[j] = temp;
        }
      }
    }

    return sortedList;
  }

  List sortNameDesc(List list) {

    List sortedList = List.from(list);

    for (var i = 0; i < sortedList.length - 1; i++ ) {
      for (var j = i + 1; j < sortedList.length; j++) {
        if(sortedList[i].title.compareTo(sortedList[j].title) < 0) {
          var temp = sortedList[i];
          sortedList[i] = sortedList[j];
          sortedList[j] = temp;
        }
      }
    }

    return sortedList;
  }

  List sortCategoryAsc (List list) {

    List sortedList = List.from(list);

    for (var i = 0; i < sortedList.length - 1; i++ ) {
      for (var j = i + 1; j < sortedList.length; j++) {
        if(sortedList[i].category.name.compareTo(sortedList[j].category.name) > 0) {
          var temp = sortedList[i];
          sortedList[i] = sortedList[j];
          sortedList[j] = temp;
        }
      }
    }
    return sortedList;
  }


  List sortCategoryDesc (List list) {

    List sortedList = List.from(list);

    for (var i = 0; i < sortedList.length - 1; i++ ) {
      for (var j = i + 1; j < sortedList.length; j++) {
        if(sortedList[i].category.name.compareTo(sortedList[j].category.name) < 0) {
          var temp = sortedList[i];
          sortedList[i] = sortedList[j];
          sortedList[j] = temp;
        }
      }
    }
    return sortedList;
  }



  void setSortType(sortType) {
    switchSpinner();

    setState(() {



      switch (sortType) {
        case SortType.notSorted:
          {
            _shoppingList = makeCategoryProductList(
                shoppingListRepository.shoppingList);
          }
        case SortType.byNameAsc:
          {
            _shoppingList = makeCategoryProductList(
                sortNameAsc(
                    shoppingListRepository.shoppingList
                )
            );
          }
        case SortType.byNameDesc:
          {
            _shoppingList = makeCategoryProductList(
                sortNameDesc(
                    shoppingListRepository.shoppingList
                )
            );
          }
        case SortType.byPriceAsc:
          {
            _shoppingList = makeCategoryProductList(
                sortPriceAsc(
                    shoppingListRepository.shoppingList
                )
            );
          }
        case SortType.byPriceDesc:
          {
            _shoppingList = makeCategoryProductList(
                sortPriceDesc(
                    shoppingListRepository.shoppingList
                )
            );
          }
        case SortType.byCategoryAsc:
          {
            _shoppingList = makeCategoryProductList(
                sortCategoryAsc(
                    shoppingListRepository.shoppingList
                )
            );
          }
        case SortType.byCategoryDesc:
          {
            _shoppingList = makeCategoryProductList(
                sortCategoryDesc(
                    shoppingListRepository.shoppingList
                )
            );
          }
      }
      _sortType = sortType;

    }
    );

    switchSpinner();


  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(children: [
        ShoppingListTitle(_sortType, setSortType),
        Expanded(child: _loading? const CircularProgressIndicator(color: AppColors.lime,) : ListView(children: _shoppingList)),
        const Divider(),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Text('В вашей покупке', textAlign: TextAlign.start, style: AppTextStyle.boldBlack16Style,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Text('$_productsCount ${howManyGoods(_productsCount)}', textAlign: TextAlign.start, style: AppTextStyle.noColor12Style,),
              const Expanded(child: SizedBox(height: 10,)),
              Text('$_sum руб', textAlign: TextAlign.end, style: AppTextStyle.boldBlack12Style),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Text('Cкидка $_discountSize%', textAlign: TextAlign.start, style: AppTextStyle.noColor12Style,),
              const Expanded(child: SizedBox(height: 10,)),
              Text('-$_discount руб', textAlign: TextAlign.end, style: AppTextStyle.noColor12Style,)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              const Text('Итого', textAlign: TextAlign.start, style: AppTextStyle.boldBlack16Style,),
              const Expanded(child: SizedBox(height: 10,)),
              Text('$_finalSum руб', textAlign: TextAlign.end, style: AppTextStyle.boldBlack16Style,)
            ],
          ),
        ),
      ]),
    );
  }
}