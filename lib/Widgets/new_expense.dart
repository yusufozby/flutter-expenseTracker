

import 'package:flutter/material.dart';
import 'package:myapp/models/expense.dart';


class NewExpense extends StatefulWidget {
  const NewExpense({super.key,required this.addExpense});
  final void Function(Expense e) addExpense;

State<NewExpense> createState()=>_NewExpenseState();
}
class _NewExpenseState extends State<NewExpense> {  
var titleController = TextEditingController();
var amountController = TextEditingController();
  DateTime? selectedDate; 
  
void presentShowPicker () async{
  final now = DateTime.now();
 
  final firstDate = DateTime(now.year-1 ,now.month,now.day);
  final pickedDate = await showDatePicker(context: context, initialDate: now, firstDate: firstDate, lastDate: now);

  setState((){
  selectedDate = pickedDate;
});
}
@override
Category selectedCategory = Category.leisure;

  void dispose() {
    amountController.dispose();
    titleController.dispose();
    super.dispose();
  }
  void submitExpenses(){
    final enteredAmount = double.tryParse(amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
if(titleController.text.trim().isEmpty || amountIsInvalid || selectedDate == null){
showDialog(context: context, 
builder: (ctx) => AlertDialog(title: const Text('Invalid input')
,content:const Text('Please make sure a valid title, amount and date category was entered'),actions: [TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('okay'))] ,),);
return;
}
else {

widget.addExpense(Expense(category:selectedCategory , title: titleController.text, amount: enteredAmount, date: selectedDate!));
Navigator.pop(context);
}
  }
  Widget build(BuildContext context) {
  
  final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return 
    Padding(padding: EdgeInsets.fromLTRB(16,48,16,keyboardSpace+16),child: 
    Column(children:<Widget>[
      TextField(
        maxLength: 50,
        decoration:const InputDecoration(label: Text('Title')),
        controller: titleController,
        
      ),
 
          Row(children: <Widget>[
            Expanded(child:         TextField(
     
        decoration:const InputDecoration(label:Text('Amount'),prefixText: '\₺'),
        controller: amountController,
       keyboardType: TextInputType.number,
       
        
      ),),
   
      const SizedBox(width: 16,),
 
     
        Expanded(
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:
           [
            Text(selectedDate == null ? 'No Date Selected!' : formatter.format(selectedDate!),),
            IconButton(onPressed:presentShowPicker, 
            icon: const Icon(Icons.calendar_month))],
           )
           )
           
    
      ],
      ),
     const SizedBox(height: 16,),
      Row(
        children: [
       
          DropdownButton(value: selectedCategory,items: Category.values.map((e) => DropdownMenuItem(value: e,child: Text(e.name.toUpperCase()))).toList(), onChanged:(val){
       if(val == null){
        return;
        }
       
        setState(() {
          selectedCategory  =  val!;
        });
          }),
          const Spacer(),
    

          TextButton(
          onPressed: (){Navigator.pop(context);}, 
        child:const Text('Cancel')),ElevatedButton(
          onPressed: submitExpenses, 
          child:const  Text('Save Changes'))],
      )
      
    ]
    ),
    );
  }
}