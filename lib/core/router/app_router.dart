import 'package:flutter/material.dart';
import 'package:travel_app/app/on_bording/view/on_bording_screen.dart';
import 'package:travel_app/app/place_detail/view/place_detail_screen.dart';
import 'package:travel_app/app/travel_home/data/model/travel_model.dart';
import 'package:travel_app/app/travel_home/view/travel_home_screen.dart';
import 'package:travel_app/core/router/route_name.dart';

class AppRouter {
  Route? onGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.onBording:
        return MaterialPageRoute(
          builder: (_) => const OnBordingScreen(),
        );

      case RoutesNames.travelHomeScreen:
        return MaterialPageRoute(
          builder: (_) => const TravelHomeScreen(),
        );

      case RoutesNames.travelDetail:
        return MaterialPageRoute(
          builder: (_) => PlaceDetailScreen(
            travelDestination: settings.arguments as TravelDestination,
          ),
        );
    }

    return null;
  }
}
