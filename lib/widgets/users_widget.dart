import 'package:flutter/material.dart';
import 'package:result/screens/student/notifications.dart';
import 'package:result/screens/student/studentProfile.dart';
import 'package:result/util/constants.dart';
AppBar buildAppBar(context) {
  return AppBar(
    backgroundColor: Constants.kPrimaryColor.withOpacity(.03),
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.menu,
      ),
      onPressed: () {
      
      },
      color: Constants.kPrimaryColor.withOpacity(0.5),
    ),
    title: Text(
      "Dashboard",
      style: TextStyle(
        fontFamily: " ",
        color: Colors.black,
        fontSize: 18.0
      ),
      ),

    actions: [
      IconButton(
        icon: Icon(Icons.notifications),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()));
        },
        color: Constants.kPrimaryColor.withOpacity(0.5),
      ),
      IconButton(
        icon: Icon(Icons.settings),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => StudentProfile()));
        },
        color: Constants.kPrimaryColor.withOpacity(0.5),
      ),
    ],
  );
}


AppBar singleAppBar({String title, context}) {
  return AppBar(
    backgroundColor: Constants.kPrimaryColor.withOpacity(.03),
    elevation: 0,
    leading: IconButton(
      icon: Icon(
         Icons.arrow_back_ios,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      color: Constants.kPrimaryColor.withOpacity(0.5),
    ),
    title: Text(
      title,
      style: TextStyle(
        fontFamily: " ",
        color: Colors.black54,
        fontSize: 18.0
      ),
      ),
  );
}

AppBar exAppBar({String title, context}) {
  return AppBar(
    backgroundColor: Constants.kPrimaryColor.withOpacity(.03),
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: IconButton(
        icon: Icon(
           Icons.close,
           size: 30,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        color: Constants.kPrimaryColor.withOpacity(0.5),
      ),
    ),
    title: Text(
      title,
      style: TextStyle(
        fontFamily: " ",
        color: Colors.black54,
        fontSize: 18.0
      ),
      ),
  );
}

AppBar loginAppBar({String title, context}) {
  return AppBar(
    backgroundColor: Constants.kPrimaryColor.withOpacity(.02),
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: IconButton(
        icon: Icon(
           Icons.close,
           size: 30,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        color: Constants.kPrimaryColor.withOpacity(0.5),
      ),
    ),
    title: Text(
      title,
      style: TextStyle(
        fontFamily: " ",
        color: Colors.black54,
        fontSize: 18.0
      ),
      ),
  );
}


AppBar longAppBar({String title, context}) {
  return AppBar(
    backgroundColor: Constants.kPrimaryColor.withOpacity(0.3),
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
      ),
      onPressed: () {
       Navigator.pop(context);
      },
      color: Colors.white,
    ),
    title: Text(
      title,
      style: TextStyle(
        fontFamily: " ",
        color: Colors.black54,
        fontSize: 18.0
      ),
      ),
  );
}




AppBar requestAppBar({String title, context}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios, color: Colors.black54
      ),
      onPressed: () {
       Navigator.pop(context);
      },
      color: Colors.white,
    ),
    title: Text(
      title,
      style: TextStyle(
        fontFamily: " ",
        color: Colors.black54,
        fontSize: 18.0
      ),
      ),
  );
}

Widget topMenu({String title, IconData icon, Color color, Function route}) {
  return InkWell(
    onTap: route,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
          size: 25.0,
        ),
        SizedBox(
          height: 10.0, 
        ),
        Text(
          title,
          style: TextStyle(fontSize: 12.0),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}



Widget dashboardCards({String title, String total, Widget icon, Color bg}) {
  return Card(
    child: Container(
      decoration: BoxDecoration(
       color: bg, 
       borderRadius: BorderRadius.circular(4.0)
      ),
      padding: EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 40,
            child: icon,
          ),
          SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text(
                title,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                total,
                style: TextStyle(fontWeight: FontWeight.w500,),
                overflow: TextOverflow.ellipsis,
              ),
              
            ],
          ),
        ],
      ),
    ),
  );
}





