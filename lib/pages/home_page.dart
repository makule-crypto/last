// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:last/models/apartment_model.dart';
// ignore: unused_import
import 'package:last/core/app_colors.dart';
// ignore: unused_import
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:last/pages/login.dart';
import 'package:url_launcher/url_launcher.dart';

import 'detail_page.dart';

//import 'detail_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data = ApartmentModel.list;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'indieflower',
        accentColor: Colors.orange,
        primarySwatch: Colors.brown,
        // backgroundColor: Colors.brown[10],
      ),
      home: Scaffold(
        backgroundColor: Colors.brown[100],
        drawer: SideMenu(),
        appBar: AppBar(
          backgroundColor: Colors.brown,
          elevation: 0,
          title: Text(
            "Find Your Dream Home",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.search),
          //     onPressed: () {},
          //     color: Colors.black,
          //   )
          // ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.brown,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    auth.signOut();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  icon: Icon(
                    Icons.login,
                    //size: 5,
                  ),
                ),
                label: 'logout'),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "5 result in Juja area",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => DetailPage(
                            data: data[index],
                          ),
                        ),
                      );
                    },
                    child: _buildItems(context, index),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildItems(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.all(12),
      height: 250,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: MediaQuery.of(context).size.width * .5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                image: DecorationImage(
                  image:
                      ExactAssetImage('assets/${data[index].images.first}.jpg'),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 7, spreadRadius: 1, color: Colors.black26)
                ],
              ),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black54,
                          Colors.black87,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 12,
                        left: 40,
                        right: 12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * .25,
                            child: Text(
                              '${data[index].name}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: Icon(
                              Icons.directions,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildDesc(context, index),
        ],
      ),
    );
  }

  Widget _buildDesc(context, index) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width * .5,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(blurRadius: 7, spreadRadius: 1, color: Colors.black12)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text('Ksh',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                  "${data[index].price.toInt()}/",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "months",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              "${data[index].sizeDesc}",
              style: TextStyle(
                color: Colors.black38,
              ),
            ),
            Row(
              children: <Widget>[
                // RatingBar(
                //   onRatingUpdate: (v) {},
                //   initialRating: data[index].review,
                //   itemSize: 12,
                //   itemBuilder: (context, index) => Icon(
                //     Icons.star,
                //     color: Colors.amber,
                //   ),
                // ),
                // Text(
                //   "${data[index].reviewCount.toInt()} reviews",
                //   style: TextStyle(color: Colors.black87, fontSize: 10),
                // ),
              ],
            ),
            // Row(
            //   children: <Widget>[
            //     ...data[index].personImages.map((img) {
            //       return Container(
            //         width: 25,
            //         height: 25,
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //             image: ExactAssetImage('assets/' + img + '.jpg'),
            //           ),
            //           borderRadius: BorderRadius.all(Radius.circular(50)),
            //         ),
            //       );
            //     }),
            //     Container(
            //       width: 25,
            //       height: 25,
            //       decoration: BoxDecoration(
            //         color: Colors.black26,
            //         borderRadius: BorderRadius.all(Radius.circular(50)),
            //       ),
            //       child: Center(
            //         child: Text(
            //           '23+',
            //           style: TextStyle(
            //             fontSize: 10,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Wrap(
              children: <Widget>[
                ...data[index].features.map((feature) {
                  return Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.only(
                      bottom: 6,
                      right: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      color: Colors.brown,
                    ),
                    child: Text(
                      feature,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  );
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

void customLaunch(command) async {
  if (await canLaunch(command)) {
    await launch(command);
  } else {
    print('could not launch $command');
  }
}

void launchWhatsapp({
  @required number,
  @required message,
}) async {
  String url = "whatsapp://send?phone=&number&text=&message";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('could not launch $url');
  }
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return (Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Rising Cock Agency '),
            accountEmail: Text(''),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/1.1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // ListTile(
          //   leading: Icon(Icons.map),
          //   title: Text('Favourites'),
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => GoogleMapScreen()));
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text('Settings'),
          //   onTap: () {
          //     print('friends');
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.share),
          //   title: Text('Share'),
          //   onTap: () {
          //     launchWhatsapp(number: 0794333606, message: "hello");
          //   },
          // ),
          // Divider(),
          ListTile(
            leading: Icon(Icons.call),
            title: Text('Call us'),
            onTap: () {
              customLaunch('tel:0794333606');
            },
          ),
          ListTile(
            leading: Icon(Icons.sms),
            title: Text('Text us'),
            onTap: () {
              customLaunch('sms:0794333606');
            },
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email us'),
            onTap: () {
              customLaunch('mailto: Enquiries@risingcock.co.ke');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
    ));
  }
}
