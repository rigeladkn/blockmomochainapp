import 'package:get/get.dart';

class QuizzController extends GetxController{
  List<Map<String,dynamic>> quizz = [
    {
      'question' : 'Question 1',
      'isMultiResponse' : true,
      'propositions' : [
        {
          'content' : 'Propo 1',
           'isValid' : true,
        },
        {
          'content' : 'Propo 2',
          'isValid' : true,
        },
        {
          'content' : 'Propo 3',
          'isValid' : false,
        },
      ]
    },
    {
      'question' : 'Question 2',
      'isMultiResponse' : false,
      'propositions' : [
        {
          'content' : 'Propo 1',
          'isValid' : false,
        },
        {
          'content' : 'Propo 2',
          'isValid' : true,
        },
        {
          'content' : 'Propo 3',
          'isValid' : false,
        },
      ]
    },
    {
      'question' : 'Question 3',
      'isMultiResponse' : false,
      'propositions' : [
        {
          'content' : 'Propo 1',
          'isValid' : false,
        },
        {
          'content' : 'Propo 2',
          'isValid' : true,
        },
        {
          'content' : 'Propo 3',
          'isValid' : false,
        },
      ]
    },
    {
      'question' : 'Question 4',
      'isMultiResponse' : false,
      'propositions' : [
        {
          'content' : 'Propo 1',
          'isValid' : false,
        },
        {
          'content' : 'Propo 2',
          'isValid' : true,
        },
        {
          'content' : 'Propo 3',
          'isValid' : false,
        },
      ]
    },
    {
      'question' : 'Question 5',
      'isMultiResponse' : true,
      'propositions' : [
        {
          'content' : 'Propo 1',
          'isValid' : true,
        },
        {
          'content' : 'Propo 2',
          'isValid' : true,
        },
        {
          'content' : 'Propo 3',
          'isValid' : false,
        },
      ]
    },
    {
      'question' : 'Question 6',
      'isMultiResponse' : false,
      'propositions' : [
        {
          'content' : 'Propo 1',
          'isValid' : false,
        },
        {
          'content' : 'Propo 2',
          'isValid' : true,
        },
        {
          'content' : 'Propo 3',
          'isValid' : false,
        },
      ]
    },
  ];
}