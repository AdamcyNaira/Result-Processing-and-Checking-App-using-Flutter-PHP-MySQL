import 'package:result/util/constants.dart';
import 'package:result/widgets/users_widget.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: exAppBar(title: "", context: context),
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
            Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'About Software',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Quando',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700),
              ),
            ),),
            SizedBox(height: 20.0,),
            Expanded(
              flex: 3,
              child: Center(
                          child: Image(
                            image:  AssetImage(
                            'img/pic6.png',
                            ),
                            fit: BoxFit.fill,
                            ),
                          ),),
                           SizedBox(
                  height: 25.0,
                ),
            Expanded(
              flex: 2,
              child: 
            Text(
                    'This is a flexible mobile app that allows computer science students to have access to thier accademic performance from the confort of thier home ',
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'raleway',
                        fontSize: 18,),
                        textAlign: TextAlign.center,
                  ),)
         ], 
        ),
      ),
    );
  }
}