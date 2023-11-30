import 'package:get/get.dart';

import '../services/services.dart';

class UserController extends GetxController{
  int balance = 0;
  List<Map<String,dynamic>> stats = [];


  getUserBalance() async {
    var b = await Services().getUserBalance();
    balance = b;
    update();
  }

}