import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travel_app/core/extension/media_query.dart';
import 'package:travel_app/core/extension/sized_box.dart';
import 'package:travel_app/core/themes/app_color.dart';

AppBar buildHeader({required BuildContext context}) => AppBar(
      elevation: 0,
      leadingWidth: 180,
      leading: Row(
        children: [
          //* sized box
          (context.width / 20).pw,
          //* icon
          const Icon(Iconsax.location),
          //* sized box
          (context.width / 20).pw,
          //* text
          const Text(
            "Let's Go",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          //* icon
          const Icon(
            Icons.keyboard_arrow_down,
            size: 30,
          ),
        ],
      ),
      actions: [
        //* notification icon
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.softDark,
                ),
                borderRadius: BorderRadius.circular(25)),
            child: Stack(
              children: [
                const Icon(Iconsax.notification),
                Positioned(
                  top: 2,
                  right: 2,
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: AppColors.red,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
