import 'dart:convert';
import 'dart:developer';

import 'package:blockmomochainapp/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/helpers.dart';
import '../screens/home_screen.dart';
import '../services/services.dart';

class AuthController extends GetxController{

  String email = '';
  String password = '';
  bool isLoading = false;

  updateEmail(value){
    email = value;
    update();
  }

  updatePassword(value){
    password = value;
    update();
  }

  Future<dynamic> login() async {
    loading(true);
    email = email.trim();
    password = password.trim();
    var response = await Services().login(email,password,true);
    response = jsonDecode(response);
    if(response['success']){
      await Helpers.saveToken(response['token']);
      await Helpers.saveUser(response['user']);
    }
    await Helpers.verifiyUserBadge();
    loading(false);
    return response;
  }

   loading(value){
    isLoading = value;
    update();
  }

  Future<dynamic> logout() async {
    loading(true);
    email = email.trim();
    password = password.trim();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    loading(false);
    Get.offAll(()=>LoginScreen());
  }

}