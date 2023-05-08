import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

enum Category  {food,leisure,travel,work}
final formatter =  DateFormat.yMd();

final uuid = Uuid();

const categoryIcons = {
  Category.food:Icons.lunch_dining,
Category.leisure:Icons.movie,
Category.travel : Icons.flight_takeoff,
Category.work:Icons.work
};
class Expense {
  final String id;
  final String title;
  final double amount;  
  final DateTime date;
  final Category category;
  String get formattedDate {
   return formatter.format(date);  
  }
Expense({
required this.category,
  required this.title,
  required this.amount,
  required this.date,

}) : id =uuid.v4();



}
class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;
  const ExpenseBucket({required this.category,required this.expenses});
ExpenseBucket.forCategory(List<Expense> allExpenses,this.category) : expenses = allExpenses.where((expense) => category == expense.category).toList();
 
  double get totalExpenses {
    double sum = 0;
   for(final expense in expenses) {
    sum += expense.amount;
   }
    return sum;
  }

}