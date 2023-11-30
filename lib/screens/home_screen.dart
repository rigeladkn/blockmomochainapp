import 'dart:async';
import 'dart:developer';

import 'package:blockmomochainapp/components/BmcBottomNavigationBar.dart';
import 'package:blockmomochainapp/components/BmcAppbarComponent.dart';
import 'package:blockmomochainapp/components/BmcButtonComponent.dart';
import 'package:blockmomochainapp/components/TransactionComponent.dart';
import 'package:blockmomochainapp/controllers/navigation_controller.dart';
import 'package:blockmomochainapp/controllers/network_controller.dart';
import 'package:blockmomochainapp/controllers/transaction_controller.dart';
import 'package:blockmomochainapp/screens/recompense_screen.dart';
import 'package:blockmomochainapp/screens/transfert_screen.dart';
import 'package:blockmomochainapp/styles/colors.dart';
import 'package:blockmomochainapp/styles/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

import 'journal_screen.dart';
import 'notification_screen.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TransactionController transactionController = Get.put(TransactionController());
  NavigationController navigationController = Get.put(NavigationController());
  NetworkController networkController = Get.put(NetworkController());

  void setNetworkStatus() {
    // Timer.periodic(Duration(seconds: 5), (timer) {
      networkController.getNetworkStatus();
    // });
  }

  void getTransactions(){
    transactionController.getTransactions();
    log(transactionController.transactions.toString());
  }

  @override
  void initState() {
    setNetworkStatus();
    getTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (NavigationController navigationController) {
        return Scaffold(
          appBar: navigationController.currentIndex == 0 ? BmcAppbarComponent(isHome: true,) : null,
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
          body:  navigationController.currentIndex == 1 ? NotificationScreen() : navigationController.currentIndex == 2 ? JournalScreen() : navigationController.currentIndex == 3 ? RecompenseScreen() : SingleChildScrollView(
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
                          Expanded(child: GestureDetector(
                            onTap: (){
                              Get.to(()=>TransfertScreen());
                            },
                            child: Column(
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
                            ),
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
    );
  }

}
