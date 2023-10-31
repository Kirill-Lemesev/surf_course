import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColorsBackground.backgroundWhite,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: () {  },
              color: AppColorsButton.limeButton
            ),
          title: const Column(
            children: [
              Text(
                  'Чек № 56',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColorsFonts.text
                  )
                ),
              Text(
                '24.02.23 в 12:23',
                style: TextStyle(
                  fontSize: 10,
                  color: AppColorsFonts.data
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





abstract class AppColorsFonts {
  static const text = Color(0xff252849);
  static const data = Color(0xff60607B);
  static const strikeThrough = Color(0xffb5b5b5);
  static const redText = Color(0xffff0000);
}

abstract class AppColorsBackground {
  static const backgroundWhite = Colors.white;
  static const backgroundGray = Color(0xfff1f1f1);
  static const backgroundLime = Color(0xff67cD00);
}

abstract class AppColorsButton{
  static const limeButton = Color(0xff67cD00);
  static const grayButton = Color(0xff60607b);
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
                      color: AppColorsFonts.text),
                  ),
              SizedBox(
                  width: 200
              ),
              Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: AppColorsBackground.backgroundGray,
                    borderRadius: BorderRadius.circular(5),
                    ),
                    child: badges.Badge(
                        showBadge: isActive,
                        position: badges.BadgePosition.bottomEnd(bottom: 3, end: 3),
                        badgeStyle: badges.BadgeStyle(
                        badgeColor: AppColorsButton.limeButton
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
              )
            ]
          )
        ]
      ),
    );
  }
}
