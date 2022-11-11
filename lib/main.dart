import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// странички
import './pages/splashPage.dart';
import './pages/main_page.dart';

void main() {
  runApp(
    SplashPage(
      key: UniqueKey(),
      onInitializationComplete: () => runApp(
        ProviderScope(
          child: MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Кино',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext _context) => MainPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
