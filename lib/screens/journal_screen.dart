import 'package:blockmomochainapp/components/BmcAppbarComponent.dart';
import 'package:blockmomochainapp/styles/colors.dart';
import 'package:blockmomochainapp/styles/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/TransactionComponent.dart';
import '../controllers/transaction_controller.dart';
import '../helpers/helpers.dart';
import '../widgets/TransactionsWidget.dart';

class JournalScreen extends StatefulWidget {
  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  TransactionController transactionController = Get.find();

  @override
  void initState() {
    getStats();
    super.initState();
  }

  getStats() async {
    // Future.delayed(Duration.zero,() async {
      await transactionController.getStats();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BmcAppbarComponent(title : 'Journal des transactions'),
      body: ListView(
        children: [
          GetBuilder(
            builder: (TransactionController transactionController) {
              return transactionController.isLoading ? Container(height : 50,child: Center(child: CupertinoActivityIndicator())) : Container(
                color: AppColors.grey4Color,
                padding: EdgeInsets.all(20),
              child:

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Row(
                            children: [
                              Text(Helpers.reformatIntToPriceString(transactionController.stats['sentAmount']),style: TextStyle(fontSize: AppStyle.size28,fontWeight: FontWeight.w700,fontFamily: 'MTN Brighter Sans'),),
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
                          Text(Helpers.reformatIntToPriceString(transactionController.stats['receivedAmount']),style: TextStyle(fontSize: AppStyle.size28,fontWeight: FontWeight.w700,fontFamily: 'MTN Brighter Sans',color: AppColors.greenColor),),
                          Transform.translate(
                              offset: Offset(3, -10),
                              child: Text("CFA",style: TextStyle(fontSize: AppStyle.size15,fontWeight: FontWeight.w700,fontFamily: 'MTN Brighter Sans',color: AppColors.greenColor),)),
                        ],
                      ),
                      SizedBox(height: 2,),
                      Text('Total d’argent reçu de la semaine',style: TextStyle(fontSize: AppStyle.size13,fontWeight: FontWeight.w400,fontFamily: 'MTN Brighter Sans',),),
                    ],
                  )

              );
            }
          ),
         Padding(padding: EdgeInsets.all(20),child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(height: 30,),
             Text('Vos transactions',style: TextStyle(fontWeight: FontWeight.w500,fontSize : AppStyle.size16,fontFamily: 'MTN Brighter Sans'),),
             SizedBox(height: 16,),
             TransactionsWidget()
           ],
         ),),

        ],
      ),
    );
  }


}
