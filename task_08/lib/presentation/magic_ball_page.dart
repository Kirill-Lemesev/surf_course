import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:surf_flutter_courses_template/assets/app_styles.dart';
import 'package:surf_flutter_courses_template/assets/app_text.dart';

class MagicBall extends StatefulWidget {
  const MagicBall({super.key});

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  @override
  void initState() {
    super.initState();
    ShakeDetector.autoStart(
      onPhoneShake: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Тряска!'),
          ),
        );
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
    //detector.stopListening();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: () {
          setState(() {
          });
        },
        child: Center(
            child: Image.asset(
          'assets/magic_ball.png',
          fit: BoxFit.fill,
        )),
      ),
      Column(
        children: [
          Expanded(
              child: SizedBox(
            width: 10,
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppText.hint, style: AppTextStyles.hint,),
            ],
          ),
          SizedBox(
            height: 40,
          )
        ],
      )
    ]);
  }
}


//Animated Container
//Text animation