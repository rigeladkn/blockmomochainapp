import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    var response = await Services().login(email,password,true);
    response = jsonDecode(response);
    if(response['success']){
      Helpers.saveToken(response['token']);
    }
    loading(false);
    return response;
  }

   loading(value){
    isLoading = value;
    update();
  }

}