import 'dart:developer';

import 'package:blockmomochainapp/controllers/auth_controller.dart';
import 'package:blockmomochainapp/screens/home_screen.dart';
import 'package:blockmomochainapp/styles/colors.dart';
import 'package:blockmomochainapp/utils/Loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

import '../components/BmcButtonComponent.dart';
import '../components/BmcInputComponent.dart';
import '../styles/style.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int currentIndex = 0;
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GetBuilder<AuthController>(
            builder: (AuthController authController) {
              return Container(
                decoration: BoxDecoration(color: AppColors.primaryColor),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 90,),
                        Image.asset('assets/png/img_logo.png'),
                        SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("y'ello",style: TextStyle(fontSize: AppStyle.size28,fontWeight: FontWeight.w700,fontFamily: 'MTN Brighter Sans',color: Colors.white),),
                            SizedBox(width: 5,),
                            Text('bienvenue !',style: TextStyle(fontSize: AppStyle.size28,fontWeight: FontWeight.w700,fontFamily: 'MTN Brighter Sans',color: AppColors.primaryYelloColor1),),
                            SizedBox(height: 30,),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              IndexedStack(index: currentIndex,
                              children: [
                                BmcInputComponent(isEmail:true,onChanged: (value){
                                  authController.updateEmail(value);
                                },),
                                BmcInputComponent(isPassword:true,onChanged: (value){
                                  authController.updatePassword(value);
                                },),
                              ],),
                              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if(currentIndex == 1)  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        currentIndex = 0;
                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(right: 5) ,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
                                      color: Colors.white,),
                                      child: Center(child: Icon(Icons.arrow_back_ios,)),
                                    ),
                                  ),
                                  Expanded(
                                    child: BmcButtonComponent(isYellowButton: true, text: 'Continuer',onTap: () async {
                                      if(currentIndex == 0){
                                        setState(() {
                                          currentIndex++;
                                        });
                                      }
                                      else{
                                        Loader.showLoader(context);
                                        var resp = await authController.login();
                                        log('RESP IN LOGIN $resp');
                                        Loader.offLoader(context);
                                        if(resp['success']){
                                          Get.to(()=>HomeScreen());
                                        }
                                        else{
                                          Loader.offLoader(context);
                                          await ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Informations de connexion incorrectes',style: TextStyle(color: Colors.white,fontSize: 12),)));
                                        }
                                      }
                                    },),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(int.parse((MediaQuery.of(context).size.width/2 - 35).toInt().toString()), (index) => Container(height: 1,width: 1,color: Colors.white,)),
                            SizedBox(width: 5,),
                            Text('ou',style: TextStyle(fontSize: AppStyle.size14,fontWeight: FontWeight.w600,fontFamily: 'MTN Brighter Sans',color: Colors.white),),
                            SizedBox(width: 5,),
                            ...List.generate(int.parse((MediaQuery.of(context).size.width/2 - 35).toInt().toString()), (index) => Container(height: 1,width: 1,color: Colors.white,))
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: BmcButtonComponent(isTransparentButton: true, text: 'Utiliser votre numéro de téléphone',leftIcon: SvgPicture.asset('assets/svg/ic_phone.svg'),
                            style: TextStyle(fontSize: AppStyle.size14,fontWeight: FontWeight.w500,fontFamily: 'MTN Brighter Sans',color: Colors.white ),
                            onTap: (){},),
                        ),


                      ],
                    ),
                  ],
                ),
              );
            }
          ),
    // GetBuilder<AuthController>(
    // builder: (AuthController authController) {
    // return  authController.isLoading ? LoaderWidget(type: 'default',) : SizedBox();}),
        ],
      ),
    );
  }
}
