import 'package:blockmomochainapp/controllers/navigation_controller.dart';
import 'package:blockmomochainapp/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

class BmcBottomNavigationBar extends StatefulWidget {
  const BmcBottomNavigationBar({super.key});

  @override
  State<BmcBottomNavigationBar> createState() => _BmcBottomNavigationBarState();
}

class _BmcBottomNavigationBarState extends State<BmcBottomNavigationBar> {

  NavigationController navigationController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (NavigationController navigationController) {
        return BottomNavigationBar(
          currentIndex: navigationController.currentIndex,
          elevation: 15,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryColor,
          selectedLabelStyle:  TextStyle(color: AppColors.primaryColor,fontSize: 10,fontWeight: FontWeight.w500),
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(color: Colors.grey,height: 1.5,fontSize: 10,fontWeight: FontWeight.w500),
          showUnselectedLabels: true,
          onTap: (index){
            navigationController.setCurrentIndex(index);
          },
          items: [
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/ic_home.svg',color: navigationController.currentIndex == 0 ? AppColors.primaryColor : Colors.grey,),label: 'Dashboard',),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/ic_notification.svg',color: navigationController.currentIndex == 1 ? AppColors.primaryColor : Colors.grey,),label: 'Notifications',),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/ic_journal.svg',color: navigationController.currentIndex == 2 ? AppColors.primaryColor : Colors.grey,),label: 'Journal',),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/ic_recompense.svg',color: navigationController.currentIndex == 3 ? AppColors.primaryColor : Colors.grey,),label: 'Récompenses',),
        ],
        );
      }
    );
  }
}
