import 'package:app_265cab/views/booking.dart';
import 'package:app_265cab/views/main_drawer.dart';
import 'package:colour/colour.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';

class ConfirmedBooking extends StatelessWidget {
  final String title = "Confirmed";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: 'PTSerif Bold',
            decoration: TextDecoration.none,
          ),
        ),
        backgroundColor: Colour('daa520'),
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () {},
        // ),
      ),
      endDrawer: MainDrawer(),
      body: Form(
        child: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/taxi.jpg"),
                fit: BoxFit.cover,
              ),
            )),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.8),
                  Colors.white70.withOpacity(0.8),
                ],
                stops: [0.0, 1],
                begin: Alignment.topCenter,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100, left: 130),
              child: Image.asset('assets/tick.png'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 260, left: 80),
              child: Text(
                'Booking Completed \nSuccessfully!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontFamily: 'PTSerif Bold'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 370, left: 40, right: 40),
              child: Text(
                'Your taxi is on the way, you will receive a phone call shortly with further driver details.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'PTSerif Italic',
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
