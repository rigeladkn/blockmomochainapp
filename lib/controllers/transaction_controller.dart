import 'dart:convert';
import 'dart:developer';

import 'package:blockmomochainapp/services/services.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController{
  List<dynamic> transactions = [
    {
      'type' : 'TRANSFERT',
      'name' : 'HOUNSOU Martunin',
      'date' : '16/12/2023, 08:09',
      'id' : '5925122982',
      'amount' : '15 000',
      'status' : 'RESOLVED',
    },
    {
      'type' : 'WITHDRAW',
      'name' : 'HOUNSOU Martunin',
      'date' : '16/12/2023, 08:09',
      'id' : '5925122982',
      'amount' : '15 000',
      'status' : 'ACCEPTED',
    },
    {
      'type' : 'TRANSFERT',
      'name' : 'HOUNSOU Martunin',
      'date' : '16/12/2023, 08:09',
      'id' : '5925122982',
      'amount' : '15 000',
      'status' : 'SUCCESS',
    },
    {
      'type' : 'WITHDRAW',
      'name' : 'HOUNSOU Martunin',
      'date' : '16/12/2023, 08:09',
      'id' : '5925122982',
      'amount' : '15 000',
      'status' : 'ACCEPTED',
    },
  ];

  Future<void> getTransactions() async {
    log('IN GET TRANSACTIONS');
    var trans = await Services().getUserTransactions();
    log('TRANS $trans');
    // transactions = trans;
    // log('TRANSACTIONS $transactions');
    update();
  }
}