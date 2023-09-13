import 'package:flutter/material.dart';
import 'package:shopping_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(189, 208, 25, 49),
          primary: const Color.fromARGB(189, 208, 25, 49),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          prefixIconColor: Color.fromARGB(119, 119, 119, 1),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Lato',
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        useMaterial3: true,
      ),
      // home: ProductDetails(
      //   product: products[0],
      // ),
      home: const HomePage(),
    );
  }
}
