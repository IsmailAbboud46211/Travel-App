import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travel_app/app/travel_home/data/model/travel_model.dart';
import 'package:travel_app/app/travel_home/view/widgets/header.dart';
import 'package:travel_app/app/travel_home/view/widgets/popular_travel.dart';
import 'package:travel_app/app/travel_home/view/widgets/recomendate_place.dart';
import 'package:travel_app/core/extension/media_query.dart';
import 'package:travel_app/core/extension/routing_extenstion.dart';
import 'package:travel_app/core/extension/sized_box.dart';
import 'package:travel_app/core/router/route_name.dart';
import 'package:travel_app/core/themes/app_color.dart';

class TravelHomeScreen extends StatefulWidget {
  const TravelHomeScreen({super.key});

  @override
  State<TravelHomeScreen> createState() => _TravelHomeScreenState();
}

class _TravelHomeScreenState extends State<TravelHomeScreen> {
  //* nav bar
  int selectedPage = 0;
  List<IconData> icons = [
    Iconsax.home1,
    Iconsax.search_normal,
    Icons.confirmation_number_outlined,
    Icons.bookmark_outline,
    Icons.person_outline,
  ];
  //* list of  popular travel  model
  List<TravelDestination> popularPlaces =
      myDestination.where((element) => element.category == "popular").toList();
  //* list of recomend  travel model
  List<TravelDestination> recomendPlaces =
      myDestination.where((element) => element.category == "recomend").toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHeader(context: context),
      body: Column(
        children: [
          (context.height / 40).ph,
          //* text
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular places",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "see all",
                  style: TextStyle(color: AppColors.primaryColor),
                )
              ],
            ),
          ),
          (context.height / 40).ph,
          //* list of popular places
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(bottom: 25),
            child: Row(
              children: List.generate(
                popularPlaces.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GestureDetector(
                    onTap: () => context.go(
                      routeName: RoutesNames.travelDetail,
                      arguments: popularPlaces[index],
                    ),
                    child: PopularTravel(
                      destination: popularPlaces[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
          //* text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recomendation for you",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "see all",
                  style: TextStyle(color: AppColors.primaryColor),
                )
              ],
            ),
          ),
          (context.height / 40).ph,
          //* list of recomendate places
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: List.generate(
                  recomendPlaces.length,
                  (index) => GestureDetector(
                    onTap: () => context.go(
                      routeName: RoutesNames.travelDetail,
                      arguments: recomendPlaces[index],
                    ),
                    child: RecomendatePlace(
                      destination: recomendPlaces[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: context.width,
                  height: context.height / 20,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: AppColors.softDark,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      icons.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPage = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            icons[index],
                            color: selectedPage == index ? AppColors.softWhite : AppColors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
