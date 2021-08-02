import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:secure_messenger/screens/login_screen.dart';
import '../widgets/pickers/user_image_picker.dart';
import '../widgets/login_signUp_structure.dart';

class SignUp extends StatelessWidget {
  // const SignUp({Key? key}) : super(key: key);
  static const routeName = '/sign-up';
  @override
  Widget build(BuildContext context) {
    return LoginSignUpStructure(formSwitcher());
  }
}

class formSwitcher extends StatefulWidget {
  // const formSwitcher({
  //   Key? key,
  // }) : super(key: key);
  @override
  _formSwitcherState createState() => _formSwitcherState();
}

class _formSwitcherState extends State<formSwitcher> {
  bool second = false;
  bool third = false;
  TextEditingController fNameTxtController = TextEditingController();
  TextEditingController sNameTxtController = TextEditingController();
  TextEditingController emailTxtController = TextEditingController();
  TextEditingController mobileTxtController = TextEditingController();

  File? _userImageFile;

  void pickedImage(File image) {
    _userImageFile = image;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 700),
      transitionBuilder: (myChild, animation) => ScaleTransition(
        scale: animation,
        child: myChild,
      ),
      child: !second
          ? Container(
              key: ValueKey(1),
              child: ListView(
                children: [
                  TextFormField(
                    controller: fNameTxtController,
                    decoration: InputDecoration(
                        labelText: 'First Name',
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).accentColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: sNameTxtController,
                    decoration: InputDecoration(
                        labelText: 'Last Name',
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).accentColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailTxtController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email Id',
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).accentColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: mobileTxtController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Mobile Number',
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).accentColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor))),
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).pushNamed(Login.routeName);
                        },
                        icon: Icon(Icons.login,
                            color: Theme.of(context).primaryColor),
                        label: Text(
                          'Login',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20),
                        ),
                        // style: TextButton.styleFrom(primary: Colors.amber),
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              second = true;
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                'Next',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 22),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Theme.of(context).primaryColor,
                              ),
                            ],
                          )),
                    ],
                  )
                ],
              ),
            )
          : (!third
              ? Container(
                  key: ValueKey(2),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Re-Enter Password',
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor))),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  second = false;
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_back,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Text(
                                    'Prev',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 22),
                                  ),
                                ],
                              )),
                          SizedBox(
                            width: 30,
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  third = true;
                                });
                              },
                              child: Row(children: [
                                Icon(
                                  Icons.arrow_forward,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Text(
                                  'Next',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 22),
                                ),
                              ])),
                        ],
                      )
                    ],
                  ),
                )
              : Container(
                  key: ValueKey(2),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      UserImagePicker(pickedImage),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  third = false;
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_back,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Text(
                                    'Prev',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 22),
                                  ),
                                ],
                              )),
                          SizedBox(
                            width: 30,
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  second = true;
                                });
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Finish',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 22),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ],
                              )),
                        ],
                      )
                    ],
                  ),
                )),
    );
  }
}
