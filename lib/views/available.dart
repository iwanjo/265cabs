import 'package:app_265cab/views/booking.dart';
import 'package:app_265cab/views/confirmation.dart';
import 'package:app_265cab/views/main_drawer.dart';
import 'package:colour/colour.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';

class AvailableCabs extends StatelessWidget {
  final String title = "Available Cabs";

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
              padding: EdgeInsets.only(top: 80, left: 80),
              child: MaterialButton(
                color: Colour('daa520'),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'BA 3546\nGroup Cab\nChirimba - Blantyre\n5 Seats',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'PTSerif Bold',
                    fontSize: 17,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConfirmedBooking()));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 200, left: 80),
              child: MaterialButton(
                color: Colour('daa520'),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'BA 2356\nGroup Cab\nChirimba - Blantyre\n5 Seats',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'PTSerif Bold',
                    fontSize: 17,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 320, left: 80),
              child: MaterialButton(
                color: Colour('daa520'),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'BA 4091\nTransit Cab\nChirimba - Blantyre\n4 Seats',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'PTSerif Bold',
                    fontSize: 17,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 440, left: 80),
              child: MaterialButton(
                color: Colour('daa520'),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'BA 6059\nTransit Cab\nLimbe - Blantyre\n5 Seats',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'PTSerif Bold',
                    fontSize: 17,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 560, left: 80),
              child: MaterialButton(
                color: Colour('daa520'),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'BA 2179\nTransitCab\nLimbe - Chirimba\n4 Seats',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'PTSerif Bold',
                    fontSize: 17,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
