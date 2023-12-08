import 'package:blockmomochainapp/services/services.dart';
import 'package:get/get.dart';

import '../helpers/helpers.dart';

class NetworkController extends GetxController{
  String network = '';

  Future<void> getNetworkStatus() async {
    String status = await Services().getNetworkStatus();
    network = status;
    final prefs = await Helpers.getSharedPrefs();
    await prefs.setString('networkStatus',network);
    update();

  }
}