import 'package:result/home/home.dart';
import 'package:result/screens/student/notifications.dart';
import 'package:result/screens/student/studentDashboard.dart';
import 'package:result/util/constants.dart';
import 'package:result/widgets/users_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StudentAccount extends StatefulWidget {
  @override
  _StudentAccountState createState() => _StudentAccountState();
}

class _StudentAccountState extends State<StudentAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: singleAppBar(title: " ", context: context),
      body: Container(
        color: Constants.kPrimaryColor.withOpacity(0.03),
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
              SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'My Account',
                style: TextStyle(
                    color: Colors.black54,
                    fontFamily: 'Quando',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 30.0,),
           Container(
    height: MediaQuery.of(context).size.height * 0.22,
    width: MediaQuery.of(context).size.width,
    child: Card(
      child: InkWell(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('img/nacossLogo.png',),
          ],
        ),
      ),
    ),
  ),
      SizedBox(height: 15.0,),
      myMenu(
              icon1: FontAwesomeIcons.bookOpen, 
              title: "My Courses", 
              icon2: Icons.arrow_forward_ios, 
              route: () {
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNav()));
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
              icon1: FontAwesomeIcons.signOutAlt, 
              title: "Log Out", 
              icon2: Icons.arrow_forward_ios, 
              route: () {
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
              }
              ),
         ], 
        ),
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