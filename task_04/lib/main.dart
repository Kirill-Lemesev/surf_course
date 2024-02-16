import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'models/list_of_purchase.dart';
import 'package:intl/intl.dart';


//TODO Дописать алгоритмы, виды сортировко переписать положив их в енум
//TODO Понять в чем проблема у числел с плавающей точкой в передаче данных, возможно оно может по разному распарсится в разныз языках?

void main() => runApp(MainApp(dataForStudents));

class MainApp extends StatelessWidget {
  List? productList;

  MainApp(this.productList, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: (productList != null && productList!.isNotEmpty) ? const CheckScreen() : const EmptyState());
  }
}

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.white,
      child: Center(
          child: Text('Здесь ничего нет',
              style: TextStyle(fontSize: 18))),
    );
  }
}

class CheckScreen extends StatelessWidget {
  const CheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
            color: AppColors.lime),
        title: const Column(
            children: [
              Text('Чек № 56',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
              Text('24.02.23 в 12:23',
              style: TextStyle(
                fontSize: 10,
                color: AppColors.gray))
        ]),
      ),
      body: const CustomBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: AppColors.gray,
        selectedItemColor: AppColors.lime,
        showUnselectedLabels: true,
        currentIndex: 3,
        items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Каталог'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Поиск'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Корзина'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity_sharp),
            label: 'Личное'
        ),],
      )
    );
  }
}

class CustomBody extends StatefulWidget {
  const CustomBody({super.key});

  @override
  State<CustomBody> createState() => _CustomBodyState();
}

class _CustomBodyState extends State<CustomBody> {
  late List<Widget> _productList;
  late int _productsCount;
  late String _sum;
  late int _discountSize;
  late String _discount;
  late String _finalSum;
  late SortType _sortType;
  late bool _updateState;

  @override
  void initState() {
    super.initState();
    _productList = separatorCategoryProducts(dataForStudents);
    _productsCount = dataForStudents.length;
    _sum = numberFormatter(sumCounter(dataForStudents));
    _discountSize = discountSize(dataForStudents);
    _discount = numberFormatter(discountCounter(dataForStudents));
    _finalSum = numberFormatter(finalSum(dataForStudents));
    _sortType = SortType.notSorted;
    _updateState = false;
  }

  String numberFormatter(int unformatedDigit) {
    var formatter = NumberFormat('#,###');
    var formattedDigit = unformatedDigit >= 1000
        ? formatter.format(unformatedDigit).replaceAll(',', ' ')
        : unformatedDigit.toString();
    return formattedDigit;
  }

  List<Widget> separatorCategoryProducts(List nonSeparated) {
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

      widgetList.add(CategoryItem(e));
      for (var i in categoryProducts[e]) {
        String? sale;

        if (i.sale > 0) {
          sale = numberFormatter(
              ((i.price ~/ 100) * ((100 - i.sale) / 100)).toInt());
        }

        String price = numberFormatter((i.price / 100).toInt());

        widgetList.add(ProductItem(i.imageUrl,i.title, price, i.amount, sale));

      }

      widgetList.add(const Divider());
    });

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
        discount += (e.price / 100) -
            ((e.price ~/ 100) * ((100 - e.sale) / 100)).toInt();
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

  List <Widget> sortNameAsc(List list) {

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

    List<Widget> widgetList = [];

    for (var i in sortedList) {
      String? sale;

      if (i.sale > 0) {
        sale = numberFormatter(
            ((i.price ~/ 100) * ((100 - i.sale) / 100)).toInt());
      }

      String price = numberFormatter((i.price / 100).toInt());

      widgetList.add(ProductItem(i.imageUrl,i.title, price, i.amount, sale));

    }

    return widgetList;
  }

  List <Widget> sortNameDesc(List list) {

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

    List<Widget> widgetList = [];

    for (var i in sortedList) {
      String? sale;

      if (i.sale > 0) {
        sale = numberFormatter(
            ((i.price ~/ 100) * ((100 - i.sale) / 100)).toInt());
      }

      String price = numberFormatter((i.price / 100).toInt());

      widgetList.add(ProductItem(i.imageUrl,i.title, price, i.amount, sale));

    }

    return widgetList;
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



  void updateState(sortType) {

    setState(() {
      _updateState = true;
    });

    setState(() {

      switch(sortType) {
        case SortType.notSorted: {
          _productList = separatorCategoryProducts(dataForStudents);
        }
        case SortType.byNameAsc: {
          _productList = sortNameAsc(dataForStudents);
        }
        case SortType.byNameDesc: {
          _productList = sortNameDesc(dataForStudents);
        }
        case SortType.byPriceAsc: {
          _productList = separatorCategoryProducts(sortPriceAsc(dataForStudents));
        }
        case SortType.byPriceDesc: {
          _productList = separatorCategoryProducts(sortPriceDesc(dataForStudents));
        }
        case SortType.byTypeAsc: {
          _productList = separatorCategoryProducts(sortCategoryAsc(dataForStudents));
        }
        case SortType.byTypeDesc: {
          _productList = separatorCategoryProducts(sortCategoryDesc(dataForStudents));
        }


      }
      _sortType = sortType;
      _updateState = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          FilterRow(_sortType, updateState),
          Expanded(child: (_updateState) ? const ProgressIndicatorExample() : ListView(children: _productList)),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Text(
                  'В вашей покупке',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
           Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Text(
                  '$_productsCount товаров',
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 12),
                ),
                const Expanded(child: SizedBox(height: 10,)),
                Text(
                  '$_sum руб',
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Text(
                  'Cкидка $_discountSize %',
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 12),
                ),
                const Expanded(child: SizedBox(height: 10,)),
                Text(
                  '-$_discount руб',
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const Text(
                  'Итого',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const Expanded(
                    child: SizedBox(
                  height: 10,
                )),
                Text(
                  '$_finalSum руб',
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ]),
      );
  }
}

enum SortType {notSorted, byNameAsc, byNameDesc, byPriceAsc, byPriceDesc, byTypeAsc, byTypeDesc}

class FilterRow extends StatelessWidget {

  SortType sortType;
  Function function;

  FilterRow(this.sortType, this.function, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Text(
        'Cписок покупок',
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold),
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
                      return SortTypePanel(sortType, function);
                    });
              }),
        ),
      )
    ]);
  }
}


