import 'package:blockmomochainapp/styles/colors.dart';
import 'package:blockmomochainapp/styles/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class BmcButtonComponent extends StatelessWidget {
  bool? isSendBtn;
  bool? isSecondaryBtn;
  bool? isTransparentButton;
  bool? isYellowButton;
  String text;
  TextStyle? style;
  dynamic? leftIcon;
  Function() onTap;
  BmcButtonComponent({this.isSendBtn = false,this.isSecondaryBtn = false,this.isTransparentButton = false, this.isYellowButton = false,required this.text,this.style, this.leftIcon = null,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return isSecondaryBtn! ? buildSecondaryButton() : buildPrimaryButton();
  }



  buildPrimaryButton() {
    return GestureDetector(
      onTap: onTap,
      child: Container(height: 50,
        decoration: BoxDecoration(
        color: isYellowButton! ? AppColors.primaryYelloColor1 : isTransparentButton! ? Colors.transparent : AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color : isTransparentButton! ? Colors.white : Colors.transparent),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leftIcon ?? SizedBox(),
            leftIcon != null ? SizedBox(width: 8,) : SizedBox(),
            Text(text,style: style ?? TextStyle(fontSize: AppStyle.size16,fontWeight: FontWeight.w500,fontFamily: 'MTN Brighter Sans',color: isTransparentButton! ? Colors.white : isYellowButton! ? Colors.black : Colors.white),),
          ],
        ),),
      ),
    );
  }


  buildSecondaryButton() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 68,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              gradient: LinearGradient(colors: [
                AppColors.primaryColor,
                AppColors.blue1Color,
              ])),
          child: Center(
            child: ListTile(
              title : Text(isSendBtn! ? "Envoyer de l'argent" : "Recevoir de l'argent",style: TextStyle(fontWeight: FontWeight.w400,fontSize : AppStyle.size18, color : Colors.white,fontFamily: 'MTN Brighter Sans'),),
              leading: SvgPicture.asset( isSendBtn! ? 'assets/svg/ic_send_square.svg' : 'assets/svg/ic_receive_square.svg'),
              trailing: SvgPicture.asset('assets/svg/ic_arrow_right.svg'),
            ),
          )
      ),
    );
  }
}
