import 'dart:convert';

// Пакеты
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

// Сервис
import '../services/http_service.dart';
import '../services/movie_service.dart';

// Модели
import '../model/app_config.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.onInitializationComplete});

  final VoidCallback onInitializationComplete;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((_) => _setup(context).then(
          (_) => widget.onInitializationComplete(),
        ));
  }

  Future<void> _setup(BuildContext _context) async {
    //
    final getIt = GetIt.instance;

    final configFile = await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(configFile);

    getIt.registerSingleton<AppConfig>(AppConfig(
        BASE_API_URL: configData['BASE_API_URL'],
        BASE_IMAGE_API_URL: configData['BASE_IMAGE_API_URL'],
        API_KEY: configData['API_KEY']));

    getIt.registerSingleton<HTTPService>(
      HTTPService(),
    );

    getIt.registerSingleton<MovieService>(
      MovieService(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Кино',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Center(
        child: Container(
          height: 200,
          width: 200,
          child: Text(
            'Гринч писюн динозавра',
            style: TextStyle(fontSize: 33, fontWeight: FontWeight.w700),
          ),
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         fit: BoxFit.cover,
          //         image: AssetImage('assets/images/logo.png'))),
        ),
      ),
    );
  }
}
