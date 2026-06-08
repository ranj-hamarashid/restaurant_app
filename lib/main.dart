import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // ١. دڵنیابە لە هاوردەکردنی پاكێجی پرۆڤایدەر
import 'package:restaurant_app/models/shop.dart'; // ٢. پێویستە کڵاسی Shop هاوردە بکەیت (بەپێی ناوی فۆڵدەرەکەت)
import 'package:restaurant_app/pages/Menu_page.dart';
import 'package:restaurant_app/pages/intro_page.dart';
import 'package:restaurant_app/pages/Cart_page.dart';

void main() {
  // ٣. لێرەدا runApp زیادکرا و پیتەکان ڕاستکرانەوە
  runApp(
    ChangeNotifierProvider(create: (context) => Shop(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: const Intro_page(),
      routes: {
        "intro": (context) => const Intro_page(),
        '/menupage': (context) => const Menu_page(),
        "/cartpage": (context) => const CartPage(),
      },
    );
  }
}
