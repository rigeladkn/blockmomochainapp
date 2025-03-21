import 'package:blockmomochainapp/components/BmcAppbarComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BmcAppbarComponent(title: 'Notifications',),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
        ],
      ),),
    );
  }
}
