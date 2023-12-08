import 'dart:convert';
import 'dart:developer';

import 'package:blockmomochainapp/services/services.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController{
  List<dynamic> transactions = [];
  // {
  //   'type' : 'TRANSFERT',
  //   'name' : 'HOUNSOU Martunin',
  //   'date' : '16/12/2023, 08:09',
  //   'id' : '5925122982',
  //   'amount' : 15000,
  //   'status' : 'RESOLVED',
  // },
  // {
  //   'type' : 'WITHDRAW',
  //   'name' : 'HOUNSOU Martunin',
  //   'date' : '16/12/2023, 08:09',
  //   'id' : '5925122982',
  //   'amount' : 15000,
  //   'status' : 'ACCEPTED',
  // },
  // {
  //   'type' : 'TRANSFERT',
  //   'name' : 'HOUNSOU Martunin',
  //   'date' : '16/12/2023, 08:09',
  //   'id' : '5925122982',
  //   'amount' : 15000,
  //   'status' : 'SUCCESS',
  // },
  // {
  //   'type' : 'WITHDRAW',
  //   'name' : 'HOUNSOU Martunin',
  //   'date' : '16/12/2023, 08:09',
  //   'id' : '5925122982',
  //   'amount' : 15000,
  //   'status' : 'ACCEPTED',
  // },
  bool isLoading = true;

  Future<void> getTransactions() async {
    loading(true);
    log('IN GET TRANSACTIONS');
      transactions = await Services().getUserTransactions();
    // log('TRANS $trans');
    // transactions = trans;
    update();
    loading(false);
  }


  loading(value){
    isLoading = value;
    update();
  }
}