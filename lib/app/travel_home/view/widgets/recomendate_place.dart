import 'package:flutter/material.dart';
import 'package:travel_app/app/travel_home/data/model/travel_model.dart';
import 'package:travel_app/core/extension/media_query.dart';
import 'package:travel_app/core/extension/sized_box.dart';
import 'package:travel_app/core/themes/app_color.dart';

class RecomendatePlace extends StatelessWidget {
  final TravelDestination destination;
  const RecomendatePlace({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: context.height / 8,
        decoration: BoxDecoration(
          color: AppColors.softWhite,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          children: [
            //* image
            Container(
              height: context.height / 5,
              width: context.width / 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: NetworkImage(
                      destination.image![0],
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
            //* sized box
            (context.width / 15).pw,
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  destination.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on),
                    Text(
                      destination.location,
                    )
                  ],
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: " ${destination.rate} ",
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                      )),
                  TextSpan(
                    text: "(${destination.review}  reviews)",
                  ),
                ]))
              ],
            )),
            Column(
              children: [
                const Spacer(),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "\$ ${destination.price} ",
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        color: AppColors.primaryColor,
                      )),
                ]))
              ],
            )
          ],
        ),
      ),
    );
  }
}
