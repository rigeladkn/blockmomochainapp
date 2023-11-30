import 'dart:convert';
import 'dart:developer';

import 'package:blockmomochainapp/constants/constants.dart';
import 'package:blockmomochainapp/helpers/helpers.dart';
import 'package:http/http.dart' as http;

class Services {

  //---------------- NETWORK ----------------------------
  Future<String> getNetworkStatus() async {
    var response = await http.get(Uri.parse(API_BASE_URL + '/api/network/status'));
    if(response.statusCode == 200){
      var data = await jsonDecode(response.body);
      log(data.toString());
      return data['status'];
    }
    else{
      return '';
    }
  }

  //---------------- AUTH ----------------------------

  Future<dynamic> login(username,password,isEmail) async {
    try{
      var url = Uri.parse(API_BASE_URL + '/api/auth/login');
      var body = {
        'email' : username,
        'password' : password
      };
      var response = await http.post(url,body: body);
      log(body.toString());
      if(response.statusCode == 201 || response.statusCode == 200){
        var data = await jsonDecode(jsonEncode(response.body));
        log(data.toString());
        return data;
      }
      else{
        return {'success' : false};
      }
    }
    catch(e){
      log('ERROR => $e');
      throw Error();
    }
  }

  //---------------- TRANSACTIONS ----------------------------
  Future<List<dynamic>> getUserTransactions() async {
    try{
      var response = await http.get(Uri.parse(API_BASE_URL + '/api/transactions'),headers: await getHeaders());
      log(response.body.toString());
      if(response.statusCode == 200){
        var data = await jsonDecode(response.body);
        log('T ' + data['transactions'].toString());
        return data['transactions'];
      }
      else if(response.statusCode == 401){
        log('ERROR NO TOKEN');
        return [];
      }
      else{
        return [];
      }
    }
    catch(e){
      log('ERROR $e');
      return [];
    }
  }
  //---------------- OPERATIONS ----------------------------

  Future<dynamic> makeTransfert(receiver,amount) async {
    var headers =  await getHeaders();
    log('HEADERS $headers');
    try{
      var url = Uri.parse(API_BASE_URL + '/api/transactions');
      var body = {
        'receiver' : receiver,
        'amount' : amount.toString(),
        'type' : 'TRANSFERT'
      };
      var response = await http.post(url,body: body,headers: headers);
      var data = await jsonDecode(jsonEncode(response.body));
      log(body.toString());
      if(response.statusCode == 201 || response.statusCode == 200){
        log(data.toString());
        return data;
      }
      else{
        return data;
      }
    }
    catch(e){
      log('ERROR => $e');
      return {'success' : false,'message' : "${e}"};
    }
  }

  Future<Map<String, String>> getHeaders() async {
    var prefs = await Helpers.getSharedPrefs();
    var token = prefs.getString('token');
    if(token != null){
      log('TOKEN FOUND $token');
      return {
        "Authorization" : 'Bearer ' + token
      };
    }
    else{
      return {
        "Authorization" : 'Bearer '
      };
    }
  }

  getUserProfile() async {
    try{
        var response = await http.get(Uri.parse(API_BASE_URL + '/api/users/profile'),headers: await getHeaders());
        log(response.body.toString());
        if(response.statusCode == 200){
          var data = await jsonDecode(response.body);
          return data;
        }
        else if(response.statusCode == 401){
          log('ERROR NO TOKEN');
          return [];
        }
        else{
        return [];
        }
    }
    catch(e){
        log('ERROR $e');
        return [];
    }
  }

  getUserBalance() async {
    var data;
    try{
      var response = await http.get(Uri.parse(API_BASE_URL + '/api/users/balance'),headers: await getHeaders());
      log(response.body.toString());
      if(response.statusCode == 200){
        data = await jsonDecode(response.body);
        return data['balance'];
      }
      else if(response.statusCode == 401){
        log('ERROR NO TOKEN');
        return 0;
      }
      else{
        return 0;
      }
    }
    catch(e){
      log('ERROR $e');
      return 0;
    }
  }

}