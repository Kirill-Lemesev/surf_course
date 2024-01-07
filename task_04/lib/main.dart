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
      home: productList != null ? CheckScreen() : EmptyState()
    );
  }
}

class EmptyState extends StatelessWidget {

  EmptyState();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Center(
        child: Text(
          'Здесь ничего нет',
          style: TextStyle(
              fontSize: 18,
              color: AppColors.blue
          )
        )
      ),
    );
  }
}

class CheckScreen extends StatelessWidget {

  CheckScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(),
      body: CustomBody(),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  const CustomAppBar();

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () { },
          color: AppColors.lime
      ),
      title: const Column(
          children: [
            Text(
                'Чек № 56',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blue
                )
            ),
            Text(
              '24.02.23 в 12:23',
              style: TextStyle(
                  fontSize: 10,
                  color: AppColors.gray
              ),
            )
          ]
      ),
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class CustomBody extends StatefulWidget {

  CustomBody();

  @override
  State<CustomBody> createState() => _CustomBodyState();
}

class _CustomBodyState extends State<CustomBody> {
  late bool _isActive;
  late List _productList;
  late int _productsCount;
  late String _sum;
  late int _discountSize;
  late String _discount;
  late String _finalSum;

  @override
  void initState() {
    _isActive = false;
    _productList = separatorCategoryProducts(dataForStudents);
    _productsCount = dataForStudents.length;
    _sum = numberFormatter(sumCounter(dataForStudents));
    _discountSize = discountSize(dataForStudents);
    _discount = numberFormatter(dicsountCounter(dataForStudents));
    _finalSum = numberFormatter(finalSum(dataForStudents));
    super.initState();
  }

  String numberFormatter(int unformatedDigit) {
    var formatter = NumberFormat('#,###');
    var formatedDigit = unformatedDigit >= 1000 ? formatter.format(unformatedDigit).replaceAll(',', ' ') :  unformatedDigit.toString();
    return formatedDigit;
  }

  List separatorCategoryProducts(List nonSeparated) {

    Map categoryProducts = {};

    List widgetList = [];

    for (var e in nonSeparated) {
      if(categoryProducts.containsKey(e.category.name)) {
        categoryProducts[e.category.name].add(e);
      } else {
        categoryProducts[e.category.name] = [e];
      }
    }

    categoryProducts.keys.forEach((e) {
      widgetList.add(CategoryItem(e));
      for(var i in categoryProducts[e] ) {

        String? sale;

        if (i.sale > 0) {
          sale = numberFormatter(((i.price ~/ 100) * ((100 - i.sale) / 100)).toInt());
        }

        String price = numberFormatter((i.price / 100).toInt());


        widgetList.add(ProductItem(i.title, price, i.imageUrl, i.amount, sale));

        }

      widgetList.add(DividerItem());

      }
    );

    return widgetList;
  }

  int sumCounter(List productList) {
    double sum = 0;
    productList.forEach((e) {
      sum += e.price / 100;
      }
    );

    return sum.toInt();
  }

  int dicsountCounter(List productList) {
    double discount = 0;
    productList.forEach((e) {
      if (e.sale > 0) {
        discount += (e.price / 100) - ((e.price ~/ 100) * ((100 - e.sale) / 100)).toInt();
        }
      }
    );

    return discount.toInt();

  }

  int finalSum(List productList) {

    return sumCounter(productList) - dicsountCounter(productList);

  }

  int discountSize(List productList) {
    return ((dicsountCounter(productList) / sumCounter(productList)) * 100).round();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          FilterRow(_isActive),
          Container(
            height: 400,
            child: ProductList(_productList),
          ),
          Divider(),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Row(
              children: [
                Text(
                  'В вашей покупке',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue
                  ),
                ),
              ]
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Text(
                  '$_productsCount товаров',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.blue
                  ),
                ),
                Expanded(child: SizedBox(height: 10,)),
                Text(
                  '$_sum руб',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blue
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Text(
                  'Cкидка $_discountSize %',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 12,
                      color: AppColors.blue
                  ),
                ),
                Expanded(child: SizedBox(height: 10,)),
                Text(
                  '-$_discount руб',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Text(
                  'Итого',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue
                  ),
                ),
                Expanded(child: SizedBox(height: 10,)),
                Text(
                  '$_finalSum руб',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue
                  ),
                )
              ],
            ),
          ),
        ]
      ),
    );
  }
}


class FilterRow extends StatelessWidget {

  bool isActive = false;

