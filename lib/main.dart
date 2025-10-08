import 'package:flutter/material.dart';
import 'package:news_c16_sun/core/theme/app_theme.dart';
import 'package:news_c16_sun/presentation/home/home_screen.dart';
import 'package:news_c16_sun/presentation/search/search_view.dart';
import 'package:news_c16_sun/presentation/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        SearchView.routeName: (_) => SearchView(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
