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
      "name" : 'Ezeckiel',
      'phone' : '96179090'
    }
  ];

  String receiverPhone = '';
  int amount = 0;

  updateReceiverPhone(phone){
    receiverPhone = phone;
    update();
  }

  updateAmount(amountToSend){
    amount = amountToSend;
    update();
  }

  sendMoney(receiverPhone,amount) async {
    var result = await Services().makeTransfert(receiverPhone, amount);
    return result;
  }



}