import 'package:result/home/login.dart';
import 'package:result/screens/student/studentLogin.dart';
import 'package:result/util/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
     return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: screen.height,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          color: Colors.white30,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Center(
                        child: Text(
                            'Result Processing and Checking Mobile App \n For',
                            style: TextStyle(
                                color:  Constants.kPrimaryColor.withOpacity(0.8),
                                fontFamily: 'Raleway',
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                          ),
                          
                      ),
                      SizedBox(height: 5,),
                      Center(
                        child: Text(
                            'Department of Computer Science, Kaduna Polytechnic',
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'Satisfy',
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                          ),
                          
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Image.asset('img/stud.jpg'),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                   children: [
                     Container(
                      width: MediaQuery.of(context).size.width,
                      child: FlatButton(
                  color: Constants.kPrimaryColor.withOpacity(0.8),
                  child: Text(
                      'STUDENT PORTAL',
                      style: TextStyle(fontSize: 14),
                  ),
                  shape: OutlineInputBorder(
                      borderSide: BorderSide(color: Constants.kPrimaryColor.withOpacity(0.1), width: 2),
                      borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.all(18),
                  textColor: Colors.white,
                  onPressed: () {
                       Future.delayed(Duration.zero, () async{
                       await Navigator.push(context, MaterialPageRoute(builder: (context) => StudentLogin()));
                      });
                  },
                ),
                    ),
                    SizedBox(height: 20.0,),
                    Container(
                  width: MediaQuery.of(context).size.width,
                  child: FlatButton(
                    color: Colors.white,
                    child: Text(
                      'ADMIN LOGIN',
                      style: TextStyle(fontSize: 14),
                    ),
                    splashColor:  Constants.kPrimaryColor.withOpacity(0.8),
                    highlightColor: Constants.kPrimaryColor.withOpacity(0.8),
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(color: Constants.kPrimaryColor.withOpacity(0.5), width: 2),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.all(17),
                    textColor: Colors.black54,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminLogin()));
                    },
                  ),
                ),
                   ], 
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}