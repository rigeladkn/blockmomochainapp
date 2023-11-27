import 'package:blockmomochainapp/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

import '../styles/style.dart';

class BmcAppbarComponent extends StatelessWidget implements   PreferredSizeWidget {
  bool? goBack;
  String? title;
  bool? isHome;
  BmcAppbarComponent({this.title,this.goBack = false,this.isHome = false});

  @override
  Widget build(BuildContext context) {
    return isHome! ? buildHomeAppBar() : AppBar(
      elevation: 0,
      centerTitle: true,
      title: title != null ? Text(title!,style: TextStyle(color: Colors.white,fontSize: AppStyle.size16,fontWeight: FontWeight.w500,fontFamily: 'MTN Brighter Sans'),) : null,
      backgroundColor: AppColors.primaryColor,
      leading: goBack! ? IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back,color: Colors.white,)) : SizedBox(),
      // actions: isHome ? [
      //   CircleAvatar(backgroundColor: Colors.white,radius: 15.5,child: CircleAvatar(radius: 10,backgroundColor : AppColors.green2Color.withOpacity(0.3),child: CircleAvatar(radius: 5,backgroundColor : AppColors.green2Color),),),
      //   SizedBox(width: 15,),
      // ] : [],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(55);

  buildHomeAppBar() {
    return AppBar(
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
      actions:  [
        CircleAvatar(backgroundColor: Colors.white,radius: 15.5,child: CircleAvatar(radius: 10,backgroundColor : AppColors.green2Color.withOpacity(0.3),child: CircleAvatar(radius: 5,backgroundColor : AppColors.green2Color),),),
        SizedBox(width: 15,),
      ],
    );
  }
}
