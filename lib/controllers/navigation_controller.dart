import 'package:get/get.dart';

class NavigationController extends GetxController{
  int currentIndex = 0;

  setCurrentIndex(index){
    currentIndex = index;
    update();
  }
}