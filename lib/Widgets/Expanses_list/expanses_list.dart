import 'package:flutter/material.dart';
import 'package:myapp/Widgets/Expanses_list/Expanse_item.dart';

import 'package:myapp/models/expense.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense expense) removeExpense;
const ExpensesList({super.key,required this.expenses,required this.removeExpense});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: expenses.length,itemBuilder: (ctx,index){
     return Dismissible(
      key: ValueKey(expenses[index]),
      direction: DismissDirection.startToEnd,
      onDismissed: (ctx) {removeExpense(expenses[index]);}, 
      background: Container(color: Theme.of(context).colorScheme.error,
      margin:const EdgeInsets.symmetric(horizontal: 16),
      ),
      child: ExpenseItem(expense: expenses[index],));
    },);
  }
}