Widget menus({String title, IconData icon, Color color}) {
  return InkWell(
    onTap: (){},
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Color(0XFFEAF0F1),
          child: Icon(
            icon, color: color,
            size: 25.0,
          ),
        ),
        SizedBox(
          height: 10.0, 
        ),
        Text(
          title,
          style: TextStyle(fontSize: 12.0),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}


Widget newsCards({String title, String total, Widget icon, Color bg}) {
  return Card(
    child: Container(
      decoration: BoxDecoration(
       color: bg, 
       borderRadius: BorderRadius.circular(4.0)
      ),
      padding: EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  title,
                 style: TextStyle(),
                 textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
           SizedBox(
                width: 10.0,
              ),
              Container(
            width: 100,
            height: 80,
            child: icon,
          ),
         
        ],
      ),
    ),
  );
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
                      Icon(icon2, color: Colors.black87,),
                        ],
                      ),
                    )
                  )
                ),
                SizedBox(height: 10.0,),
              ],
            );
 }


 class DynamicWidget extends StatelessWidget {
  TextEditingController questionController = new TextEditingController(); 
  TextEditingController aController = new TextEditingController();
  TextEditingController bController = new TextEditingController(); 
  TextEditingController cController = new TextEditingController();
  TextEditingController dController = new TextEditingController(); 
  TextEditingController answerController = new TextEditingController();
  final formKey = new GlobalKey<FormState>();
 
  bool isLoading = false;

  String question;
  String a;
  String b;
  String c;
  String d;
  String answer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Colors.teal
              ),
              child: Text('Question  2', style: TextStyle(fontFamily: 'Alike', fontWeight: FontWeight.w600,color: Colors.white),)
              ),
            SizedBox(height: 10,),
         TextFormField(
                maxLines: 3,
                controller: questionController,
                onSaved: (val) => question = val,
                validator: (val) => val.length == 0
                          ? 'Enter test question'
                          : null,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  hintText: 'Question',
                   filled: true,  
                    fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[800]),
                        borderRadius: BorderRadius.circular(5), 
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[600],style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(5),
                    ),
                )
              ),
              Divider(height: 10,),
                TextFormField(
                maxLines: 1,
                controller: aController,
                onSaved: (val) => a = val,
                validator: (val) => val.length == 0
                          ? 'Enter option A'
                          : null,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  hintText: 'A',
                   filled: true,  
                    fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[800]),
                        borderRadius: BorderRadius.circular(5), 
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[600],style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(5),
                    ),
                )
              ),
              Divider(height: 10,),
                TextFormField(
                maxLines: 1,
                controller: bController,
                onSaved: (val) => b = val,
                 validator: (val) => val.length == 0
                          ? 'Enter option B'
                          : null,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  hintText: 'B',
                   filled: true,  
                    fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[800]),
                        borderRadius: BorderRadius.circular(5), 
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[600],style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(5),
                    ),
                )
              ),
              Divider(height: 10,),
                TextFormField(
                maxLines: 1,
                controller: cController,
                onSaved: (val) => c = val,
                validator: (val) => val.length == 0
                          ? 'Enter option C'
                          : null,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  hintText: 'C',
                   filled: true,  
                    fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[800]),
                        borderRadius: BorderRadius.circular(5), 
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[600],style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(5),
                    ),
                )
              ),
              Divider(height: 10,),
                TextFormField(
                maxLines: 1,
                controller: dController,
                onSaved: (val) => d = val,
                validator: (val) => val.length == 0
                          ? 'Enter option D'
                          : null,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  hintText: 'D',
                   filled: true,  
                    fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[800]),
                        borderRadius: BorderRadius.circular(5), 
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[600],style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(5),
                    ),
                )
              ),
              Divider(height: 10,),
                TextFormField(
                maxLines: 1,
                controller: answerController,
                onSaved: (val) => answer = val,
                validator: (val) => val.length == 0
                          ? 'Enter correct answer'
                          : null,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  hintText: 'Answer',
                   filled: true,  
                    fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[800]),
                        borderRadius: BorderRadius.circular(5), 
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[600],style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(5),
                    ),
                )
              ),
              Divider(height: 20, color: Colors.teal,),
          ],
        );
  }
}



 formTextStyle() {
  return TextStyle(
    fontSize: 12,
    color: Colors.black54,
    fontFamily: 'Raleway',
  );
}








  List<DropdownMenuItem<String>> classItems = [];
  List<DropdownMenuItem<String>> semesterItems = [];
    String selectedClass ;
    String selectedSemester ;

    

   void loadData () { 
     classItems = [];
     semesterItems = [];

     classItems.add(new DropdownMenuItem(
     child: Text('ND-I', style: formTextStyle(),),
     value: 'ND-I',
   ));

   classItems.add(new DropdownMenuItem(
     child: Text('ND-II', style: formTextStyle(),),
     value: 'ND-II',
   ));

    classItems.add(new DropdownMenuItem(
     child: Text('HND-I', style: formTextStyle(),),
     value: 'HND-I',
   ));

   classItems.add(new DropdownMenuItem(
     child: Text('HND-II', style: formTextStyle(),),
     value: 'HND-II',
   ));





    semesterItems.add(new DropdownMenuItem(
     child: Text('First Semester', style: formTextStyle(),),
     value: 'First Semester',
   ));

   semesterItems.add(new DropdownMenuItem(
     child: Text('Second Semester', style: formTextStyle(),),
     value: 'Second Semester',
   ));

   }