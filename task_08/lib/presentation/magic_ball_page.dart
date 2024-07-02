import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:dio/dio.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_styles.dart';
import 'package:surf_flutter_courses_template/assets/app_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MagicBall extends StatefulWidget {
  const MagicBall({super.key});

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  bool _isRequested = true;
  bool _isScaled = false;
  double _scale = 1;
  double _opacity = 0.0;
  late String _prediction;
  bool _isLoading = false;

  void _toggleScale() async {
    setState(() {
      _isRequested = false;
      _isScaled = !_isScaled;
      _scale = (_isScaled) ? 3.0 : 1.0;
      _isLoading = true;
    });

    await _requestPrediction();

    setState(() {
      _isLoading = false;
      _opacity = 1.0;
    });
  }

  Future<void> _requestPrediction() async {
    final options = BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    final Dio dio = Dio(options);
    try {
      final response = await dio.get('https://eightballapi.com/api');
      final data = response.data["reading"];
      setState(() {
        _prediction = data;
      });
    } catch (e) {
      if (e is DioException) {
        setState(() {
          _prediction = AppText.error;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    ShakeDetector.autoStart(
      onPhoneShake: () {
        if (_isRequested) {
          _toggleScale();
        }
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: () {
          if (_isRequested) {
            _toggleScale();
          }
        },
        child: Center(
            child: AnimatedContainer(
          transform: Matrix4.identity()..scale(_scale),
          transformAlignment: Alignment.center,
          duration: const Duration(seconds: 300),
          child: Image.asset(
            'assets/magic_ball.png',
            fit: BoxFit.fill,
          ),
        )),
      ),
      if (_isRequested) ...{
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
      } else ...{
        Center(
          child: (_isLoading)
              ? const SpinKitThreeBounce(
                  color: AppColors.white,
                )
              : AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(seconds: 300),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(_prediction,
                                  style: (_prediction == AppText.error)
                                      ? AppTextStyles.errorText
                                      : AppTextStyles.successText,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        )
      }
    ]);
  }
}
