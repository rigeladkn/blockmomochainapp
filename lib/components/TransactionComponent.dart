import 'package:blockmomochainapp/helpers/helpers.dart';
import 'package:blockmomochainapp/styles/colors.dart';
import 'package:blockmomochainapp/styles/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class TransactionComponent extends StatelessWidget {
  dynamic transaction;
    TransactionComponent({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.only(bottom: 8,left: 1,right: 1,top: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5
            )
          ]
      ),
      child: ListTile(
        titleAlignment : ListTileTitleAlignment.top,
        horizontalTitleGap : 10,
        leading: CircleAvatar(
            radius:16, backgroundColor : transaction.type == 'TRANSFERT' ? AppColors.greenColor.withOpacity(0.1) : AppColors.redColor.withOpacity(0.1),child: SvgPicture.asset(transaction.type == 'TRANSFERT' ? 'assets/svg/ic_wallet.svg' : 'assets/svg/ic_logout.svg')),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(transaction.type == 'TRANSFERT' ? 'Transfert effectué à' : 'Paiement reçu de' ,style: TextStyle(fontWeight: FontWeight.w400,fontSize : AppStyle.size13,fontFamily: 'MTN Brighter Sans',color: transaction.type == 'TRANSFERT' ? AppColors.greenColor : AppColors.redColor),),
            SizedBox(height: 5,),
            Text(transaction.type == 'TRANSFERT' ? transaction.receiver['firstname'] +' '+transaction.receiver['lastname']: transaction.sender['firstname']+' '+transaction.sender['lastname'],style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'MTN Brighter Sans'),),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Helpers.formatDate(transaction.createdAt),style: TextStyle(fontWeight: FontWeight.w400,fontSize : AppStyle.size12,fontFamily: 'MTN Brighter Sans',color: AppColors.greyColor),),
                Text('ID ${transaction.transactionId.substring(0,11).toUpperCase()}',style: TextStyle(fontWeight: FontWeight.w400,fontSize : AppStyle.size12,fontFamily: 'MTN Brighter Sans',color: AppColors.greyColor),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Helpers.reformatIntToPriceString(transaction.amount) + ' CFA',style: TextStyle(fontWeight: FontWeight.w500,fontSize : AppStyle.size15,fontFamily: 'MTN Brighter Sans'),),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                    decoration: BoxDecoration(color: ['RESOLVED','SUCCESS'].contains(transaction.status) ? AppColors.greenColor.withOpacity(0.1): AppColors.orangeColor.withOpacity(0.1),borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        ['RESOLVED','SUCCESS'].contains(transaction.status)  ? Icon(Icons.check,color: AppColors.greenColor,) : Icon(Icons.refresh,color: AppColors.orangeColor,),
                        SizedBox(width: 5,),
                        Text(transaction.status == 'RESOLVED' ? 'Synchronisée' : transaction.status == 'SUCCESS' ? 'Réussie' : 'Acceptée',style: TextStyle(fontWeight: FontWeight.w400,fontSize : AppStyle.size12,fontFamily: 'MTN Brighter Sans',color: ['RESOLVED','SUCCESS'].contains(transaction.status) ? AppColors.greenColor : AppColors.orangeColor),),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
