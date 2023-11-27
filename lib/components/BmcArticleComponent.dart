import 'package:blockmomochainapp/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/style.dart';

class BmcArticleComponent extends StatelessWidget {
  dynamic article;
   BmcArticleComponent(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          color: AppColors.primaryYelloColor.withOpacity(0.25),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                // blurRadius: 10.0
            )
          ],
          borderRadius: BorderRadius.circular(23),
          border: Border.all(color: Colors.grey.withOpacity(0.1))
      ),
      child: ListTile(
        tileColor: Colors.transparent,
        leading: Image.asset(article['image']),
        title: Row(
          children: [
            Text(article['name'],style: TextStyle(fontSize: AppStyle.size16,fontWeight: FontWeight.w500,fontFamily: 'MTN Brighter Sans'),),
            Spacer(),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              decoration: BoxDecoration(color: AppColors.primaryYelloColor,borderRadius: BorderRadius.circular(10)),
                child: Text("+" + article['points'].toString(),style: TextStyle(fontSize: AppStyle.size13p94,fontWeight: FontWeight.w500,fontFamily: 'MTN Brighter Sans'),)),
          ],
        ),
      ),
    );
  }
}
