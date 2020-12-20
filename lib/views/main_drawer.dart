import 'package:app_265cab/views/profile.dart';
import 'package:colour/colour.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'booking.dart';
import 'profile.dart';
import 'login.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({this.uid});
  final String uid;

  @override
  Widget build(BuildContext context) {
    var widget;

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colour('daa520'),
            height: 150,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/pic1.jpeg'),
                            fit: BoxFit.fill)),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.account_circle, color: Colors.black),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                fontFamily: 'PTSerif Italic',
                decoration: TextDecoration.none,
              ),
            ),
            onTap: () {
              print(widget.uid);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.map, color: Colors.black),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BookingScreen()));
              },
            ),
            title: Text(
              'Map',
              style: TextStyle(
                fontFamily: 'PTSerif Italic',
                decoration: TextDecoration.none,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BookingScreen()));
            },
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.history, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text(
              'Trip History',
              style: TextStyle(
                fontFamily: 'PTSerif Italic',
                decoration: TextDecoration.none,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.notification_important, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text(
              'Notifications',
              style: TextStyle(
                fontFamily: 'PTSerif Italic',
                decoration: TextDecoration.none,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.support_agent, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text(
              'Support',
              style: TextStyle(
                fontFamily: 'PTSerif Italic',
                decoration: TextDecoration.none,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.people, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text(
              'Refer Friends',
              style: TextStyle(
                fontFamily: 'PTSerif Italic',
                decoration: TextDecoration.none,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.power_settings_new, color: Colors.black),
              onPressed: () => null,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                fontFamily: 'PTSerif Italic',
                decoration: TextDecoration.none,
              ),
            ),
            onTap: () {
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut().then((res) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (Route<dynamic> route) => false);
              });
            },
          ),
        ],
      ),
    );
  }
}
