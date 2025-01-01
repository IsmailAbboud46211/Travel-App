import 'package:flutter/material.dart';
import 'package:travel_app/app/on_bording/data/model/on_bording_model.dart';
import 'package:travel_app/core/extension/media_query.dart';
import 'package:travel_app/core/extension/routing_extenstion.dart';
import 'package:travel_app/core/extension/sized_box.dart';
import 'package:travel_app/core/router/route_name.dart';
import 'package:travel_app/core/themes/app_color.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  //* current index
  int currentIndex = 0;
//* build dot widget
  Widget _buildDotWidget(int index) => AnimatedContainer(
        duration: const Duration(
          milliseconds: 400,
        ),
        margin: const EdgeInsets.only(right: 6),
        width: 30,
        height: 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: index == currentIndex ? AppColors.softWhite : AppColors.lightGrey,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //* build images
          PageView.builder(
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemCount: onboarding.length,
            itemBuilder: (context, index) => Image.network(
              onboarding[index].image,
              fit: BoxFit.cover,
            ),
          ),
          //* skip button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    (context.height / 40).ph,
                    GestureDetector(
                      onTap: () {},
                      child: Visibility(
                          visible: onboarding.length - 1 != currentIndex ? true : false,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 2,
                                  color: AppColors.softWhite,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Skip",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: AppColors.softWhite,
                                ),
                              ),
                            ),
                          )),
                    ),
                    (context.height / 20).ph,
                    //* build text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          onboarding[currentIndex].name,
                          style: TextStyle(
                            fontSize: 70,
                            color: AppColors.softWhite,
                            height: 1.0,
                          ),
                        ),
                        (context.height / 20).ph,
                        Text(
                          "We Travelin are ready to help you on\nvacation around Nepal",
                          style: TextStyle(
                            color: AppColors.softWhite,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        (context.height / 10).ph,
                        //* build list of dots
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            onboarding.length,
                            _buildDotWidget,
                          ),
                        ),
                        (context.height / 5).ph,
                        //* build buttons
                        Column(
                          children: [
                            ClipRRect(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => context.go(
                                      routeName: RoutesNames.travelHomeScreen,
                                      replacement: true,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 1.5),
                                          color: AppColors.lightGrey,
                                          spreadRadius: 1.5,
                                          blurRadius: 1.5,
                                        )
                                      ], color: AppColors.softDark, borderRadius: BorderRadius.circular(25)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Let's Get Started",
                                              style: TextStyle(
                                                color: AppColors.softWhite,
                                              ),
                                            ),
                                            (context.height / 40).pw,
                                            Icon(
                                              Icons.arrow_forward,
                                              color: AppColors.softWhite,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  (context.height / 20).ph,
                                  Text.rich(TextSpan(children: [
                                    TextSpan(
                                        text: "alreday have an account ?",
                                        style: TextStyle(
                                          color: AppColors.softWhite,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        )),
                                    TextSpan(
                                        text: " Log in",
                                        style: TextStyle(
                                          color: AppColors.babyBlue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ))
                                  ]))
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          //* build  button
        ],
      ),
    );
  }
}
