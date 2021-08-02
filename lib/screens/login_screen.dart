import 'package:flutter/material.dart';
import 'package:secure_messenger/screens/sign_up_screen.dart';
import '../widgets/login_signUp_structure.dart';

class Login extends StatelessWidget {
  // const SignUp({Key? key}) : super(key: key);
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return LoginSignUpStructure(loginForm());
  }
}

class loginForm extends StatelessWidget {
  // const loginForm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Text(
              'Login',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: 'Email Id',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor))),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor))),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).accentColor),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SignUp.routeName);
              },
              child: Text('Create New Account'),
              // style: TextButton.styleFrom(primary: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}
