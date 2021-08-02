import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/logo_animation.dart';
import './sign_up_screen.dart';
import './login_screen.dart';

class PreviewScreen extends StatelessWidget {
  // const PreviewScreen({ Key? key }) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      // backgroundColor: const Color(0xFF39C9AF),
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogoAnimation(),
            // Container(
            //   width: MediaQuery.of(context).size.width * 0.4,
            //   height: MediaQuery.of(context).size.width * 0.4,
            //   decoration: BoxDecoration(
            //     color: Theme.of(context).accentColor,
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(31),
            //     ),
            //   ),
            //   child: Align(
            //     alignment: Alignment.center,
            //     child: Text(
            //       'SM',
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //         color: Theme.of(context).primaryColor,
            //         fontSize: MediaQuery.of(context).size.width * 0.2,
            //       ),
            //     ),
            //   ),
            // ),
            Text(
              'Secure Messenger',
              style: TextStyle(
                fontFamily: 'Righteous-Regular',
                fontSize: 30,
                color: Theme.of(context).accentColor.withOpacity(0.7),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(Login.routeName);
                  },
                  icon: Icon(Icons.login),
                  label: Text('Login'),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(SignUp.routeName);
                  },
                  icon: Icon(Icons.create),
                  label: Text('Sign Up'),
                ),
              ],
            ),
            Text(
              'Developed By :- Sourabh Saraswat',
              style: TextStyle(fontFamily: 'Righteous-Regular'),
            ),
          ],
        ),
      ),
    );
  }
}
