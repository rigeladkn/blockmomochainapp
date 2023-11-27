import 'package:blockmomochainapp/controllers/recompense_controller.dart';
import 'package:blockmomochainapp/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:svg_flutter/svg.dart';

import '../components/BmcAppbarComponent.dart';
import '../components/BmcArticleComponent.dart';
import '../styles/style.dart';

class RecompenseScreen extends StatelessWidget {

  RecompenseController recompenseController = Get.put(RecompenseController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecompenseController>(
      builder: (RecompenseController recompenseController) {
        return Scaffold(
          appBar: BmcAppbarComponent(title : 'Récompenses'),
          body: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10.0
                    )
                  ],
                  borderRadius: BorderRadius.circular(23),
                  border: Border.all(color: Colors.grey.withOpacity(0.3))
                ),
                child: Column(
                  children: [
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
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                          child: Text('EZ',style: TextStyle(fontSize: AppStyle.size30,fontWeight: FontWeight.w500,fontFamily: 'Robotto'),),
                          decoration: BoxDecoration(
                              color: AppColors.primaryYelloColor,
                              borderRadius: BorderRadius.circular(23.27)
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 17,),
                    Text('Ezeckeil ZOCLI',style: TextStyle(fontSize: AppStyle.size14,fontWeight: FontWeight.w400,fontFamily: 'MTN Brighter Sans',),),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/svg/ic_diamond.svg'),
                              SizedBox(width: 5,),
                              Text('AHOXOU',style: TextStyle(fontSize: AppStyle.size14,fontWeight: FontWeight.w500,fontFamily: 'Robotto',color: AppColors.orangeColor),),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.orangeColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30.77)
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 18,),
                    Text('100/350',style: TextStyle(fontSize: AppStyle.size19,fontWeight: FontWeight.w500,fontFamily: 'MTN Brighter Sans',),),
                    SizedBox(height: 10,),
                    LinearPercentIndicator(
                      animation: true,
                      lineHeight: 5.0,
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      animationDuration: 2500,
                      percent: 0.3,
                      barRadius: Radius.circular(10),
                      progressColor: Colors.black,
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                      child: Text('Gagnez des points en achetant les articles ci dessous.',style: TextStyle(fontSize: AppStyle.size13,fontWeight: FontWeight.w400,height : 1.5,fontFamily: 'Robotto',color: AppColors.marronColor),),
                      decoration: BoxDecoration(
                          color: AppColors.marronColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12)
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 28,),
              Text('Obtenez des points',style: TextStyle(fontSize: AppStyle.size18,fontWeight: FontWeight.w500,fontFamily: 'MTN Brighter Sans',color: AppColors.black1Color),),
              SizedBox(height: 28,),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: recompenseController.articles.length,
                    itemBuilder: (context,index){
                  return BmcArticleComponent(recompenseController.articles[index]);
                }),
              )

            ],
          ),

        );
      }
    );
  }
}
