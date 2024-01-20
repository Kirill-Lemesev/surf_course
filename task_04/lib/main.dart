import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'models/list_of_purchase.dart';
import 'package:intl/intl.dart';


void main() => runApp(MainApp(dataForStudents));

class MainApp extends StatelessWidget {
  List? productList;

  MainApp(this.productList);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: (productList != null && productList!.isNotEmpty) ? CheckScreen() : const EmptyState());
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
  CheckScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(),
      body: const CustomBody(),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}




class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
          color: AppColors.lime),
      title: const Column(children: [
        Text('Чек № 56',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        Text(
          '24.02.23 в 12:23',
          style: TextStyle(fontSize: 10, color: AppColors.gray),
        )
      ]),
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class CustomBody extends StatefulWidget {
  const CustomBody({super.key});

  @override
  State<CustomBody> createState() => _CustomBodyState();
}

class _CustomBodyState extends State<CustomBody> {
  late List _productList;
  late int _productsCount;
  late String _sum;
  late int _discountSize;
  late String _discount;
  late String _finalSum;
  late int _sortState;
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
    _sortState = 0;
    _updateState = false;
  }

  String numberFormatter(int unformatedDigit) {
    var formatter = NumberFormat('#,###');
    var formattedDigit = unformatedDigit >= 1000
        ? formatter.format(unformatedDigit).replaceAll(',', ' ')
        : unformatedDigit.toString();
    return formattedDigit;
  }

  List separatorCategoryProducts(List nonSeparated) {
    Map categoryProducts = {};

    List widgetList = [];

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

        widgetList.add(ProductItem(i.title, price, i.imageUrl, i.amount, sale));
      }

      widgetList.add(DividerItem());
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

  List sortIncrease(List list) {

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

  List sortDecrease(List list) {

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

  void updateState(int newState) {

    setState(() {
      _updateState = true;
    });

    setState(() {
      var sortedList = newState == 1 ? sortIncrease(dataForStudents) : sortDecrease(dataForStudents);
      _productList = separatorCategoryProducts(sortedList);
      _sortState = newState;
      _updateState = false;

    });

  }


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          FilterRow(_sortState, updateState),
          Container(
            height: 400,
            child: (_updateState) ? ProgressIndicatorExample() : ProductList(_productList),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Row(children: [
              Text(
                'В вашей покупке',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Text(
                  '$_productsCount товаров',
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 12),
                ),
                const Expanded(
                    child: SizedBox(
                  height: 10,
                )),
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
                const Expanded(
                    child: SizedBox(
                  height: 10,
                )),
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

class FilterRow extends StatelessWidget {

  int index;
  Function function;

  FilterRow(this.index, this.function, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Text(
        'Cписок покупок',
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(width: 200),
      Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          color: AppColors.brightGray,
          borderRadius: BorderRadius.circular(5),
        ),
        child: badges.Badge(
          showBadge: index > 0 ? true : false,
          position: badges.BadgePosition.bottomEnd(bottom: 3, end: 3),
          badgeStyle: const badges.BadgeStyle(badgeColor: AppColors.lime),
          child: IconButton(
              icon: const Icon(Icons.sort),
              padding: const EdgeInsets.all(5.0),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    builder: (BuildContext context) {
                      return SortTypePanel(index, function);
                    });
              }),
        ),
      )
    ]);
  }
}

class SortTypePanel extends StatelessWidget {

  int index;
  Function handler;

  SortTypePanel(this.index, this.handler, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Сортировка',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 180,
                  ),
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomLabeledRadio(
                  index: index,
                  value: 1,
                  label: 'По возрастанию',
                  handler: handler,
              ),
              CustomLabeledRadio(
                  index: index,
                  value: 2,
                  label: 'По убыванию',
                  handler: handler,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )),
    );
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

  int value;
  int index;
  String label;
  Function handler;

  CustomLabeledRadio(
      {
      required this.value,
      required this.index,
      required this.label,
      required this.handler,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        index = value;
        handler(index);
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            (value == index)
                ? CustomFilledRadioIcon()
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

abstract class ListItem {
  Widget buildTitle(BuildContext context);
}

class CategoryItem implements ListItem {
  final String title;

  CategoryItem(this.title);

  @override
  Widget buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}

class ProductItem implements ListItem {
  final String title;
  final String price;
  final String imageUrl;
  final Amount amount;
  final String? sale;

  const ProductItem(
      this.title, this.price, this.imageUrl, this.amount, this.sale);

  @override
  Widget buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: SizedBox(
        width: 350,
        height: 68,
        child: Row(
          children: [
            SizedBox.square(
                dimension: 68,
                child: Image.network(imageUrl, fit: BoxFit.cover)),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 260,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(title),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                    child: SizedBox(
                  height: 10,
                )),
                SizedBox(
                  width: 260,
                  child: Row(
                    children: [
                      Text(switch (amount) {
                        Grams() => '${amount.value / 1000} кг',
                        Quantity() => '${amount.value} шт',
                      }),
                      const Expanded(
                          child: SizedBox(
                        width: 10,
                      )),
                      sale != null
                          ? SizedBox(
                              width: 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Expanded(
                                      child: SizedBox(
                                    width: 10,
                                  )),
                                  Text('${price} руб ',
                                      style: const TextStyle(
                                        color: AppColors.lightGray,
                                        decoration: TextDecoration.lineThrough,
                                      )),
                                  Text('$sale',
                                      style: const TextStyle(color: AppColors.red))
                                ],
                              ))
                          : SizedBox(
                              width: 100,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [Text('$price руб')]),
                            )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DividerItem implements ListItem {
  DividerItem();

  @override
  Widget buildTitle(BuildContext context) {
    return const Divider();
  }
}

class ProductList extends StatelessWidget {
  final List productList;

  ProductList(this.productList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index) {
          final item = productList[index];
          return ListTile(
            //leading: item.buildIcon(context),
            title: item.buildTitle(context),
            //subtitle: item.buildSubtitle(context)
          );
        });
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
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
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

class CustomIcon extends StatelessWidget {
  final Icon icon;
  final String text;
  final Color color;

  CustomIcon({required this.icon, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            icon,
            Text(
              text,
              style: TextStyle(color: color),
            )
          ],
        ),
      ),
    );
  }
}

class CustomNavBar extends StatelessWidget {
  CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(top: BorderSide(color: AppColors.gray, width: 0.3))),
      child: SafeArea(
        child: Row(
          children: [
            CustomIcon(
                icon: const Icon(
                  Icons.article_outlined,
                  color: AppColors.gray,
                ),
                text: 'Каталог',
                color: AppColors.gray),
            CustomIcon(
                icon: const Icon(
                  Icons.search,
                  color: AppColors.gray,
                ),
                text: 'Поиск',
                color: AppColors.gray),
            CustomIcon(
                icon: const Icon(
                  Icons.local_mall_outlined,
                  color: AppColors.gray,
                ),
                text: 'Корзина',
                color: AppColors.gray),
            CustomIcon(
                icon: const Icon(
                  Icons.person_outline,
                  color: AppColors.lime,
                ),
                text: 'Личное',
                color: AppColors.lime)
          ],
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
