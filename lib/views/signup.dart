import 'package:app_265cab/views/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:colour/colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import 'profile.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  bool isLoading = false;
  bool _checked = false;
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child("Users");

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordMatch = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final logo = Image.asset(
      "assets/logo_trsp.png",
      fit: BoxFit.fill,
      width: 110.0,
      height: 110.0,
    );
    return Scaffold(
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 50)),
              logo,
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/girls-whitebg.jpg"),
                  fit: BoxFit.cover,
                )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Create A New Account",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontFamily: 'PTSerif Bold',
                          decoration: TextDecoration.none),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.white.withOpacity(0.4),
                  Colors.white70.withOpacity(0.7),
                ], stops: [
                  0.0,
                  1
                ], begin: Alignment.topCenter)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 10.0),
                child: TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hintText: "Full Name", focusColor: Colors.black),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'PTSerif Italic'),

                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Email Address", focusColor: Colors.black),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'PTSerif Italic'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mandatory Field, Enter an Email Address';
                    } else if (!value.contains('@')) {
                      return 'Your email lacks an @ sign. Please include a valid email address into this field';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Phone Number", focusColor: Colors.black),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'PTSerif Italic'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: TextFormField(
                  controller: userController,
                  decoration: InputDecoration(
                      hintText: "User Type", focusColor: Colors.black),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'PTSerif Italic'),
                  // The validator receives the text that the user has entered.
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    focusColor: Colors.black,
                  ),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'PTSerif Italic'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mandatory Field, Enter Password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordMatch,
                  decoration: InputDecoration(
                      hintText: 'Confirm Password', focusColor: Colors.black),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'PTSerif Italic'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != passwordController.text) {
                      return 'Passwords do not match, try again';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                      activeColor: Colour("daa520"),
                      value: _checked,
                      onChanged: (value) {
                        setState(() {
                          _checked = !_checked;
                        });
                      }),
                  Text(
                    'I agree to the Terms and Conditions of +265 Cabs',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontFamily: 'PTSerif BoldItalic'),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: isLoading
                    ? CircularProgressIndicator(
                        backgroundColor: Colour("daa520"),
                      )
                    : RaisedButton(
                        color: Colour("daa520"),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            registerToFb();
                          }
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontFamily: 'PTSerif Bold'),
                        ),
                      ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: MaterialButton(
                  child: Text(
                    'Already have an account?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontFamily: 'PTSerif Bold'),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ),
            ]))));
  }

  void registerToFb() {
    firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) {
      dbRef.child(result.user.uid).set({
        "email": emailController.text,
        "name": nameController.text
      }).then((res) {
        isLoading = false;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Profile(uid: result.user.uid)),
        );
      });
    }).catchError((err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
