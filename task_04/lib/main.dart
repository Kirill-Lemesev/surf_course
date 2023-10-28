import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: () {  },
              color: AppColors.button,
            ),
          title: Column(
            children: [
              Text(
                  'Чек № 56',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text
                  )
                ),
              Text(
                '24.02.23 в 12:23',
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.data
                ),
              )
            ]
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
        ),
        ),
    );
  }
}





abstract class AppColors {
  static const background = Colors.white;
  static const button = Color(0xff67cD00);
  static const text = Color(0xff252849);
  static const data = Color(0xff60607B);
  static const strikeThrough = Color(0xffb5b5b5);
  static const redText = Color(0xffff0000);
}

