import 'package:flutter/material.dart';
import '../widgets/animation/sign_up_bottom_animation.dart';

class LoginSignUpStructure extends StatelessWidget {
  final Widget formWidget;
  const LoginSignUpStructure(Widget this.formWidget);
  static const routeName = '/sign-up';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Text(
                'Secure Messenger',
                style: TextStyle(
                  fontFamily: 'Righteous-Regular',
                  fontSize: 30,
                  color: Theme.of(context).accentColor.withOpacity(0.7),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.84,
                height: MediaQuery.of(context).size.height * 0.507,
                child: TweenAnimationBuilder(
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  tween: Tween<double>(begin: 0, end: 1),
                  builder: (_, double opacity, myChild) {
                    return Opacity(
                      opacity: opacity,
                      child: myChild,
                    );
                  },
                  child: Form(
                    child: formWidget,
                  ),
                ),
              ),
              bottomAnimation(),
              // ElevatedButton(
              //     onPressed: () {
              //       Navigator.of(context).pushNamed('/');
              //     },
              //     child: Text('Home'))
            ]),
      ),
    );
  }
}
