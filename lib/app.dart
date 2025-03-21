import 'package:blockmomochainapp/screens/home_screen.dart';
import 'package:blockmomochainapp/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool hasToken = false;
  checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey('token')){
      setState(() {
        hasToken = true;
      });
    }
    else{
      setState(() {
        hasToken = false;
      });
    }
  }

  @override
  void initState() {
    Future.delayed(Duration.zero,() async {
      await checkToken();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: hasToken ? HomeScreen() : LoginScreen(),
    );
  }
}
