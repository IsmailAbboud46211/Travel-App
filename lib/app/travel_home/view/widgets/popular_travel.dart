import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travel_app/app/travel_home/data/model/travel_model.dart';
import 'package:travel_app/core/extension/media_query.dart';
import 'package:travel_app/core/extension/sized_box.dart';
import 'package:travel_app/core/themes/app_color.dart';

class PopularTravel extends StatelessWidget {
  final TravelDestination destination;
  const PopularTravel({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            bottom: 0,
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(color: AppColors.softWhite, boxShadow: [
                BoxShadow(
                  color: AppColors.lightGrey,
                  spreadRadius: 15,
                  blurRadius: 5,
                )
              ]),
            )),
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            height: context.height / 4,
            width: context.width / 1.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                    image: NetworkImage(
                      destination.image![0],
                    ),
                    fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Container(
                  height: context.height / 12,
                  color: AppColors.softDark.withOpacity(0.7),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              destination.name,
                              style: TextStyle(color: AppColors.softWhite),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.softWhite,
                                ),
                                (context.width / 50).pw,
                                Text(
                                  destination.location,
                                  style: TextStyle(color: AppColors.softWhite),
                                )
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Icon(
                              Iconsax.star1,
                              color: AppColors.yellow,
                            ),
                            (context.width / 50).pw,
                            Text(
                              destination.rate.toString(),
                              style: TextStyle(
                                color: AppColors.softWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
