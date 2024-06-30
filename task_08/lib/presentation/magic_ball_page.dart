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
  bool _isRequested = false;
  bool _isScaled = false;
  double _scale = 1.0;


  _toggleScale () {
    setState(() {
      _isScaled = !_isScaled;
      _scale = (_isScaled) ? 3.0 : 1.0;
    });

  }

  @override
  void initState() {
    super.initState();
    ShakeDetector.autoStart(
      onPhoneShake: () {
        _toggleScale();
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
         _toggleScale();
        },
        child: Center(
            child: AnimatedContainer(
          transform: Matrix4.identity()..scale(_scale),
          transformAlignment: Alignment.center,
          duration: const Duration(seconds: 1),
          child: Image.asset(
            'assets/magic_ball.png',
            fit: BoxFit.fill,
          ),
        )),
      ),
      if (!_isRequested) ...{
        const Column(
          children: [
            Expanded(
                child: SizedBox(
              width: 10,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppText.hint,
                  style: AppTextStyles.hint,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            )
          ],
        )
      }
    ]);
  }
}

//Text animation
