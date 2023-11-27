import 'package:blockmomochainapp/components/BmcAppbarComponent.dart';
import 'package:blockmomochainapp/styles/colors.dart';
import 'package:blockmomochainapp/styles/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/TransactionComponent.dart';
import '../controllers/transaction_controller.dart';

class JournalScreen extends StatelessWidget {
  TransactionController transactionController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BmcAppbarComponent(title : 'Journal des transactions'),
      body: ListView(
        children: [
          Container(
            color: AppColors.grey4Color,
            padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('72 000',style: TextStyle(fontSize: AppStyle.size28,fontWeight: FontWeight.w700,fontFamily: 'MTN Brighter Sans'),),
                  Transform.translate(
                      offset: Offset(3, -10),
                      child: Text("CFA",style: TextStyle(fontSize: AppStyle.size15,fontWeight: FontWeight.w700,fontFamily: 'MTN Brighter Sans'),)),
                ],
              ),
              SizedBox(height: 2,),
              Text('Total des transferts de la semaine',style: TextStyle(fontSize: AppStyle.size13,fontWeight: FontWeight.w400,fontFamily: 'MTN Brighter Sans'),),
              SizedBox(height: 18,),
              Row(
                children: [
                  Text('148 000',style: TextStyle(fontSize: AppStyle.size28,fontWeight: FontWeight.w700,fontFamily: 'MTN Brighter Sans',color: AppColors.greenColor),),
                  Transform.translate(
                      offset: Offset(3, -10),
                      child: Text("CFA",style: TextStyle(fontSize: AppStyle.size15,fontWeight: FontWeight.w700,fontFamily: 'MTN Brighter Sans',color: AppColors.greenColor),)),
                ],
              ),
              SizedBox(height: 2,),
              Text('Total d’argent reçu de la semaine',style: TextStyle(fontSize: AppStyle.size13,fontWeight: FontWeight.w400,fontFamily: 'MTN Brighter Sans',),),
            ],
          ),),
         Padding(padding: EdgeInsets.all(20),child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(height: 30,),
             Text('Vos transactions',style: TextStyle(fontWeight: FontWeight.w500,fontSize : AppStyle.size16,fontFamily: 'MTN Brighter Sans'),),
             SizedBox(height: 16,),
             GetBuilder<TransactionController>(builder: (  transactionController){
               return Container(
                 height: 150.0 * transactionController.transactions.length,
                 child: ListView.builder(
                     shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                     itemCount: transactionController.transactions.length,
                     itemBuilder: (context,index){
                       return TransactionComponent(transaction: transactionController.transactions[index],);
                     }),
               );
             }),
           ],
         ),),

        ],
      ),
    );
  }
}
