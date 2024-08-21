import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takehomechallenge_anggreni/screen_pages/home_page.dart';
import 'package:takehomechallenge_anggreni/screen_pages/search_page.dart';
import 'package:takehomechallenge_anggreni/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => ApiService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/search': (context) => SearchPage(),
        },
      ),
    );
  }
}
