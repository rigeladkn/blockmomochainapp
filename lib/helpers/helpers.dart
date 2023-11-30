import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class Helpers {
  static Future<SharedPreferences> getSharedPrefs() async {
    SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
    return sharedPreferences;
  }
  static saveToken(token) async {
    SharedPreferences prefs = await getSharedPrefs();
    await prefs.setString('token', token);
  }

  static getUserToken() async {
    SharedPreferences prefs = await getSharedPrefs();
    if(prefs.containsKey('token')){
      return prefs.getString('token');
    }
    return null;
  }

  static formatDate(date){
    List refDate = date.split('T');
    var hour = refDate[1].split('.')[0];
    var rDate = refDate[0].split('-').reversed;
    var reversedDate = List.from(rDate);
    var d = reversedDate[0] + '/' + reversedDate[1] + '/' + reversedDate[2];
    return d + ',' + hour;
  }


  static reformatIntToPriceString(price){
    String priceS = price.toString();
    int prLength = priceS.length;
    int nmbOfSpace = prLength % 3;
    if(prLength < 4){
      return priceS;
    }
    String reformatedPrice = ' ';
    int j = 0;
    int k = 0;
    for(int i = prLength -1; i>= 0; i--){
      j++;
      if(j%3 == 0){
        reformatedPrice = priceS.substring(i,i+3) + ' ' + reformatedPrice;
        k++;
      }
    }
    reformatedPrice = nmbOfSpace == 0 ?  reformatedPrice : priceS.substring(0, prLength - reformatedPrice.trim().length + k -1) + ' ' + reformatedPrice;
    return reformatedPrice.trimRight();
  }
}