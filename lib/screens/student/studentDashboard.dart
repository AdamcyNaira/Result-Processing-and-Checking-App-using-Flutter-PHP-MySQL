import 'package:flutter/material.dart';
import 'package:result/home/home.dart';
import 'package:result/screens/admin/about.dart';
import 'package:result/screens/student/studentProfile.dart';
import 'package:result/util/constants.dart';
import 'package:result/widgets/users_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'notifications.dart';
import 'resultList.dart';

class StudentDashboard extends StatefulWidget {
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  final int hnd2 = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: buildAppBar(context),
      body: Container(
        color: Constants.kPrimaryColor.withOpacity(0.03),
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Expanded(
             flex: 2,
             child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 2,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('img/user-icon.jpg'),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome Back! ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Quando',
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Student Result Checking Portal',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: 'raleway',
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 5.0),
                      child: Text(
                          'Get access to your acadamic performance from the comfort of your home with few clicks',
                          style: TextStyle(
                           color: Colors.black
                          ),
                          ),
                    ),
                  ],
                ),
              ),
            ),
           ),
           SizedBox(
              height: 20.0,
            ),
           Expanded(
             flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Padding(
              padding: const EdgeInsets.only(left:5.0, right: 5.0),
              child: Container(
                child: Text(
                  'Menu ',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Quando',
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                padding: const EdgeInsets.all(4.0),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                shrinkWrap: true,
                children: [
                  chooseLevel(
                    context, 
                    "My Result", 
                    () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GetResultList()));
                    },
                    Color(0xff85c3ff),
                    Icon(Icons.picture_as_pdf, size: 18,), 
                    ),
                    chooseLevel(
                    context, 
                    "Notifications", 
                    () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => GetNotifications()));
                    },
                    Color(0xff7984ee),
                    Icon(Icons.notifications, size: 18,), 
                    ),
                   
                ]),
             ], 
            ),
           ),
            SizedBox(
              height: 20.0,
            ),

           Expanded(
             flex: 3,
            child:  Column(
             children: [
                myMenu(
              icon1: FontAwesomeIcons.user, 
              title: "My Profile", 
              icon2: Icons.arrow_forward_ios, 
              route: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StudentProfile()));
              }
              ),
      myMenu(
              icon1: FontAwesomeIcons.bell, 
              title: "Notifications", 
              icon2: Icons.arrow_forward_ios, 
              route: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GetNotifications()));
              }
              ),
      myMenu(
              icon1: FontAwesomeIcons.powerOff, 
              title: "Log Out", 
              icon2: Icons.arrow_forward_ios, 
              route: () {
                     Constants.sharedPref.clear();
                     Constants.sharedPref.commit();
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
              }
              ),
             ], 
            ),
           ),
 
          ], 
        ),
      ),
    );
  }
}

Widget chooseLevel(context, String text, Function route, Color color1, Icon iconn ) {
  return Container(
    child: Card(
      color: color1,
      child: InkWell(
        highlightColor: Constants.kPrimaryColor.withOpacity(0.3),
        onTap: route,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           Padding(
             padding: const EdgeInsets.only(left: 5.0, top: 5.0),
             child: Align(
               alignment: Alignment.topLeft,
               child: CircleAvatar(
                 radius: 15,
                child: iconn
               ),
             ),
           ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Quando',
                color: Colors.black,
              ),
            ),
            Divider(
              height: 15.0,
              color: Colors.white,
              
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  SizedBox(width: 60,),
                    Text(
                      "View",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Quando',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                Icon(Icons.arrow_forward_ios, size: 20,),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  final menu = [
    new StudentDashboard(),
    new About(),
    new StudentProfile(),
  ];
  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menu.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.home,
              size: 15.0,
            ),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.infoCircle,
              size: 15.0,
            ),
            title: Text(
              'About',
              style: TextStyle(fontSize: 12.0),
            ),
          ),
         
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.userCircle,
              size: 15.0,
            ),
            title: Text(
              'Account',
              style: TextStyle(fontSize: 12.0),
            ),
          ),
        ],
        fixedColor: Constants.kPrimaryColor.withOpacity(0.5),
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        elevation: 5,
        backgroundColor: Colors.white,
      ),
    );
  }
}


myMenu({Function route, IconData icon1, String title, IconData icon2}){
   return Column(
              children: <Widget>[
                Container(
                  height: 50.0,
                  color: Colors.white,
                  child: InkWell(
                    onTap: route,
                    child:Container(
                      padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                        children: <Widget>[
                          Icon(icon1, color: Colors.black87, size: 20.0,),
                          SizedBox(width: 20.0),
                          Text(
                            title,
                            style: TextStyle(fontSize: 16.0,  color: Colors.black87, fontFamily: 'SourceSerifPro' ), 
                            ),
                        ],
                      ),
                      Icon(icon2, color: Colors.black87, size: 15,),
                        ],
                      ),
                    )
                  )
                ),
                SizedBox(height: 10.0,),
              ],
            );
 }