class SortTypePanel extends StatelessWidget {

  SortType sortType;
  Function handler;

  SortTypePanel(this.sortType, this.handler, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: FractionallySizedBox(
          heightFactor: 0.8,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Сортировка',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: SizedBox(width: 10),),
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      icon: const Icon(Icons.close),
                  )
                ],
              ),
              SizedBox(height: 20,),
              CustomLabeledRadio(
                chosenSortType: sortType,
                itemSortType: SortType.notSorted,
                label: 'Без сортировки',
                handler: handler,
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'По имени',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.gray
                      ),
                    )
                  ],),
              ),
              CustomLabeledRadio(
                chosenSortType: sortType,
                itemSortType: SortType.byNameAsc,
                label: 'По имени от А до Я',
                handler: handler,
              ),
              CustomLabeledRadio(
                chosenSortType: sortType,
                itemSortType: SortType.byNameDesc,
                label: 'По имени от Я до А',
                handler: handler,
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'По цене',
                      style: TextStyle(
                          fontSize: 10,
                          color: AppColors.gray
                      ),
                    )
                  ],),
              ),
              CustomLabeledRadio(
                chosenSortType: sortType,
                itemSortType: SortType.byPriceAsc,
                label: 'По возрастанию',
                handler: handler,
              ),
              CustomLabeledRadio(
                  chosenSortType: sortType,
                  itemSortType: SortType.byPriceDesc,
                  label: 'По убыванию',
                  handler: handler,
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'По типу',
                      style: TextStyle(
                          fontSize: 10,
                          color: AppColors.gray
                      ),
                    )
                  ],),
              ),
              CustomLabeledRadio(
                chosenSortType: sortType,
                itemSortType: SortType.byTypeAsc,
                label: 'По типу от А до Я',
                handler: handler,
              ),
              CustomLabeledRadio(
                chosenSortType: sortType,
                itemSortType: SortType.byTypeDesc,
                label: 'По типу от Я до А',
                handler: handler,
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
                        child: const Text(
                          'Готово',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      )
                  )
                ],
              )
            ],
          ),
        ));
  }
}

class CustomFilledRadioIcon extends StatelessWidget {

  const CustomFilledRadioIcon({super.key});

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
  SortType itemSortType;
  String label;
  Function handler;

  CustomLabeledRadio(
      {
        required this.chosenSortType,
        required this.itemSortType,
        required this.label,
        required this.handler,
        super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        chosenSortType = itemSortType;
        handler(chosenSortType);
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            (itemSortType == chosenSortType)
                ? const CustomFilledRadioIcon()
                : const Icon(Icons.radio_button_off, color: AppColors.gray, size: 20),
            const SizedBox(width: 20),
            Text(
              label,
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}


class CategoryItem extends StatelessWidget {
  final String title;

  const CategoryItem (this.title,{super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row (
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ))
          ],
        ),
    );
  }
}

class ProductDescription extends StatelessWidget {
  final String title;
  final String price;
  final Amount amount;
  final String? sale;

  const ProductDescription(
    this.title,
    this.price,
    this.amount,
    this.sale, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const Expanded(child: SizedBox(height: 10,)),
        Row(
          children: [
            Text(
              switch (amount) {
              Grams() => '${amount.value / 1000} кг',
              Quantity() => '${amount.value} шт',
              }
            ),
            const Expanded(child: SizedBox(width: 10,)),
            sale != null
                ?
            Text.rich(
                TextSpan(
                    text: '',
                    children: [
                      TextSpan(text: '$price руб ', style: const TextStyle(color: AppColors.lightGray, decoration: TextDecoration.lineThrough,)),
                      TextSpan(text: '$sale', style: const TextStyle(color: AppColors.red,)),
                    ]
                )
            )
                :
            Text('$price руб')
          ],
        )
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final Amount amount;
  final String? sale;

  const ProductItem(
      this.imageUrl,
      this.title,
      this.price,
      this.amount,
      this.sale,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 70,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox.square(dimension: 68, child: Image.network(imageUrl, fit: BoxFit.cover)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                child: ProductDescription(
                  title,
                  price,
                  amount,
                  sale
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressIndicatorExample extends StatefulWidget {
  const ProgressIndicatorExample({super.key});

  @override
  State<ProgressIndicatorExample> createState() =>
      _ProgressIndicatorExampleState();
}

class _ProgressIndicatorExampleState extends State<ProgressIndicatorExample>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: 100,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CircularProgressIndicator(
            value: controller.value,
            semanticsLabel: 'Circular progress indicator',
            color: AppColors.lime,
          ),
        ),
      ),
    );
  }
}

abstract class AppColors {
  static const gray = Color(0xff60607b); // data and buttons
  static const lightGray = Color(0xffb5b5b5); // strikethrough
  static const red = Color(0xffff0000); // red text
  static const white = Colors.white; // background
  static const brightGray = Color(0xfff1f1f1); // filter button background
  static const lime = Color(0xff67cD00); // background buttons
}
