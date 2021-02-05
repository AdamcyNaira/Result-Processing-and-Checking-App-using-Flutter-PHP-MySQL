import 'dart:async';
import 'package:result/home/home.dart';
import 'package:result/home/onBoardingScreen.dart';
import 'package:result/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  var spinkit = SpinKitThreeBounce(
  color: Constants.kPrimaryColor.withOpacity(0.8),
  size: 20.0,
);


 var spinkitWave = SpinKitWave(
  color: Constants.kPrimaryColor.withOpacity(0.8),
  size: 30.0,
);

var ss =  SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.red : Colors.green,
      ),
    );
  },
);

bool  isActive ;



   @override
  void initState(){
    super.initState();
    isActive = Constants.sharedPref.getBool("isActive");
    Timer(Duration(seconds: 4), (){
     isActive !=null ? Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Home(),
      ))
      :
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => OnBoardingScreen(),
      ));
    });
  }
  
   @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]
    );
    return Scaffold(
   backgroundColor: Constants.kPrimaryColor.withOpacity(.03),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
         decoration: BoxDecoration(
                 color: Color(0xfffbfbff),
                ),
        child: Stack(
        children: <Widget>[
          // Opacity(
          //   opacity: 0.3,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(8.0),
          //       image: DecorationImage(
          //         image: AssetImage('images/team.png'),
          //         fit: BoxFit.fill
          //       ),
          //     ),
          //   ),
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center, 
            mainAxisAlignment: MainAxisAlignment.center, 
            children: <Widget>[
            Expanded(child:  Padding(
                padding: const EdgeInsets.only(top:220.0),
                child: Image(
                            image:  AssetImage(
                            'img/icon.png',
                            ),
                            ),
                // Image.Asset('img/kadpoly.png'),
              ), 
              flex: 5, 
            ),


              SizedBox(
                height: 34.0,
              ),
                // Center(
                //   child: Text(
                //     'Result Processing ',
                //     style: TextStyle(
                //         color: Colors.black,
                //         fontFamily: 'Raleway',
                //         fontSize: 15.0,
                //         fontWeight: FontWeight.w700),
                //   ),
                // ),   
               SizedBox(
                height: 20.0,
              ),
              Expanded(child: 
               Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: Container(
                  child: Center(
                   child: Text("DEPARTMENT OF COMPUTER SCIENCE DEPARTMENT \n KADUNA POLYTECHNIC",
                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.black, fontFamily: 'Raleway'),textAlign: TextAlign.center,
                   ),
                  ),
                ),
              ),
              flex: 1,
              ),
             
               SizedBox(
                height: 20.0,
              ),
              Expanded(child: 
              Container(
                child: spinkitWave,
              ),
              flex: 1,
              ),
            
            ],
          )
        ],
      ),
      ),  
    );
  }
} 