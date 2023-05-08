import 'package:flutter/material.dart';
import 'package:myapp/Widgets/expenses.dart';
import 'package:flutter/services.dart';

var kColorSchema = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

var kDarkColorSchema = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor:const Color.fromARGB(255, 5, 99, 125));
 void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,]).then((val) =>  {
    
  });
  runApp(
 MaterialApp(home: Expenses(),
 darkTheme: ThemeData.dark().copyWith(
  useMaterial3: true,
  
  colorScheme: kDarkColorSchema,
  cardTheme: CardTheme().copyWith(
    margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
    color: kDarkColorSchema.secondaryContainer),
    elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor:kDarkColorSchema.primaryContainer,
    foregroundColor: kDarkColorSchema.onPrimaryContainer),
  ),
  
  ),
  themeMode: ThemeMode.system,
 theme: ThemeData().copyWith(useMaterial3: true,colorScheme: kColorSchema
 ,appBarTheme: AppBarTheme(
  backgroundColor: kColorSchema.onPrimaryContainer,
  foregroundColor: kColorSchema.primaryContainer
  ),
  cardTheme: CardTheme(
  
  ).copyWith(  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
    color: kColorSchema.secondaryContainer),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor:kColorSchema.primaryContainer),
  ),
  textTheme: ThemeData().textTheme.copyWith(
    titleLarge: TextStyle(fontWeight: FontWeight.bold,color: kColorSchema.onSecondaryContainer,fontSize: 16)
  )
  
  ),
  
  
 ));  
}






