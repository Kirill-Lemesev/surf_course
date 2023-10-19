import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: MyWidget()
    );
  }
}



class MyWidget extends StatefulWidget {
  const MyWidget ({ super.key });

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with TickerProviderStateMixin{

  double _top = 300;
  double _right = 145;
  bool _isTapped = false;

  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this
  );

  late final Animation<double> _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void runAnimation() {
    _controller.repeat();
  }

  void stopAnimation() {
    _controller.stop();
  }


  void changeColor() {
    setState(() {
      _isTapped = !_isTapped;
    });
  }

  void changeVertical(DragUpdateDetails details) {
    setState(() {
      _top += details.delta.dy;
    });
  }

  void changeHorizontal(DragUpdateDetails details) {
    setState(() {
      _right -= details.delta.dx;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(

          top: _top,
          right: _right,
          child: RotationTransition(
            turns: _animation,
            child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: _isTapped ? Colors.red: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                )
            ),
          ),
        ),
        Positioned.fill(
          child: GestureDetector(
            onTap: changeColor,
            onLongPressStart: (LongPressStartDetails details) {runAnimation();},
            onLongPressEnd: (LongPressEndDetails details) {stopAnimation();},
            onVerticalDragUpdate: (DragUpdateDetails details) {changeVertical(details);},
            onHorizontalDragUpdate: (DragUpdateDetails details) {changeHorizontal(details);},
          ),
        )
      ],
    );
  }
}