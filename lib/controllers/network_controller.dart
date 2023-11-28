import 'package:blockmomochainapp/services/services.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController{
  String network = '';

  Future<void> getNetworkStatus() async {
    String status = await Services().getNetworkStatus();
    network = status;
    update();
  }
}