import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Core/AppRouter/PageRoute.dart';
import 'package:news_app/Feature/HomeScreen/DetailsArticleView.dart';
import 'package:news_app/Feature/HomeScreen/HomeView.dart';
import 'package:news_app/Feature/SplashScreen/SplashView.dart';

class RoutesGenerator{
  static Route<dynamic> onGenerator(RouteSettings settings){
    switch(settings.name){
      case PageRoutes.initial :
        return MaterialPageRoute(builder: (context) =>const SplashScreen(),settings : settings);
      case PageRoutes.homePage :
        return MaterialPageRoute(builder: (context) =>const HomePage(),settings : settings);
      case PageRoutes.detailsArticle :
        return MaterialPageRoute(builder: (context) =>const DetailsArticleView(), settings : settings);
      default :
        return MaterialPageRoute(builder: (context) =>const SplashScreen(),settings : settings);
    }
  }
}