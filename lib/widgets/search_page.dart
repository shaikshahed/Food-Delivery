import 'package:engro_food/constants/color_constants.dart';
import 'package:engro_food/screens/restaurant_screen.dart';
import 'package:engro_food/widgets/single_dish_widget.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List recents = ["Burger", "Pizza", "Sandwiches", "Biryani", "Pasta"];
  List restaurants = [
    "assets/restaurant2.png",
    "assets/restaurant1.png",
    "assets/restaurant3.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Recent Keywords',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                scrollDirection: Axis.horizontal,
                itemCount: recents.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                          border:
                              Border.all(color: appSecondaryColor, width: 1.5)),
                      child: Text(
                        recents[index],
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Suggested Restaurants',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 12,
                  );
                },
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: restaurants.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RestaurantScreen(
                                      title: "Rose Garden Restaurant",
                                      description:
                                          "Burger-Chicken-Wings Burger-Chicken-Wings Burger-Chicken-Wings Burger-Chicken-Wings Burger-Chicken-Wings Burger-Chicken-Wings",
                                      rating: "4.7",
                                      delivery: "Free",
                                      time: "20 min",
                                    )));
                      },
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 12),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: appSecondaryColor, width: 2))),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                restaurants[index],
                                fit: BoxFit.cover,
                                height: 60,
                                width: 70,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "American Spicy Burger Shop",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star_border_outlined,
                                      color: appPrimaryColor,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "4.7",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ));
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Popular Burgers',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                SingleDishWidget(
                  type: "",
                  imgSrc: "assets/pizza.png",
                  title: "Buffalo Burgers",
                  subtitle: "Kabab Restaurant",
                  price: "\$75",
                ),
                SizedBox(
                  width: 40,
                ),
                SingleDishWidget(
                  type: "",
                  imgSrc: "assets/burger.png",
                  title: "Buffalo Burgers",
                  subtitle: "Kabab Restaurant",
                  price: "\$75",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
