import 'package:get/get.dart';

class QuizzController extends GetxController{
  List<Map<String,dynamic>> quizz = [
    {
      'question' : 'Comment se nomme la directrice actuelle de MTN Bénin ?',
      'isMultiResponse' : false,
      'propositions' : [
        {
          'content' : 'Ahouessan Bertine',
          'isValid' : false,
        },
        {
          'content' : 'Uche Ofodile',
          'isValid' : true,
        },
        {
          'content' : 'Agathe Okochuku',
          'isValid' : false,
        },
      ]
    },
    {
      'question' : 'Quel est le code USSD utilisé pour accéder aux services de MTN Mobile Money ?',
      'isMultiResponse' : false,
      'propositions' : [
        {
          'content' : '*123#',
          'isValid' : true,
        },
        {
          'content' : '#MTNMoney',
          'isValid' : false,
        },
        {
          'content' : '555',
          'isValid' : false,
        },
      ]
    },
    {
      'question' : 'Quelle est la portée géographique de MTN Mobile Money ? Dans combien de pays est-il actuellement disponible ?',
      'isMultiResponse' : true,
      'propositions' : [
        {
          'content' : 'Disponible dans un seul pays',
          'isValid' : true,
        },
        {
          'content' : 'Disponible dans plusieurs pays, mais limité à lAfrique',
          'isValid' : false,
        },
        {
          'content' : 'Disponible dans de nombreux pays à travers le monde',
          'isValid' : true,
        },
      ]
    },
    {
      'question' : 'Quelle est la vision future de MTN Mobile Money en termes d\'innovation et d\'expansion de ses services ?',
      'isMultiResponse' : true,
      'propositions' : [
        {
          'content' : 'Explorer de nouvelles technologies et étendre les services financiers offerts',
          'isValid' : true,
        },
        {
          'content' : 'Se concentrer uniquement sur les transferts d\'argent',
          'isValid' : true,
        },
        {
          'content' : 'Se retirer du marché des services financiers mobiles',
          'isValid' : false,
        },
      ]
    },
    {
      'question' : 'Quel rôle joue MTN Mobile Money dans le développement économique des régions où il opère ?',
      'isMultiResponse' : false,
      'propositions' : [
        {
          'content' : 'Aucun rôle dans le développement économique',
          'isValid' : false,
        },
        {
          'content' : 'Facilitation des petites entreprises en fournissant des services financiers',
          'isValid' : true,
        },
        {
          'content' : 'Encouragement de la dépendance économique',
          'isValid' : false,
        },
      ]
    }
  ];}