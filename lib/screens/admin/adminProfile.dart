
import 'package:flutter/material.dart';
import 'package:result/util/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminProfile extends StatefulWidget {
  @override
  _AdminProfileState createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {


    
 
      @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xffDAE0E2),
         body: Stack(
           fit: StackFit.expand,
           children: <Widget>[
             Column(
               children: <Widget>[
                 Container(
                   width: double.infinity,
                   height: 200,
                   decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                       Constants.kPrimaryColor.withOpacity(0.8),
                       Constants.kPrimaryColor.withOpacity(0.3),
                    ],
                    begin: Alignment.centerLeft,
                    end: new Alignment(1.0, 1.0),
                  ),
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[

                     ],
                   ),
                 )
               ],
             ),

             Positioned(
               top: 130,
               left: 110,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   CircleAvatar(
                     backgroundImage: AssetImage('img/user-icon.jpg'),
                     radius: 70,
                   )
                 ],
               ),
             ),

             Positioned(
               top: 290,
               left: 0,
               right: 0, 
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: 80,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(FontAwesomeIcons.userAlt),
                              ),
                            ),

                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("Administrator", style: TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w800,fontFamily: 'Alike'),),
                              ),
                            ),
                          ],
                        ),
                        Divider(height: 20,),

                        Row(
                          children: <Widget>[
                            Container(
                              width: 80,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(FontAwesomeIcons.school),
                              ),
                            ),

                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("Kaduna Polytechnic", style: TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w800,fontFamily: 'Alike'),),
                              ),
                            ),
                          ],
                        ),
                        Divider(height: 20,),

                             Row(
                          children: <Widget>[
                            Container(
                              width: 80,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(FontAwesomeIcons.tag
                                ),
                              ),
                            ),

                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("Administrator", style: TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w800,fontFamily: 'Alike'),),
                              ),
                            ),
                          ],
                        ),
                        Divider(height: 20,),

                        Row(
                          children: <Widget>[
                            Container(
                              width: 80,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(FontAwesomeIcons.mobile),
                              ),
                            ),

                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text('080XXXXXXXX', style: TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w800,fontFamily: 'Alike'),),
                              ),
                            ),
                          ],
                        ),
                        Divider(height: 20,),

                        
                        Row(
                          children: <Widget>[
                            Container(
                              width: 80,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(FontAwesomeIcons.mailBulk),
                              ),
                            ),

                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("info@kadunapolytechnic.com", style: TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w800,fontFamily: 'Alike'),),
                              ),
                            ),
                          ],
                        ),
                        Divider(height: 10,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              child: Center(
                                child: RaisedButton(
                                  
                                  color: Constants.kPrimaryColor.withOpacity(0.8),
                                  child: Text("Update Profile", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w800,fontFamily: 'Alike'),), 
                                  onPressed: () {
 
                                  },
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                 ],
               ),
             )
           ],
         ),
    );
  }
}