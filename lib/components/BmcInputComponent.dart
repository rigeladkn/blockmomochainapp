import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmcInputComponent extends StatelessWidget {
  bool? isEmail;
  bool? isPassword;
  Function(String)? onChanged;
  BmcInputComponent({this.isEmail = false,this.isPassword=false,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextFormField(
        onChanged: onChanged ?? (value){},
        decoration: InputDecoration(
            contentPadding : EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0),),
          fillColor: Colors.white,
          filled: true,
          hintStyle: TextStyle(fontSize: 16),
          hintText: isEmail! ? 'Entrez votre mail' : isPassword! ? 'Entrez votre mot de passe' : ''
        ),
      ),
    );
  }
}
