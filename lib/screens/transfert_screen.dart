import 'dart:developer';

import 'package:blockmomochainapp/components/BmcButtonComponent.dart';
import 'package:blockmomochainapp/components/BmcInputComponent.dart';
import 'package:blockmomochainapp/controllers/network_controller.dart';
import 'package:blockmomochainapp/controllers/transfert_controller.dart';
import 'package:blockmomochainapp/helpers/helpers.dart';
import 'package:blockmomochainapp/screens/success_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

import '../components/BmcAppbarComponent.dart';
import '../styles/colors.dart';
import '../styles/style.dart';

class TransfertScreen extends StatefulWidget {

  @override
  State<TransfertScreen> createState() => _TransfertScreenState();
}

class _TransfertScreenState extends State<TransfertScreen> {
  String phone='';
  TransfertController transfertController = Get.put(TransfertController());
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BmcAppbarComponent(title : "Envoyer de l'argent",goBack: true,),
      body: GetBuilder<TransfertController>(
        builder: (TransfertController transfertController) {
          return ListView(
            padding: EdgeInsets.all(20),
            children: [
              // SizedBox(height: 30,),
              Text('Envoyer de l’argent',style: TextStyle(fontWeight: FontWeight.w500,fontSize : AppStyle.size18,fontFamily: 'MTN Brighter Sans'),),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(transfertController.favoritesContacts.length, (index){
                  return  GestureDetector(
                    onTap: (){
                      transfertController.updateReceiverPhone(transfertController.favoritesContacts[index]['phone']);
                      phoneController.text = transfertController.favoritesContacts[index]['phone']!;
                      },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(
                        // color : Colors.green,
                          color : transfertController.favoritesContacts[index]['phone'] == transfertController.receiverPhone ? (index) % 2 == 0 ? AppColors.primaryYelloColor : AppColors.primaryColor : Colors.transparent

                      )),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                            child: Text(transfertController.favoritesContacts[index]['name']!.substring(0,2).toUpperCase(),style: TextStyle(fontSize: AppStyle.size18,fontWeight: FontWeight.w500,fontFamily: 'Robotto',color: (index+1) %2 == 0 ? Colors.white : Colors.black),),
                            decoration: BoxDecoration(
                                color: (index+1) %2 == 0 ? AppColors.primaryColor : AppColors.primaryYelloColor,
                                borderRadius: BorderRadius.circular(15)
                            ),
                          ),
                          SizedBox(height: 17,),
                          Text(transfertController.favoritesContacts[index]['name']!,style: TextStyle(fontSize: AppStyle.size14,fontWeight: FontWeight.w400,fontFamily: 'MTN Brighter Sans',color: AppColors.blue2Color),),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 40,),
              Text("À qui voulez-vous envoyer de l’argent ?",style: TextStyle(fontSize: AppStyle.size14,fontWeight: FontWeight.w400,fontFamily: 'MTN Brighter Sans',color: AppColors.black1Color),),
              SizedBox(height: 7,),
              Row(
                children: [
                  Expanded(flex : 9,child: BmcInputComponent(isForOperation: true,isPhone : true,
                  controller: phoneController,onChanged: (value){
                    transfertController.updateReceiverPhone(value);
                    },)),
                  SizedBox(width: 10,),
                    Expanded(
                      flex: 2,
                      child: Container(
                      height: 50,
                        width: 60,
                        padding: EdgeInsets.symmetric(horizontal: 7,vertical: 7),
                        child:  SvgPicture.asset('assets/svg/ic_contacts.svg'),
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                    )
                ],
              ),
              SizedBox(height: 20,),
              Text("Vous voulez envoyer combien ?",style: TextStyle(fontSize: AppStyle.size14,fontWeight: FontWeight.w400,fontFamily: 'MTN Brighter Sans',color: AppColors.black1Color),),
              SizedBox(height: 7,),
              BmcInputComponent(isForOperation: true,isAmount : true,onChanged: (value){
                transfertController.updateAmount(int.parse(value));
              }),
              SizedBox(height: 20,),
              Text("Entrer la raison de l’envoi",style: TextStyle(fontSize: AppStyle.size14,fontWeight: FontWeight.w400,fontFamily: 'MTN Brighter Sans',color: AppColors.black1Color),),
              SizedBox(height: 7,),
              BmcInputComponent(isForOperation: true,isReason : true),
              SizedBox(height: 31,),
              BmcButtonComponent(
                  isYellowButton : true,
                  text: 'Continuer', onTap: (){
                    confirmSending();
                  }),
            ],
          );
        }
      ),
    );
  }

  confirmSending() async {
    await showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Confirmation d'envoi",style: TextStyle(fontSize: AppStyle.size14,fontWeight: FontWeight.w700,fontFamily: 'MTN Brighter Sans',color: AppColors.black1Color)),
        content: Container(
          height: 50,
          child:Text("Confirmez-vous l'envoi de 5Fcfa à Boss ?",style: TextStyle(fontSize: AppStyle.size14,fontWeight: FontWeight.w400,fontFamily: 'MTN Brighter Sans',color: AppColors.black1Color,height: 1.5),),
        ),
        actions: [
          TextButton(onPressed: (){
            Get.back();
          }, child: Text('Annuler',style: TextStyle(fontSize: AppStyle.size14,fontWeight: FontWeight.w700,fontFamily: 'MTN Brighter Sans',color: AppColors.redColor))),
          TextButton(onPressed: (){
            sendMoney();
          }, child: Text('Envoyer',style: TextStyle(fontSize: AppStyle.size14,fontWeight: FontWeight.w700,fontFamily: 'MTN Brighter Sans',color: AppColors.primaryColor)))

        ],
      );
    });

  }

  void sendMoney() async {
    Get.back();
    final prefs = await Helpers.getSharedPrefs();
    // if(prefs!.containsKey('networkStatus')){
    //   String? status = await prefs.getString('net');
      // if(status == 'DOWN'){
      if(true){
        showModalBottomSheet(context: context,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            builder: (context){
          return Container(height: 570,
          padding: EdgeInsets.only(top: 5,right: 15,left: 15,bottom: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
            CircleAvatar(backgroundColor: Colors.white,radius: 15.5,child: CircleAvatar(radius: 10,backgroundColor :  AppColors.redColor.withOpacity(0.3),child: CircleAvatar(radius: 5,backgroundColor : AppColors.redColor),),),
                  Text('Réseau actuellement hors service !',style: TextStyle(fontWeight: FontWeight.w500,fontSize : AppStyle.size15,fontFamily: 'MTN Brighter Sans',color : AppColors.redColor),),
                  IconButton(icon : Icon(Icons.close),color: Colors.black.withOpacity(0.5),onPressed: ()=>Get.back())
                ],
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.redColor),
                  color: AppColors.redColor.withOpacity(0.2)
                ),
                child: Text("Le service Mobile Money est actuellement hors service. Nous vous présentons nos services et vous rassurons de ce que le réseau sera très vite rétabli. \n\n Si vous êtes dans un cas pressant ou urgent d'envoi vers votre destinataire, vous pourrez toutefois effectuer cette transaction par le biais du réseau BlockMomoChain. Si vous disposez des fonds suffisants, votre transaction sera autorisée. Votre solde Momo sera déduit automatiquement dès que la panne réglée. MTN vous remercie de votre fidélité !",style: TextStyle(fontSize: AppStyle.size13,fontWeight: FontWeight.w400,height : 1.5,fontFamily: 'Robotto',color: AppColors.marronColor),),
              ),
              SizedBox(height: 15,),
              BmcButtonComponent(text: 'Accepter et continuer', onTap: () async {
                var response = await transfertController.sendMoney();
                if(response['success']){
                  Get.to(()=>SuccessScreen());
                }
                else{
                  showErrorDialog(response['message']);
                }
                
                
              },isYellowButton: false,),
            ],
          ),);
        });
      }


    // }
  }

  void showErrorDialog(errorMessage) {
    showDialog(context: context, builder: (context){
      return AlertDialog(
        content: Text(errorMessage,),
      );
    });
    
  }
}
