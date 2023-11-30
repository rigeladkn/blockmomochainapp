import 'dart:convert';
import 'dart:developer';

import 'package:blockmomochainapp/services/services.dart';
import 'package:get/get.dart';

class TransfertController extends GetxController{
  List<Map<String,String>> favoritesContacts = [
    {
      "name" : 'Roland',
      'phone' : '97959090'
    },
    {
      "name" : 'Maryse',
      'phone' : '96959090'
    },
    {
      "name" : 'Berenice',
      'phone' : '62979090'
    },
    {
      "name" : 'Rigel',
      'phone' : '97967879'
    }
  ];

  String receiverPhone = '';
  int amount = 0;
  bool isLoading = false;

  updateReceiverPhone(phone){
    receiverPhone = phone;
    update();
  }

  updateAmount(amountToSend){
    amount = amountToSend;
    update();
  }

  Future<Map<String, dynamic>> sendMoney() async {
    loading(true);
    var result = await Services().makeTransfert(receiverPhone, amount);
    result = await jsonDecode(result);
    log('RRR ' + result.toString());
    loading(false);
    return result;
  }

  loading(value){
    isLoading = value;
    update();
  }

}