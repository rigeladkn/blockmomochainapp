import 'package:blockmomochainapp/components/BmcAppbarComponent.dart';
import 'package:blockmomochainapp/controllers/navigation_controller.dart';
import 'package:blockmomochainapp/helpers/helpers.dart';
import 'package:blockmomochainapp/screens/home_screen.dart';
import 'package:blockmomochainapp/screens/recompense_screen.dart';
import 'package:blockmomochainapp/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

import '../components/BmcButtonComponent.dart';
import '../styles/style.dart';

class ScoreScreen extends StatefulWidget {
    double score;
    ScoreScreen({required this.score});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {

  Future<void> updateBadge() async {
    if(widget.score < 95){
      await Helpers.updateUserBadge(1);
    }
    else{
      await Helpers.updateUserBadge(20);
    }
  }
  
  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      updateBadge();
    });
    super.initState();
  }
  
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/svg/ic_star.svg'),
                SizedBox(width: 3,),
                Transform.translate(offset: Offset(0, -10),
                    child: SvgPicture.asset('assets/svg/ic_star.svg')),
                SizedBox(width: 3,),
                SvgPicture.asset('assets/svg/ic_star.svg'),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              width: 80,
              height: 80,
              // child: Text(userName == null ? '' : userName.substring(0,2).toUpperCase(),style: TextStyle(fontSize: AppStyle.size30,fontWeight: FontWeight.w500,fontFamily: 'Robotto'),),
              decoration: BoxDecoration(
                  color: AppColors.primaryYelloColor,
                  borderRadius: BorderRadius.circular(50)
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Text(widget.score >= 95.0 ? 'Félicitations !' : 'Désolé !',style: TextStyle(fontSize: AppStyle.size24,fontWeight: FontWeight.w500,fontFamily: 'MTN Brighter Sans',color: AppColors.black1Color),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/svg/ic_confetti.svg'),
                SizedBox(width: 5,),
                Column(
                  children: [
                    Text('Votre score',style: TextStyle(fontSize: AppStyle.size30,fontWeight: FontWeight.w500,fontFamily: 'MTN Brighter Sans',color: AppColors.black1Color),),
                    SizedBox(height: 15,),
                    Text('${widget.score.toStringAsFixed(2)}%',style: TextStyle(fontSize: AppStyle.size30,fontWeight: FontWeight.w500,fontFamily: 'MTN Brighter Sans',color: AppColors.black1Color),),
                  ],
                ),
                SizedBox(width: 5,),
                SvgPicture.asset('assets/svg/ic_confetti.svg'),
              ],
            ),
            SizedBox(height: 25,),
            Text(widget.score >= 95.0 ? 'Vous bénéficiez d’une récompense de 5000 Fcfa' : 'Vous aurez une meilleure chance plus tard', textAlign: TextAlign.center, style: TextStyle(fontSize: AppStyle.size16,fontWeight: FontWeight.w400,fontFamily: 'MTN Brighter Sans',color: AppColors.black1Color),),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            BmcButtonComponent(isYellowButton: true, text: 'Merci', onTap: () { Get.to(()=>HomeScreen()); },),
          ],
        ),
      ),
    );
  }

}
