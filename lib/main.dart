import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/bloc/news_bloc.dart';
import 'package:news_application/presentation/on_bording.dart';
import 'package:news_application/presentation/screens/splash_screen.dart';
import 'package:news_application/presentation/widgets/pageview_widgets/business.dart';
import 'package:news_application/presentation/widgets/pageview_widgets/entertaiment.dart';
import 'package:news_application/presentation/widgets/pageview_widgets/headline.dart';
import 'package:news_application/presentation/widgets/pageview_widgets/health.dart';
import 'package:news_application/presentation/widgets/pageview_widgets/political.dart';
import 'package:news_application/presentation/widgets/pageview_widgets/sports.dart';
import 'package:news_application/presentation/widgets/pageview_widgets/technology.dart';
import 'package:news_application/provider/provider.dart';
import 'package:news_application/repo/news_repo.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static  List<Widget Function(BuildContext)> routes = [
        //(context) => OnBordingScreen(),
        (context) => HeadlinePage(),
        (context) => PoliticalPage(),
        (context) => SportsPage(),
        (context) => HealthPage(),
        (context) => TechPage(),
        (context) => BusinessPage(),
        (context) => EntertaiMentPage(),
    // Add more routes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> NewsBloc(NewsRepo()),
      child: ChangeNotifierProvider(
        create: (context)=>MyProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News Application',
          home: SplashScreen(),
          routes: generateRoutes(),
        ),
      ),
    );
  }
  Map<String, Widget Function(BuildContext)> generateRoutes() {
    Map<String, Widget Function(BuildContext)> routeMap = {};
    for (var i = 0; i < routes.length; i++) {
      routeMap['/screen$i'] = routes[i];
    }
    return routeMap;
  }
}

