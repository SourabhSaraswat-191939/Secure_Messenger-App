import 'package:flutter/material.dart';

class bottomAnimation extends StatelessWidget {
  const bottomAnimation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      child: Image.asset('assets/images/waves.png'),
      duration: Duration(seconds: 1),
      tween: Tween<double>(
          begin: MediaQuery.of(context).size.height + (554 / 2), end: 30),
      builder: (_, double shift, myChild) {
        return Transform.translate(
          offset: Offset(0, shift),
          child: myChild,
        );
      },
    );
  }
}
