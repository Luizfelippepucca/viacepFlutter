import 'package:dio/pages/adress.dart';
import 'package:dio/pages/card_details.dart';
import 'package:dio/pages/dados_cadastrais.dart';
import 'package:dio/pages/login.dart';
import 'package:dio/pages/todolist.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';

import 'pages/settings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        LoginPage.routeName: (_) => const LoginPage(),
        HomePage.routeName: (_) => const HomePage(),
        DadosCadastrais.routeName: (_) => const DadosCadastrais(),
        CardDetail.routeName: (_) => const CardDetail(),
        Settings.routeName: (_) => const Settings(),
        TodoList.routeName: (_) => const TodoList(),
        Adress.routename: (_) => const Adress()
      },
      theme: ThemeData(
        unselectedWidgetColor: Colors.purple,
        primarySwatch: Colors.purple,
        textTheme: const TextTheme(
          titleMedium: TextStyle(
              fontSize: 20, color: Colors.purple, fontWeight: FontWeight.w500),
          titleLarge: TextStyle(
            fontSize: 35,
            // color: Colors.grey,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
