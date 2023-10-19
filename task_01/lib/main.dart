import 'package:flutter/material.dart';

void main() => runApp(const SurfApp());


class SurfApp extends StatelessWidget {
  const SurfApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePageStateful(title: 'Stateful page'),
    );
  }
}

class HomePageStateful extends StatefulWidget {
  final String title;

  const HomePageStateful({required this.title, Key? key}) : super(key: key);

  @override
  State<HomePageStateful> createState() => _HomePageStatefulState();
}

class _HomePageStatefulState extends State<HomePageStateful> {
  int _counter = 0;
  int _negativeCounter = 0;
  int _positiveCounter = 0;
  bool _validator = false;

  void _incrementCounter() {
    setState(() {
      _validator = false;
      _positiveCounter += 1;
      _counter += 1;
    });
  }

  void _decrementCounter() {
    setState(() {
      _negativeCounter += 1;
      if (_counter - 1 >= 0){
        _counter -= 1;
      } else {
        _validator = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_validator ? "Value can't be negative" : ''),
            Text(
                '$_counter',
                style: Theme
                    .of(context)
                    .textTheme.headlineMedium
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    children: [
                      Text('You have pushed the button $_negativeCounter times'),
                      SizedBox(height: 20,),
                      FloatingActionButton(
                        onPressed: _decrementCounter,
                        tooltip: 'Decrement',
                        child: const Icon(Icons.exposure_minus_1),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text('You have pushed the button $_positiveCounter times'),
                      SizedBox(height: 20,),
                      FloatingActionButton(
                          onPressed: _incrementCounter,
                          tooltip: 'Increment',
                          child: const Icon(Icons.exposure_plus_1)),
                    ],
                  ),
                ),
                SizedBox(width: 20,)
              ],
            )
          ],
        ),
      ),
    );
  }
}