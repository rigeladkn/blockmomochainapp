import 'dart:developer';

import 'package:blockmomochainapp/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../components/TransactionComponent.dart';
import '../controllers/transaction_controller.dart';
import '../models/Transaction.dart';

class TransactionsWidget extends StatefulWidget {
  int? limit;
  TransactionsWidget({this.limit = 0});

  @override
  State<TransactionsWidget> createState() => _TransactionsWidgetState();
}

class _TransactionsWidgetState extends State<TransactionsWidget> {
  TransactionController transactionController = Get.put(TransactionController());

  void getTransactions(){
    Future.delayed(Duration.zero,(){
      transactionController.getTransactions();
      log(transactionController.transactions.toString());
    });
  }
  @override
  void initState() {
    getTransactions();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  GetBuilder(
      builder: (TransactionController transactionController) {
        return Container(
          height: widget.limit == 0 ? 150.0 * transactionController.transactions.length : widget.limit! <= transactionController.transactions.length ? widget.limit!.toDouble() * 150.0 : 150.0 * transactionController.transactions.length ,
          child: transactionController.isLoading && transactionController.transactions.length == 0 ? Column(
            children: [
              SizedBox(height: 30,),
              CupertinoActivityIndicator(animating: true,color: AppColors.primaryColor,),
            ],
          ) :  !transactionController.isLoading && transactionController.transactions.length == 0 ? Column(
            children: [
              SizedBox(height: 30,),
              Text('Aucune transaction pour le moment'),
            ],
          ) : ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.limit == 0 ? transactionController.transactions.length : widget.limit! <= transactionController.transactions.length ? widget.limit! : transactionController.transactions.length,
              itemBuilder: (context,index){
                return TransactionComponent(transaction: Transaction.fromJson(transactionController.transactions[index]),);
              })
        );
      }
    );
  }
}
