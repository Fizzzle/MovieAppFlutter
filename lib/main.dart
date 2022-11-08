import 'package:flutter/material.dart';

// странички
import './pages/splashPage.dart';

void main() {
  runApp(SplashPage(key: UniqueKey(), onInitializationComplete: () => null));
}
