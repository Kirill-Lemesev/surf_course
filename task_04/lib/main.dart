import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'models/list_of_purchase.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
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
          centerTitle: true,
          elevation: 0,
        ),
        body: CustomBody()

      )
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



class CustomBody extends StatefulWidget {
  const CustomBody({ super.key });

  @override
  State<CustomBody> createState() => _CustomBodyState();
}

class _CustomBodyState extends State<CustomBody> {
  bool isActive = false;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
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
                        onPressed: () {
                          setState(() {

                            isActive = !isActive;
                          });
                          },
                        icon: Icon(Icons.sort),
                        padding: EdgeInsets.all(5.0),
                        ),
                    ),
                  ),
               ]
            ),
          Container(
            height: 500,
            child: ProductList(itemList: dataForStudents),
          )
        ]
      ),
    );
  }
}


class ProductItem extends StatelessWidget {
  final String title;
  final int price;
  //final Category category;
  final String imageUrl;
  final Amount amount;
  final double sale;

  const ProductItem({
    required this.title,
    required this.price,
    //required this.category,
    required this.imageUrl,
    required this.amount,
    required this.sale,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              SizedBox.square(
                dimension: 68,
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/stub.png',
                  image: imageUrl,
                  fit: BoxFit.cover
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 255,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: SizedBox(width: 255,),),
                  Row(
                    children: [
                      Text(
                        switch (amount) {
                          Grams() => '${amount.value / 1000} кг',
                          Quantity() => '${amount.value} шт',
                        }
                      ),
                      sale > 0 ?
                          SizedBox(
                            width: 250,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '${price  ~/ 100} руб ', //
                                  style: TextStyle(
                                    color: AppColors.lightGray,
                                    decoration: TextDecoration.lineThrough
                                  )
                                ),
                                Text(
                                    '${((price ~/ 100) * ((100 - sale) / 100)).toInt()} руб',
                                     style: TextStyle(
                                       color: AppColors.red
                                     ),
                                )
                              ],
                            ),
                          )
                          :
                          SizedBox(
                            width: 250,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('${price ~/ 100} руб') //  ~/ 100
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
        );
      }
    }

class ProductList extends StatelessWidget {

  final List itemList;

  ProductList({required this.itemList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductItem(
              title: itemList[index].title,
              price: itemList[index].price,
              imageUrl: itemList[index].imageUrl,
              amount: itemList[index].amount,
              sale: itemList[index].sale
            );
          }
        );
      }
    }


