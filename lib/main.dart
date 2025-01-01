import 'package:flutter/material.dart';
import 'package:travel_app/app_wrapper.dart';
import 'package:travel_app/core/router/app_router.dart';
import 'package:travel_app/core/themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //* Router
  AppRouter appRouter = AppRouter();

  runApp(
    TravelApp(
      appRouter: appRouter,
    ),
  );
}

class TravelApp extends StatelessWidget {
  final AppRouter appRouter;
  const TravelApp({required this.appRouter, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.onGeneratedRoutes,
      theme: LightTheme.setLightMode(),
      home: const AppWrapper(),
    );
  }
}
