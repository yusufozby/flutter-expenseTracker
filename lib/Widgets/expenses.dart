


import 'package:flutter/material.dart';
import 'package:myapp/Widgets/chart/chart.dart';
import 'package:myapp/Widgets/new_expense.dart';
import 'package:myapp/models/expense.dart';
import 'package:myapp/Widgets/Expanses_list/expanses_list.dart';


class Expenses extends StatefulWidget {
  
 State<Expenses> createState () => ExpensesState();
}

class ExpensesState extends State<Expenses> {
 
  void _openAddExpenseOverlay(){
    showModalBottomSheet(context: context, builder:(c)=> NewExpense(addExpense: addExpense),isScrollControlled: true);
  }
 final List<Expense> _registeredExpenses = [Expense(title:'Flutter Course',amount: 19.19,date: DateTime.now(),category: Category.work),
                                             Expense(title:'Cinema',amount: 15,date: DateTime.now(),category: Category.leisure)];
  
  void addExpense(Expense item){
    setState(() {
      _registeredExpenses.add(item);
    });
  }
  void deleteExpense(Expense item){
    final expenseIndex = _registeredExpenses.indexOf(item);
    setState(() {
          _registeredExpenses.remove(item);
    }
    
    );
    ScaffoldMessenger.of(context).clearSnackBars();
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content:const Text('Item deleted'),
    duration: const Duration(seconds: 3),
    
    action: SnackBarAction(
      label:'Undo', 
      onPressed: (){
        setState(() {
                  _registeredExpenses.insert(expenseIndex,item);
        });

        }),));

  }
  Widget build(BuildContext context) {
 final width =   MediaQuery.of(context).size.width;
 final height = MediaQuery.of(context).size.height;
    Widget mainContent = const Center(
      child:  Text('No Expenses found  ! Start adding some'),
    );

   if(_registeredExpenses.isNotEmpty){

   mainContent =   ExpensesList(expenses: _registeredExpenses,removeExpense: deleteExpense);
   }


    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: _openAddExpenseOverlay, icon:const Icon(Icons.add))]
        ,title:const Text('Flutter ExpenseTracker'), 
      ),
      body: Column(mainAxisSize: MainAxisSize.max,children:  <Widget> [
         Chart(expenses: _registeredExpenses),
        Expanded(child:mainContent,flex: 15,),
        const Spacer(),
        
      

      ],),
    );
  }
}