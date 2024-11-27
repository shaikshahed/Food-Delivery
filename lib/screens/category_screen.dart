import 'package:engro_food/constants/color_constants.dart';
import 'package:engro_food/screens/details_screen.dart';
import 'package:engro_food/screens/restaurant_screen.dart';
import 'package:engro_food/widgets/restaurant_widget.dart';
import 'package:engro_food/widgets/round_appbar_button.dart';
import 'package:engro_food/widgets/single_dish_widget.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List restaurants = [
    "assets/restaurant2.png",
    "assets/restaurant1.png",
    "assets/restaurant3.png",
    "assets/restaurant3.png",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          leadingWidth: 76,
          backgroundColor: Colors.white,
          toolbarHeight: 76,
          primary: false,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 20),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(35)),
                    child: IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        // handle the press
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                        color: appSecondaryColor,
                        borderRadius: BorderRadius.circular(35)),
                    child: IconButton(
                      icon: const Icon(
                        Icons.filter_list,
                        color: Colors.black,
                        size: 20,
                      ),
                      onPressed: () {
                        // handle the press
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
          title: Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RoundAppbarButton(
                    icon: Icons.arrow_back_ios_new,
                    iconColor: Colors.black,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    bgColor: appSecondaryColor),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      border: Border.all(color: appSecondaryColor, width: 1.5)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Burger',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: appPrimaryColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 0, top: 15),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  const Text(
                    'Popular Burgers',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ]),
              ),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 20),
                delegate: SliverChildListDelegate(
                  restaurants.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DetailsScreen(
                                          title: "Pizza Calzone European",
                                          description:
                                              "Burger-Chicken-Wings Burger-Chicken-Wings Burger-Chicken-Wings Burger-Chicken-Wings Burger-Chicken-Wings Burger-Chicken-Wings",
                                          rating: "4.7",
                                          delivery: "Free",
                                          time: "20 min",
                                        )));
                          },
                          child: const SingleDishWidget(
                            type: "dish",
                            imgSrc: "assets/hawaiian-pizza.png",
                            title: "Buffalo Burgers",
                            subtitle: "Kabab Restaurant",
                            price: "\$75",
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Open Restaurants',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ]),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  restaurants.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RestaurantScreen(
                                          title: "Rose Garden Restaurant",
                                          description:
                                              "Burger-Chicken-Wings Burger-Chicken-Wings Burger-Chicken-Wings Burger-Chicken-Wings Burger-Chicken-Wings Burger-Chicken-Wings",
                                          rating: "4.7",
                                          delivery: "Free",
                                          time: "20 min",
                                        )));
                          },
                          child: RestaurantWidget(
                            imgSrc: i,
                            title: "Rose Garden Restaurant",
                            subtitle: "Burger-Chicken-Wings",
                            rating: "4.7",
                            delivery: "Free",
                            time: "20 min",
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        // body: SingleChildScrollView(
        //   child: SizedBox(
        //     height: MediaQuery.of(context).size.height,
        //     width: MediaQuery.of(context).size.width,
        //     child: Padding(
        //       padding: const EdgeInsets.only(left: 20.0, right: 0, top: 15),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           const Text(
        //             'Popular Burgers',
        //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        //           ),
        //           const SizedBox(
        //             height: 20,
        //           ),
        //           GridView.builder(
        //             gridDelegate:
        //                 const SliverGridDelegateWithFixedCrossAxisCount(
        //                     crossAxisCount: 2, mainAxisSpacing: 20),
        //             itemCount: 4,
        //             shrinkWrap: true,
        //             physics: NeverScrollableScrollPhysics(),
        //             itemBuilder: (_, index) {
        //               return InkWell(
        //                 onTap: () {
        //                   Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (context) => const DetailsScreen(
        //                                 title: "Pizza Calzone European",
        //                                 description:
        //                                     "Burger-Chicken-Wings Burger-Chicken-Wings Burger-Chicken-Wings Burger-Chicken-Wings Burger-Chicken-Wings Burger-Chicken-Wings",
        //                                 rating: "4.7",
        //                                 delivery: "Free",
        //                                 time: "20 min",
        //                               )));
        //                 },
        //                 child: SingleDishWidget(
        //                   type: "dish",
        //                   imgSrc: index == 0
        //                       ? "assets/burger1.png"
        //                       : "assets/hawaiian-pizza.png",
        //                   title: "Buffalo Burgers",
        //                   subtitle: "Kabab Restaurant",
        //                   price: "\$75",
        //                 ),
        //               );
        //             },
        //           ),
        //           const SizedBox(
        //             height: 20,
        //           ),
        //           const Text(
        //             'Open Restaurants',
        //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        //           ),
        //           const SizedBox(
        //             height: 20,
        //           ),

        //           Expanded(
        //             child: ListView.separated(
        //               separatorBuilder: (context, index) {
        //                 return const SizedBox();
        //               },
        //               shrinkWrap: true,
        //               scrollDirection: Axis.vertical,
        //               itemCount: restaurants.length,
        //               itemBuilder: (BuildContext context, int index) {
        //                 return InkWell(
        //                   onTap: () {
        //                     Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                             builder: (context) =>
        //                                 const RestaurantScreen(
        //                                   title: "Rose Garden Restaurant",
        //                                   description:
        //                                       "Burger-Chicken-Wings Burger-Chicken-Wings Burger-Chicken-Wings Burger-Chicken-Wings Burger-Chicken-Wings Burger-Chicken-Wings",
        //                                   rating: "4.7",
        //                                   delivery: "Free",
        //                                   time: "20 min",
        //                                 )));
        //                   },
        //                   child: RestaurantWidget(
        //                     imgSrc: restaurants[index],
        //                     title: "Rose Garden Restaurant",
        //                     subtitle: "Burger-Chicken-Wings",
        //                     rating: "4.7",
        //                     delivery: "Free",
        //                     time: "20 min",
        //                   ),
        //                 );
        //               },
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
