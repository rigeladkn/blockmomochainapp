import 'dart:developer';

import 'package:blockmomochainapp/components/BmcAppbarComponent.dart';
import 'package:blockmomochainapp/controllers/quizz.controller.dart';
import 'package:blockmomochainapp/screens/score_screen.dart';
import 'package:blockmomochainapp/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/style.dart';

class QuizzScreen extends StatefulWidget {

  @override
  State<QuizzScreen> createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  List<List<bool>> quizzResponses = [];
  List<bool> isMultipleResponses = [];
  List<dynamic> quizz = [];
  QuizzController quizzController = Get.put(QuizzController());
  List<List<bool>> userChoices = [];
  int currentIndex = 0;
  bool canContinue = false;

  @override
  void initState() {
    //GET QUIZZ OF 10 questions
    quizz = quizzController.quizz;
    //GET ARRAY OF VALID RESPONSES PER QUESTION
    quizz.forEach((quizzQuestRep){
      //GET ARRAY OF ISMULTIPLE RESPONSES PER QUESTION
      isMultipleResponses.add(quizzQuestRep["isMultiResponse"]);
      //end
      List<bool> propositionResult = [];
      quizzQuestRep['propositions'].forEach((propo){
        propositionResult.add(propo['isValid']);
      });
      quizzResponses.add(propositionResult);
    });
    log('BASE GOOD RESPONSES ' + quizzResponses.toString());
    // log(isMultipleResponses.toString());
    //CREATE USERCHOICES
    // userChoices = List.from(quizzResponses);
    log('AFTER LIST FROM 1' + quizzResponses.toString());
    log('AFTER LIST FROM 1' + quizzResponses.toString());

    for(int i=0;i<quizzResponses.length;i++){
      List<bool> q = [];
      for(int j=0;j<quizzResponses[i].length;j++){
        setState(() {
          q.add(false);
        });
      }
      setState(() {
        userChoices.add(q);
      });
    }
    log('AFTER LIST FROM' + quizzResponses.toString());
    log('AFTER LIST FROM' + userChoices.toString());

    for(int i=0;i<userChoices.length;i++){
      for(int j=0;j<userChoices[i].length;j++){
        if(userChoices[i][j]){
          setState(() {
            userChoices[i][j] = false;
          });
        }
      }
    }
    log('BASE 2' + quizzResponses.toString());
    log(userChoices.toString());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BmcAppbarComponent(title: 'Quizz du jour',goBack: true,),
      floatingActionButton: GestureDetector(
          onTap: (){
            nextButtonIsTapped();
          },
          child: CircleAvatar(radius: 25,child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,),backgroundColor: canContinue ? AppColors.primaryColor : Colors.grey,)),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 150,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              color: AppColors.primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Récompense',style: TextStyle(fontSize: AppStyle.size24,fontWeight: FontWeight.w500,color: Colors.white),),
                  SizedBox(height: 5,),
                  Text('1Go de forfait internet',style: TextStyle(fontSize: AppStyle.size13p94,fontWeight: FontWeight.w500,color: Colors.white),),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(quizz.length, (index) =>  Container(
                      padding: EdgeInsets.all(6),
                      child: Text((index + 1).toString(),style: TextStyle(fontSize: 12,color : currentIndex == index ? Colors.black : Colors.white),),
                      decoration: BoxDecoration(shape: BoxShape.circle,color: currentIndex == index ? Colors.white : Colors.transparent,border: Border.all(color: Colors.white)),
                    )),
                  )
                ],
              ),),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: IndexedStack(
                    index: currentIndex,
                    children:  List.generate(quizz.length, (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children : [
                          // Text('30s',style: TextStyle(fontSize: AppStyle.size13p94,fontWeight: FontWeight.w500,color: AppColors.primaryColor),),
                          // SizedBox(height: 20,),
                          Text(quizz[currentIndex]['question'],style: TextStyle(fontSize: AppStyle.size13p94,fontWeight: FontWeight.w700),),
                          SizedBox(height: 25,),
                          ...List.generate(quizz[currentIndex]['propositions'].length, (index) => Container(
                            margin: EdgeInsets.only(bottom: 15),
                            padding: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.primaryColor,width: 1.1),
                                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1),blurRadius: 5)]
                            ),
                            child: ListTile(
                              horizontalTitleGap: 4,
                              leading: isMultipleResponses[currentIndex] ? Checkbox(value: userChoices[currentIndex][index], onChanged: (bool? value) {
                                propoIsTapped(index);
                              },activeColor: AppColors.primaryColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),) :
                              Radio(value: userChoices[currentIndex][index],
                                activeColor: AppColors.primaryColor,
                                onChanged: (value){
                                propoIsTapped(index);
                              }, groupValue: true,),
                              title: Text(quizz[currentIndex]['propositions'][index]['content'],style: TextStyle(fontSize: AppStyle.size13p94,fontWeight: FontWeight.w500),),
                            ),
                          ),),
                        ]
                    ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void nextButtonIsTapped() {
    if(currentIndex < quizz.length -1){
      if(canContinue){
        setState(() {
          currentIndex = currentIndex + 1;
        });
        setState(() {
          canContinue = false;
        });
      }
      else{
        setState(() {
          canContinue = false;
        });
      }
    }
    else{
      var score = calculateScore();
      Get.to(()=>ScoreScreen(score : score));
      log(userChoices.toString());
    }
  }

  void propoIsTapped(int index) {
    if(!userChoices[currentIndex].contains(true)){
      setState(() {
        canContinue = false;
      });
    }
    if(isMultipleResponses[currentIndex]){

    }
    else{
        for(int j=0;j<userChoices[currentIndex].length;j++){
          if(userChoices[currentIndex][j]){
            setState(() {
              userChoices[currentIndex][j] = false;
            });
          }
      }

    }
    setState(() {
      userChoices[currentIndex][index] = !userChoices[currentIndex][index];
    });
    if(userChoices[currentIndex].contains(true)){
      setState(() {
        canContinue = true;
      });
    }
    else{
      setState(() {
        canContinue = false;
      });
    }

    // if(userChoices[currentIndex][index])
  }

  calculateScore() {
    var result = 0;
    var totalOfProposedGoodResponses = 0;
    for(int i=0;i<userChoices.length;i++){
      for(int j=0;j<userChoices[i].length;j++){
        if(quizzResponses[i][j]){
          totalOfProposedGoodResponses++;
        }
        if((userChoices[i][j] == quizzResponses[i][j]) && userChoices[i][j]){
          result ++;
        }
        // else{
        //PENALITE
        //   score = score - 0.1;
        // }
      }
    }
    log('RESPONSES $quizzResponses');
    log('USER RESPONSES $userChoices');
    log('GOOD RESPONSES $totalOfProposedGoodResponses');
    log('USER GOOD RESPONSES $result');

    var score = 100 * (result/totalOfProposedGoodResponses);
    log('FINAL SCORE $score%');
    return score;
  }
}
