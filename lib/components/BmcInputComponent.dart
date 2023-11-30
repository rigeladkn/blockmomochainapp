import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../styles/colors.dart';

class BmcInputComponent extends StatelessWidget {
  bool? isEmail;
  bool? isPassword;
  bool? isForOperation;
  bool? isPhone;
  bool? isAmount;
  bool? isReason;
  String? initialValue;
  TextEditingController? controller;
  Function(String)? onChanged;
  BmcInputComponent({this.isEmail = false,this.isPassword=false,this.onChanged,this.isForOperation=false,this.isPhone=false, this.isAmount=false,this.isReason=false,this.initialValue='',this.controller=null});

  @override
  Widget build(BuildContext context) {
    return isForOperation! ? buildOperationsInput() : Container(
      height: 50,
      child: TextFormField(
        onChanged: onChanged ?? (value){},
        decoration: InputDecoration(
            contentPadding : EdgeInsets.symmetric(vertical: 5.5,horizontal: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0),),
          fillColor: Colors.white,
          filled: true,
          hintStyle: TextStyle(fontSize: 16),
          hintText: isEmail! ? 'Entrez votre mail' : isPassword! ? 'Entrez votre mot de passe' : ''
        ),
      ),
    );
  }

  buildOperationsInput() {
    return Container(
      height: 50,
      child: TextFormField(
        onChanged: onChanged ?? (value){},
        controller: controller ?? null,
        decoration: InputDecoration(
            contentPadding : EdgeInsets.symmetric(vertical: 5.5,horizontal: 10),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0),),
            fillColor: Colors.white,
            filled: true,
            hintStyle: TextStyle(fontSize: 16),
            hintText: isPhone! ? 'Ex 97xxxxxx' : isAmount! ? 'Ex 500' : isReason! ? 'Ex Cadeau' : ''
        ),
      ),
    );
  }
}
