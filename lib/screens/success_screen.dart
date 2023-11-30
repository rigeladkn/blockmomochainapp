import 'package:blockmomochainapp/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

import '../components/BmcButtonComponent.dart';
import '../styles/colors.dart';
import '../styles/style.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: AppColors.primaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/png/img_logo.png'),
            Icon(Icons.check_circle,color: Colors.white,size: 80,),
            Text('Transaction effectuée avec succès',style: TextStyle(fontSize: AppStyle.size18,fontWeight: FontWeight.w500,fontFamily: 'MTN Brighter Sans',color: Colors.white),),
           BmcButtonComponent(isTransparentButton: true, text: 'Terminé', onTap: () { Get.to(()=>HomeScreen()); },)
          ],
        ),

      ),
    );
  }
}
