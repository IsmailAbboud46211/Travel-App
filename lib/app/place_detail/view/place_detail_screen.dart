import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/app/travel_home/data/model/travel_model.dart';
import 'package:travel_app/core/extension/media_query.dart';
import 'package:travel_app/core/extension/routing_extenstion.dart';
import 'package:travel_app/core/extension/sized_box.dart';
import 'package:travel_app/core/themes/app_color.dart';

class PlaceDetailScreen extends StatefulWidget {
  final TravelDestination travelDestination;
  const PlaceDetailScreen({super.key, required this.travelDestination});

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  PageController pageController = PageController();
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
        backgroundColor: AppColors.softWhite,
        appBar: AppBar(
          backgroundColor: AppColors.softWhite,
          leadingWidth: 64,
          leading: GestureDetector(
            onTap: () => context.pop(),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColors.softDark,
                    )),
                child: const Icon(Icons.arrow_back),
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            "Detail Page",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.deepBlue,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColors.softDark,
                    )),
                child: const Icon(Icons.bookmark),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                height: context.height / 1.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.lightGrey,
                      spreadRadius: 5,
                      blurRadius: 15,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    children: [
                      PageView(
                        controller: pageController,
                        onPageChanged: (value) {
                          setState(() {
                            currentIndex = value;
                          });
                        },
                        children: List.generate(
                          widget.travelDestination.image!.length,
                          (index) => Image.network(
                            widget.travelDestination.image![index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          child: Container(
                            height: context.height / 8,
                            width: context.width,
                            decoration: BoxDecoration(
                              color: AppColors.softDark.withOpacity(0.7),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children: [
                                  //* first row
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(
                                        widget.travelDestination.image!.length,
                                        _buildDotWidget,
                                      ),
                                    ),
                                  ),
                                  //* second row
                                  Row(
                                    children: [
                                      //* name
                                      Text(
                                        widget.travelDestination.name,
                                        style: TextStyle(
                                          color: AppColors.softWhite,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      (context.width / 4).pw,
                                      //* rate
                                      Icon(
                                        Icons.star,
                                        color: AppColors.yellow,
                                      ),
                                      Text(
                                        widget.travelDestination.rate.toString(),
                                        style: TextStyle(
                                          color: AppColors.softWhite,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  )
                                  //* third row
                                  ,
                                  (context.height / 50).ph,
                                  Row(
                                    children: [
                                      //* location
                                      Icon(
                                        Icons.location_on,
                                        color: AppColors.softWhite,
                                      ),
                                      Text(
                                        widget.travelDestination.location,
                                        style: TextStyle(
                                          color: AppColors.softWhite,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                      //* review
                                      ,
                                      (context.width / 3.5).pw,
                                      Text(
                                        "( ${widget.travelDestination.review} reviews)",
                                        style: TextStyle(color: AppColors.softWhite),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              )
              //*  tab bar
              ,
              const SizedBox(height: 10),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.54,
                        child: const TabBar(
                          labelColor: AppColors.primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          unselectedLabelColor: Colors.black,
                          indicatorColor: AppColors.primaryColor,
                          dividerColor: Colors.transparent,
                          tabs: [
                            Tab(text: 'Overview'),
                            Tab(text: 'Review'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                widget.travelDestination.description,
                                maxLines: 3,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            const Center(
                              child: Text('No Review yet'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: context.height / 10,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //* price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Price",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    (context.width / 40).ph,
                    Row(
                      children: [
                        Text(
                          "\$${widget.travelDestination.price}",
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const Text(
                          "  / person",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                )
                //* add to cart button
                ,
                Container(
                  alignment: Alignment.center,
                  height: context.height / 12,
                  width: context.width / 2,
                  decoration:
                      BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //* icon
                      Icon(
                        CupertinoIcons.cart,
                        color: AppColors.softWhite,
                      ),
                      (context.width / 40).pw,
                      //*
                      Text(
                        "Add to cart",
                        style: TextStyle(
                          color: AppColors.softWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
