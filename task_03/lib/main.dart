import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        body: Column(
          children: [
            SafeArea(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox.square(
                      dimension: 150,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/my_photo.JPG'),
                              fit: BoxFit.fill
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ]
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Lemesev Kirill Alexseevich',
              style: TextStyle(
                  fontFamily: 'Teko',
                  fontSize: 35.0),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  SizedBox.square(
                      dimension: 30,
                      child: SvgPicture.asset(
                        'assets/user.svg',
                        fit: BoxFit.fill,
                      )
                  ),
                  SizedBox(width: 10,),
                  Text(
                    'About:',
                    style: TextStyle(
                        fontFamily: 'Teko',
                        fontSize: 30.0
                    ),)
                ],
              ),
            ),
            Text('QA Engeneer at Lenta LTD. 29 y.o',
              style: TextStyle(
                  fontFamily: 'Teko',
                  fontSize: 25.0),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  SizedBox.square(
                      dimension: 30,
                      child: SvgPicture.asset(
                        'assets/heart.svg',
                        fit: BoxFit.fill,
                        color: Colors.red,
                      )
                  ),
                  SizedBox(width: 10,),
                  Text(
                    'Hobbies:',
                    style: TextStyle(
                        fontFamily: 'Teko',
                        fontSize: 30.0
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Brazilian Jiu Jitsu, readindg, ride motorcycle',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Teko',
                  fontSize: 25.0
              ),),
            SizedBox(height: 40,),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  SizedBox.square(
                      dimension: 30,
                      child: SvgPicture.asset(
                        'assets/mouse.svg',
                        fit: BoxFit.fill,
                        color: Colors.deepPurple,
                      )
                  ),
                  SizedBox(width: 10,),
                  Text(
                    'Experience:',
                    style: TextStyle(
                        fontFamily: 'Teko',
                        fontSize: 30.0
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'My programming experience is about two years',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Teko',
                  fontSize: 25.0
              ),),
          ],
        ),
      ),
    );
  }
}


