import 'package:app_265cab/views/available.dart';
import 'package:app_265cab/views/main_drawer.dart';
import 'package:colour/colour.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'profile.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({this.uid});
  final String uid;
  final String title = "Booking";

  final mapImage = Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/map.PNG'), fit: BoxFit.cover)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colour('daa520'),
        title: Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: 'PTSerif Bold',
              decoration: TextDecoration.none),
        ),
      ),
      endDrawer: MainDrawer(),
      body: Form(
        child: Stack(
          children: <Widget>[
            mapImage,
            Padding(
              padding: EdgeInsets.only(top: 270, left: 30, right: 30),
              child: Container(
                height: 300,
                width: 400,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colour("daa520", 0.5), Colour('#daa520', 0.5)],
                        stops: [0.0, 1],
                        begin: Alignment.topCenter)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 0)),
                    Text(
                      'Get a Ride',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'PTSerif Bold',
                          decoration: TextDecoration.none),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'Pickup Point: ', focusColor: Colors.black),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your pickup point';
                        }
                        return null;
                      },
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'PTSerif Italic'),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'Drop off Point: ',
                          focusColor: Colors.black),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'PTSerif Italic'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your pickup point';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'Cab Type: ', focusColor: Colors.black),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'PTSerif Italic'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your pickup point';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 480, left: 155),
              child: MaterialButton(
                child: Text(
                  'Search',
                  style: TextStyle(
                      backgroundColor: Colour('daa520'),
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'PTSerif Italic'),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AvailableCabs()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
