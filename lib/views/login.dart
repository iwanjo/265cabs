import 'package:app_265cab/views/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:colour/colour.dart';
import 'package:flutter/widgets.dart';
import 'profile.dart';

class LoginScreen extends StatefulWidget {
  @override
  _EmailLogInState createState() => _EmailLogInState();
}

class _EmailLogInState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final logo = Image.asset(
      "assets/logo_trsp.png",
      fit: BoxFit.fill,
      width: 120.0,
      height: 120.0,
    );

    return Scaffold(
        backgroundColor: Color(0xFFE1F5FE),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 150)),
              logo,
              Padding(
                padding: EdgeInsets.only(top: 50, left: 40, right: 40),
                child: Container(
                  height: 200,
                  width: 600,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colour("daa520", 0.5),
                    Colour('#daa520', 0.5)
                  ], stops: [
                    0.0,
                    1
                  ], begin: Alignment.topCenter)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Log in to your +265Cabs Account',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontFamily: 'PTSerif Bold',
                            decoration: TextDecoration.none),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: 'Email Address',
                            focusColor: Colors.black),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'PTSerif Italic'),
                        validator: (value) {
                          if (value.isEmpty || !value.contains('@')) {
                            return 'Invalid Email Address';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Password', focusColor: Colors.black),
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'PTSerif Italic',
                            fontSize: 20),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: isLoading
                    ? CircularProgressIndicator()
                    : RaisedButton(
                        color: Colour("daa520"),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            logInToFb();
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontFamily: 'PTSerif Bold'),
                        ),
                      ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: MaterialButton(
                  child: Text(
                    'Do not have an account yet?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontFamily: 'PTSerif Bold'),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                ),
              ),
            ]))));
  }

  void logInToFb() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) {
      isLoading = false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Profile(uid: result.user.uid)),
      );
    }).catchError((err) {
      print(err.message);
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
}
