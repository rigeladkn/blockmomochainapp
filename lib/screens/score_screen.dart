import 'package:blockmomochainapp/components/BmcAppbarComponent.dart';
import 'package:blockmomochainapp/controllers/navigation_controller.dart';
import 'package:blockmomochainapp/screens/home_screen.dart';
import 'package:blockmomochainapp/screens/recompense_screen.dart';
import 'package:blockmomochainapp/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

import '../components/BmcButtonComponent.dart';
import '../styles/style.dart';

class ScoreScreen extends StatelessWidget {
    double score;
    ScoreScreen({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BmcAppbarComponent(title: 'Score',),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Center(child: CircleAvatar(child: Icon(Icons.check,size: 30,),radius: 40,backgroundColor: AppColors.primaryYelloColor1,)),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Text('${score.toStringAsFixed(2)}%',style: TextStyle(fontSize: AppStyle.size48,fontWeight: FontWeight.w500,fontFamily: 'MTN Brighter Sans',color: AppColors.black1Color),),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            BmcButtonComponent( text: 'Retour', onTap: () { Get.to(()=>HomeScreen()); },),
          ],
        ),
      ),
    );
  }
}
