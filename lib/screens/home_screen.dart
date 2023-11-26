import 'package:blockmomochainapp/components/BmcBottomNavigationBar.dart';
import 'package:blockmomochainapp/components/BmcButtonComponent.dart';
import 'package:blockmomochainapp/components/TransactionComponent.dart';
import 'package:blockmomochainapp/controllers/transaction_controller.dart';
import 'package:blockmomochainapp/styles/colors.dart';
import 'package:blockmomochainapp/styles/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

class HomeScreen extends StatelessWidget {

  TransactionController transactionController = Get.put(TransactionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              CircleAvatar(child: SvgPicture.asset('assets/svg/ic_user.svg'),radius: 21,backgroundColor: AppColors.grey3Color.withOpacity(0.3),),
              SizedBox(width: 6,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text('611 999 00',style: TextStyle(fontSize: AppStyle.size12,fontWeight: FontWeight.w400,fontFamily: 'MTN Brighter Sans'),),
                  SizedBox(height: 4,),
                  Row(
                        children: [
                          Text('Mon compte',style: TextStyle(fontSize: AppStyle.size16,fontWeight: FontWeight.w600,fontFamily: 'MTN Brighter Sans'),),
                        SizedBox(width: 2,),
                          Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,)
                        ],
                      ),
                ],
              )
            ],
          ),
        ),
        // leading: ListTile(
        //   leading: CircleAvatar(child: SvgPicture.asset('assets/svg/ic_user.svg'),radius: 18,backgroundColor: AppColors.grey3Color,),
        //   title : Text('611 999 00',style: TextStyle(fontSize: AppStyle.size12,fontWeight: FontWeight.w400,fontFamily: 'MTN Brighter Sans'),),
        //   subtitle : Row(
        //     children: [
        //       Text('Mon compte',style: TextStyle(fontSize: AppStyle.size16,fontWeight: FontWeight.w600,fontFamily: 'MTN Brighter Sans'),),
        //     SizedBox(width: 4,),
        //       Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,)
        //     ],
        //   ),
        // ),
        actions: [
          CircleAvatar(backgroundColor: Colors.white,radius: 15.5,child: CircleAvatar(radius: 10,backgroundColor : AppColors.green2Color.withOpacity(0.3),child: CircleAvatar(radius: 5,backgroundColor : AppColors.green2Color),),),
          SizedBox(width: 15,),
        ],
      ),
      bottomNavigationBar: BmcBottomNavigationBar(),
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3,0.5,0.9],
                colors: [
                  AppColors.primColor.withOpacity(0.7),
                  AppColors.primColor.withOpacity(0.2),
                  Colors.white,
                ]
              )
            ),
          ),
          CircleAvatar(child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset('assets/svg/ic_logo.svg'),
          ),backgroundColor: AppColors.primaryColor,radius: 25.8,),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 27),
            decoration: BoxDecoration(color: AppColors.primaryColor,),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(16,17,16,17),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient: LinearGradient(colors: [
                        AppColors.primaryYelloColor,
                        AppColors.yello1Color,
                      ])
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Votre Solde',style: TextStyle(fontSize: AppStyle.size16,fontWeight: FontWeight.w400,fontFamily: 'MTN Brighter Sans'),),
                            SvgPicture.asset('assets/svg/ic_eye_locked.svg'),
                          ],
                        ),
                        SizedBox(height: 1,),
                        Row(
                          children: [
                            Text('30 000',style: TextStyle(fontSize: AppStyle.size48,fontWeight: FontWeight.w700,fontFamily: 'MTN Brighter Sans'),),
                            Transform.translate(
                                offset: Offset(3, -10),
                                child: Text("CFA",style: TextStyle(fontSize: AppStyle.size24,fontWeight: FontWeight.w700,fontFamily: 'MTN Brighter Sans'),)),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Dernière transaction',style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'MTN Brighter Sans'),),
                            Text('15/02/23',style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'MTN Brighter Sans'),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset('assets/svg/ic_vector1.svg'),
                ],
              ),
            ),
            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Envoyer de l'argent",style: TextStyle(fontWeight: FontWeight.w500,fontSize : AppStyle.size18,fontFamily: 'MTN Brighter Sans'),),
                  SizedBox(height: 21,),
                  Row(
                    children: [
                      Expanded(child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: AppColors.grey2Color)
                            ),
                            padding: EdgeInsets.all(20),
                            child: Center(
                              child: SvgPicture.asset('assets/svg/ic_send.svg'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10.0,15,10,5),
                            child: Text("Envoyer à un abonné mobile money",textAlign : TextAlign.center,style: TextStyle(fontWeight: FontWeight.w400,fontSize : AppStyle.size12,height : 1.5,fontFamily: 'MTN Brighter Sans'),),
                          ),

                        ],
                      )),
                      SizedBox(width: 20,),
                      Expanded(child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: AppColors.grey2Color)
                            ),
                            padding: EdgeInsets.all(20),
                            child: Center(
                              child: SvgPicture.asset('assets/svg/ic_send1.svg'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10.0,15,10,5),
                            child: Text("Envoyer à un non abonné mobile money",textAlign : TextAlign.center,style: TextStyle(fontWeight: FontWeight.w400,fontSize : AppStyle.size12,height : 1.5,fontFamily: 'MTN Brighter Sans'),),
                          ),
                        ],
                      )),
                    ],
                  ),
                  // BmcButtonComponent(isSendBtn: true,),
                  // SizedBox(height: 8,),
                  // BmcButtonComponent(isSendBtn: false,),
                  SizedBox(height: 30,),
                  Text('Vos transactions récentes',style: TextStyle(fontWeight: FontWeight.w500,fontSize : AppStyle.size16,fontFamily: 'MTN Brighter Sans'),),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
