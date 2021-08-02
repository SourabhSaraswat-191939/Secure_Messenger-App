import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class SineCurve extends Curve {
  final double count;
  SineCurve({this.count = 2});
  // t = x
  @override
  double transformInternal(double t) {
    var val = sin(count * 2 * pi * t) * 0.5 + 0.5;
    // var val = sin(2 * pi * t);
    return val; //f(x)
  }
}

class LogoAnimation extends StatefulWidget {
  // const LogoAnimation({Key? key}) : super(key: key);

  @override
  _LogoAnimationState createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimation> {
  bool animate = true;
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    timer = Timer.periodic(Duration(seconds: 2), (_) {
      setState(() {
        animate = !animate;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Stack(alignment: Alignment.center, children: [
        AnimatedPositioned(
          child: Image.asset(
            'assets/images/logo.png',
            scale: 1.7,
          ),
          duration: Duration(seconds: 2),
          top: animate ? 0 : 10,
          curve: SineCurve(),
        ),
      ]),
    );
  }
}
