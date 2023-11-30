import 'dart:convert';

class Transaction{
  dynamic? sender;
  dynamic? receiver;
  int? amount;
  String? transactionId;
  String? status;
  String? type;
  List? relaunchedTime;
  String? resolvedStatus;
  String? createdAt;

  Transaction.fromJson(Map<String, dynamic> json){
    sender = jsonDecode(jsonEncode(json['sender']));
    receiver = jsonDecode(jsonEncode(json['receiver']));
    amount = json['amount'];
    transactionId = json['transactionId'];
    status = json['status'];
    type = json['type'];
    relaunchedTime = json['relaunchedTime'];
    resolvedStatus = json['resolvedStatus'];
    createdAt = json['createdAt'];
  }

  toJson(){
    return {
      "sender" : sender,
      "receiver" : receiver,
      "amount" : amount,
      "transactionId" : transactionId,
      "status" : status,
      "type" : type,
      "relaunchedTime" : relaunchedTime,
      "resolvedStatus" : resolvedStatus,
    };
  }
}