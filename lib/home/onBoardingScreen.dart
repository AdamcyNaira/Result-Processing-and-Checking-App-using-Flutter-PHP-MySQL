import 'package:result/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:result/util/constants.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final int _numPages =3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _builPageIndicatior(){
    List<Widget> list = [];
    for (var i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive){
      return AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        height: 8.0,
        width: isActive ? 24.0 : 16.0,
        decoration: BoxDecoration(
         color: isActive ?  Constants.kPrimaryColor.withOpacity(0.6) : Colors.grey[200],
         borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Expanded(
              //   flex: 1,
              //   child: 
              //   Container(
              //   alignment: Alignment.centerRight,
              //   child: FlatButton(onPressed: () {
              //     _pageController.jumpToPage(3);
              //   }, 
              //   child: Text(
              //         'Skip',
              //         style: TextStyle(
              //             color: Colors.black,
              //             fontFamily: 'raleway',
              //             fontSize: 20,),
              //             textAlign: TextAlign.center,
              //       ),
              //   ),
              // ),           
              // ),
              Expanded(
                flex: 6,
                child:  Container(
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page){
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [ 
                   
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 120.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Center(
                          child: Image(
                            image:  AssetImage(
                            'img/pic1.png',
                            ),
                            height: 250,
                            width: 300,
                            ),
                          ),
                          flex: 2,
                          ),
                           SizedBox(
                  height: 25.0,
                ),
               Expanded(child: 
                Text(
                  'Result processing and checking mobile app for the department of computer science, Kaduna polytechnic. ',
                  style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Raleway',
                        fontSize: 16,),
                        textAlign: TextAlign.center,
                ),
                flex: 1,
                ),
                        ],
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 140.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Expanded(child: 
                          Center(
                          child: Image(
                            image:  AssetImage(
                            'img/pic7.png',
                            ),
                            height: 250,
                            width: 300,
                            ),
                            
                            ),
                            flex: 2,
                          ),
                           SizedBox(
                  height: 25.0,
                ),
               Expanded(child:  Text(
                  'Get access to your acadamic performance with few clicks',
                  style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Raleway',
                        fontSize: 16,),
                        textAlign: TextAlign.center,
                ),
                flex: 1,
                )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 120.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Expanded(child: 
                          Center(
                          child: Image(
                            image:  AssetImage(
                            'img/pic8.png',
                            ),
                            height: 250,
                            width: 300,
                            ),
                          ),
                          flex: 2,
                          
                          ),
                           SizedBox(
                  height: 25.0,
                ),
               Expanded(child: 
                Text(
                  'Download and install the app to get started',
                  style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'raleway',
                        fontSize: 17,),
                        textAlign: TextAlign.center,
                ),
                flex: 1,
                )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ),
             
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _builPageIndicatior(),
              ),
              _currentPage != _numPages-1 
              ?
              Expanded(
                flex: 1,
                child: Align(
                 alignment: FractionalOffset.bottomCenter,
                 child: Container(
                   padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  width: MediaQuery.of(context).size.width,
                  child: FlatButton(
                  color: Constants.kPrimaryColor.withOpacity(0.8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        SizedBox(width: 30,),
                      Expanded(
                        flex: 8,
                        child: Text(
                        'NEXT',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 0,),
                     Expanded(
                       flex: 1,
                       child: Icon(
                        Icons.arrow_forward_ios,
                       ),
                     )
                    ],
                  ),
                  shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Constants.kPrimaryColor.withOpacity(0.1), width: 2),
                  borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.all(15),
                  textColor: Colors.white,
                  onPressed: () {
                   _pageController.nextPage(
                       duration: Duration(milliseconds: 500,), 
                       curve: Curves.ease); 
                  },
                ),
                    ), 

                ),
              ) :  Expanded(
                flex: 1,
                child: Align(
                 alignment: FractionalOffset.bottomCenter,
                 child: Container(
                   padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  width: MediaQuery.of(context).size.width,
                  child: FlatButton(
                  color: Constants.kPrimaryColor.withOpacity(0.8),
                  child: Text(
                  'GET STARTED',
                  style: TextStyle(fontSize: 14),
                  ),
                  shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Constants.kPrimaryColor.withOpacity(0.1), width: 2),
                  borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.all(18),
                  textColor: Colors.white,
                  onPressed: () {
                   Constants.sharedPref.setBool("isActive", true);
                    Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()));
                  },
                ),
                    ), 

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
