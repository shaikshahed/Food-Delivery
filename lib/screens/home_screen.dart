import 'package:engro_food/screens/restaurant_screen.dart';
import 'package:engro_food/widgets/round_appbar_button.dart';
import 'package:engro_food/widgets/search_page.dart';
import 'package:engro_food/widgets/category_widget.dart';
import 'package:engro_food/constants/color_constants.dart';
import 'package:engro_food/widgets/restaurant_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String locality;
  const HomeScreen({super.key, required this.locality});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List restaurants = [
    "assets/restaurant2.png",
    "assets/restaurant1.png",
    "assets/restaurant3.png"
  ];
  List categories = ["All", "Burgers", "Pizza", "abcd"];
  bool searchPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leadingWidth: 76,
        backgroundColor: Colors.white,
        toolbarHeight: 76,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(35)),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {
                // handle the press
              },
            ),
          ),
          const SizedBox(
            width: 16,
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              decoration: BoxDecoration(
                  color: appSecondaryColor,
                  borderRadius: BorderRadius.circular(35)),
              child: IconButton(
                icon: Icon(
                  searchPage ? Icons.arrow_back_ios_new : Icons.menu,
                  size: 20,
                ),
                onPressed: () {
                  if (searchPage) {
                    setState(() {
                      searchPage = false;
                    });
                  } else {}
                },
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            searchPage
                ? const Text(
                    'Search',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deliver to'.toUpperCase(),
                        style: const TextStyle(
                            color: appPrimaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w800),
                      ),
                       Row(
                        children: [
                          Text(
                            widget.locality,
                            style: TextStyle(fontSize: 14),
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ],
                  ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 0, top: 15),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                searchPage
                    ? const SizedBox()
                    : const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Hey Halal, ',
                                    style: TextStyle(fontSize: 16)),
                                TextSpan(
                                  text: 'Good Afternoon!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 40,
                  child: searchPage
                      ? TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.search,
                                size: 24,
                              ),
                              fillColor: appSecondaryColor,
                              filled: true,
                              contentPadding: const EdgeInsets.all(20),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none),
                              hintText: "Search dishes, restaurants ",
                              hintStyle: const TextStyle(fontSize: 14)),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              searchPage = true;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: appSecondaryColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Search dishes, restaurants",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                searchPage
                    ? const SearchPage()
                    : const Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'All Categories',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 20.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'See All',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right_rounded,
                                        color: Color(0xffA6AABE),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CategoryWidget(imgSrc: "assets/burger.png"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Open Restaurants',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 20.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'See All',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right_rounded,
                                        color: Color(0xffA6AABE),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
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
                                  builder: (context) => const RestaurantScreen(
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
    );
  }
}
