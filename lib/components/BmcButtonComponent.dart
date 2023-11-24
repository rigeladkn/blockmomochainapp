import 'package:blockmomochainapp/styles/colors.dart';
import 'package:blockmomochainapp/styles/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class BmcButtonComponent extends StatelessWidget {
  bool? isSendBtn;
  bool? isPrimaryBtn;
  BmcButtonComponent({this.isSendBtn = false,this.isPrimaryBtn = false});

  @override
  Widget build(BuildContext context) {
    return isPrimaryBtn! ? Container() : buildPrimaryButton() ;
  }

  buildPrimaryButton() {
    return Container(
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
    );
  }
}