  FilterRow(this.isActive);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Text('Cписок покупок',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.blue),
          ),
          SizedBox(
              width: 200
          ),
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: AppColors.brightGray,
              borderRadius: BorderRadius.circular(5),
            ),
            child: badges.Badge(
              showBadge: isActive,
              position: badges.BadgePosition.bottomEnd(bottom: 3, end: 3),
              badgeStyle: badges.BadgeStyle(
                  badgeColor: AppColors.lime
              ),
              child: IconButton(
                icon: Icon(Icons.sort),
                padding: EdgeInsets.all(5.0),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)
                          )
                      ),
                      builder: (BuildContext context) {
                        return SortTypePanel();
                    }
                  );
              }
            ),
          ),
        )
      ]
    );
  }
}

class SortTypePanel extends StatefulWidget {

  @override
  State<SortTypePanel> createState() => _SortTypePanel();
}

class _SortTypePanel extends State<SortTypePanel> {
  int _index = 0 ;

  void changeState(int newIndex) {
    setState(() {
      _index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Сортировка',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blue
                  ),
                ),
                SizedBox(
                  width: 180,
                ),
                IconButton(
                    onPressed:() => Navigator.pop(context) ,
                    icon: Icon(
                        Icons.close,
                        color: AppColors.blue)
                )
              ],
            ),
            SizedBox(height: 20,),
            CustomLabeledRadio(index: _index, value: 0, label: 'Без сортировки', stateHandler: changeState),
            CustomLabeledRadio(index: _index, value: 1, label: 'По возрастанию', stateHandler: changeState),
            CustomLabeledRadio(index: _index, value: 2, label: 'По убыванию', stateHandler: changeState),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              setState( () {
                Navigator.pop(context);
              });
            },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lime,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  fixedSize: Size(350, 48)
              ), child: Text(
                'Готово',
                style: TextStyle(
                    fontSize: 14
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}

class CustomFilledRadioIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
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
  Function stateHandler;

  CustomLabeledRadio({required this.value, required this.index, required this.label, required this.stateHandler});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        stateHandler(value);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row (
          children: [
            (value == index) ? CustomFilledRadioIcon(): Icon(Icons.radio_button_off, color: AppColors.gray, size: 20),
            SizedBox
              (width: 20),
            Text(
              label,
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.blue
              ),
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

class CategoryItem implements ListItem  {

  final String title;

  CategoryItem(this.title);

  @override
  Widget buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
              title,
              style: TextStyle(
                color: AppColors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
            )
          ),
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
    this.title,
    this.price,
    this.imageUrl,
    this.amount,
    this.sale
  );


  @override
  Widget buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,),
      child: SizedBox(
        width: 350,
        height: 68,
        child: Row(
          children: [
            SizedBox.square(
                dimension: 68,
                child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover
                )
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(
                width: 260,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          title,
                          style: TextStyle(
                              color: AppColors.blue
                          )
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: SizedBox(height: 10,)
              ),
              SizedBox(
                width: 260,
                child: Row(
                  children: [
                    Text(
                        switch (amount) {
                          Grams() => '${amount.value / 1000} кг',
                          Quantity() => '${amount.value} шт',
                        }
                    ),
                    Expanded(
                        child: SizedBox(width: 10,)
                    ),
                    sale != null ?
                    SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(child: SizedBox(width: 10,)),
                          Text(
                            '${price} руб ',
                            style: TextStyle(
                              color: AppColors.lightGray,
                              decoration: TextDecoration.lineThrough,
                            )
                          ),
                          Text(
                          '$sale',
                          style: TextStyle(
                              color: AppColors.red
                          )
                        )
                        ],
                      )
                    )
                    :
                    SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('$price руб')
                        ]
                       ),
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
          }
        );
      }
    }


class CustomIcon extends StatelessWidget{

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
              style: TextStyle(
                  color: color
              ),
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
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border(top: BorderSide(color: AppColors.gray, width: 0.3))
      ),
      child: SafeArea(
        child: Row(
         children: [
           CustomIcon(icon: Icon(Icons.article_outlined, color: AppColors.gray,), text: 'Каталог', color: AppColors.gray),
           CustomIcon(icon: Icon(Icons.search, color: AppColors.gray,), text: 'Поиск', color: AppColors.gray),
           CustomIcon(icon: Icon(Icons.local_mall_outlined, color: AppColors.gray,), text: 'Корзина', color: AppColors.gray),
           CustomIcon(icon: Icon(Icons.person_outline, color: AppColors.lime,), text: 'Личное', color: AppColors.lime)
         ],
        ),
      ),
    );
  }
}




abstract class AppColors {
  static const blue = Color(0xff252849); // main text
  static const gray = Color(0xff60607b); // data and buttons
  static const lightGray = Color(0xffb5b5b5); // strikethrough
  static const red = Color(0xffff0000); // red text
  static const white = Colors.white; // background
  static const brightGray = Color(0xfff1f1f1); // filter button background
  static const lime = Color(0xff67cD00); // background buttons
}