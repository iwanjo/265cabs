import 'package:app_265cab/views/booking.dart';
import 'package:app_265cab/views/login.dart';
import 'package:colour/colour.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'login.dart';

class Profile extends StatelessWidget {
  Profile({this.uid});
  final String uid;
  final String title = "My Profile";

  final homeDetails = Column(
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 360, left: 380)),
      Text(
        'Home: Mlombwa p325\nWork: Ecobank, BT CBD\nPhone: +265789076521',
        style: TextStyle(fontSize: 19, fontFamily: 'PTSerif Italic'),
      ),
    ],
  );

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
            Column(
              children: <Widget>[
                SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                              image: AssetImage('assets/pic1.jpeg'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(80.0),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 3.0,
                                offset: Offset(0, 4.0),
                                color: Colors.grey),
                          ]),
                      child: IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.only(top: 100, left: 80),
                        icon: Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 200, left: 60),
              child: Row(
                children: <Widget>[
                  Text('Welcome Thikomo',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'PTSerif Bold',
                        fontSize: 30,
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 260, left: 90),
              child: Text(
                'Chirimba | Frequent Rider',
                style: TextStyle(
                    color: Colors.black, fontSize: 20, fontFamily: 'PTSerif'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 530),
              child: MaterialButton(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Text(
                  'Book Cab',
                  style: TextStyle(
                      backgroundColor: Colour('daa520'),
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'PTSerif Italic'),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BookingScreen()));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 530,
                left: 270,
              ),
              child: MaterialButton(
                padding: EdgeInsets.only(left: 0, right: 0),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                      backgroundColor: Colour('daa520'),
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'PTSerif Italic'),
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 320, left: 40, right: 40),
              child: Container(
                height: 170.0,
                width: 600.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colour("#daa520", 0.5), Colour('#daa520', 0.5)],
                  stops: [0.0, 1],
                )),
              ),
            ),
            homeDetails,
          ],
        ),
      ),
      endDrawer: NavigateDrawer(
        uid: this.uid,
      ),
    );
  }
}

class NavigateDrawer extends StatefulWidget {
  final String uid;
  NavigateDrawer({Key key, this.uid}) : super(key: key);
  @override
  _NavigateDrawerState createState() => _NavigateDrawerState();
}

class _NavigateDrawerState extends State<NavigateDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: FutureBuilder(
                future: FirebaseDatabase.instance
                    .reference()
                    .child("Users")
                    .child(widget.uid)
                    .once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data.value['email'],
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'PTSerif Italic',
                        decoration: TextDecoration.none,
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
            currentAccountPicture: CircleAvatar(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/pic1.jpeg'),
                            fit: BoxFit.fill)),
                  ),
                ],
              ),
            ),
            accountName: FutureBuilder(
                future: FirebaseDatabase.instance
                    .reference()
                    .child("Users")
                    .child(widget.uid)
                    .once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data.value['name'],
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'PTSerif Bold',
                        decoration: TextDecoration.none,
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
            decoration: BoxDecoration(
              color: Colour("daa520"),
            ),
          ),
          ListTile(
            leading: new IconButton(
              icon: new Icon(Icons.account_circle, color: Colors.black),
              onPressed: () => null,
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
                MaterialPageRoute(
                    builder: (context) => Profile(uid: widget.uid)),
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
