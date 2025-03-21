import 'package:blockmomochainapp/components/BmcAppbarComponent.dart';
import 'package:blockmomochainapp/controllers/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/BmcButtonComponent.dart';
import '../styles/colors.dart';
import 'home_screen.dart';

class ProfileScreen extends StatelessWidget {
  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BmcAppbarComponent(
        title: 'Profil',
        goBack: true,
      ),
      body: GetBuilder(builder: (AuthController authController) {
        return authController.isLoading ? CupertinoActivityIndicator() : SingleChildScrollView(
            child: Column(children: [
          Stack(
            children: [
              ClipPath(
                  clipBehavior: Clip.hardEdge,
                  clipper: TrapezeClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    color: AppColors.primaryColor,
                  )),
              Positioned(
                  right: 20,
                  bottom: 5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(13)),
                    onPressed: () async {
                      await authController.logout();
                    },
                    child: Icon(
                      Icons.logout,
                      color: Colors.red,
                      size: 30,
                    ),
                  )),
            ],
          ),
        ]));
      }),
    );
  }
}

class TrapezeClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.8);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
