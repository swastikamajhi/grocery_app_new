import 'package:flutter/material.dart';
import 'package:new_app/auth/pages/login_page.dart';
import 'package:new_app/auth/pages/register_page.dart';
import 'package:new_app/providers/cart_provider.dart';
import 'package:new_app/providers/favourites_provider.dart';
import 'package:new_app/providers/form_provider.dart';
import 'package:new_app/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => FavouritesProvider()),
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
        ChangeNotifierProvider(create: (context) => FormProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'NotoSans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
