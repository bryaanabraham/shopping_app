import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Providers/cart_provider.dart';
import 'package:shopping_app/Pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
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
        home: const HomePage(),
      ),
    );
  }
}
