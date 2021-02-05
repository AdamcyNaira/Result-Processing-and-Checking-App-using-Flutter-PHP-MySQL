import 'dart:convert';
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Constants{
  static SharedPreferences sharedPref;
  static const kTextColor = Color(0XFF1E2432);
  static const kMediumTextColor = Color(0XFF53627C);
  static const kLightColor = Color(0XFFACB1C0);
  static const kPrimaryColor = Color(0XFF003049);
  static const kBackgroundColor = Color(0XFFFCFCFC);
  





  static Future<bool> saveImageToSharedPref(String value) async {

    sharedPref = await SharedPreferences.getInstance();
    return sharedPref.setString("key", value);
  }



  static Future<String> getImageFromPref() async {

    sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString("key");
  }


  static String base64Sring(Uint8List data) {

    return base64Encode(data);
  }


  static Image imageFromBase64String(String base64String) {

  return Image.memory(

    base64Decode(base64String),
    fit: BoxFit.fill,
  );
}



}



