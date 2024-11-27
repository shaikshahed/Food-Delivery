import 'package:carousel_slider/carousel_slider.dart';
import 'package:engro_food/screens/addresses_screen.dart';
import 'package:engro_food/constants/color_constants.dart';
import 'package:engro_food/widgets/round_appbar_button.dart';
import 'package:engro_food/widgets/single_dish_widget.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatefulWidget {
  final String title;
  final String description;
  final String rating;
  final String delivery;
  final String time;
  const RestaurantScreen(
      {super.key,
      required this.title,
      required this.description,
      required this.rating,
      required this.delivery,
      required this.time});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  int selected = 0;
  int _current = 1;
  List imgList = [
    "assets/cooking1.jpg",
    "assets/cooking2.jpg",
    "assets/cooking3.jpg"
  ];
  List recents = ["Burger", "Pizza", "Sandwiches", "Biryani", "Pasta"];
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CarouselSlider(
                  carouselController: _controller,
                  options: CarouselOptions(
                      height: 320,
                      padEnds: false,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                  items: imgList.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          child: Image.asset(
                            i,
                            fit: BoxFit.cover,
                            height: 320,
                            width: MediaQuery.of(context).size.width,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RoundAppbarButton(
                          icon: Icons.arrow_back_ios_new,
                          iconColor: Colors.black,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          bgColor: appSecondaryColor),
                      Container(
                        width: 50,
                        decoration: BoxDecoration(
                            color: appSecondaryColor,
                            borderRadius: BorderRadius.circular(35)),
                        child: IconButton(
                          icon: const Icon(
                            Icons.more_horiz,
                            size: 18,
                            weight: 50,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 320,
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.white60)
                                      .withOpacity(
                                          _current == entry.key ? 0.9 : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                top: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      widget.description,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffA6AABE),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      // SizedBox(
                      //   height: 25,
                      //   width: 25,
                      //   child: SvgPicture.asset(
                      //     "assets/star.svg",
                      //     width: 18,
                      //     height: 20,
                      //   ),
                      // ),
                      const Icon(
                        Icons.star_border_outlined,
                        color: appPrimaryColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.rating,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.delivery_dining_outlined,
                        color: appPrimaryColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.delivery,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.access_time_outlined,
                        color: appPrimaryColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.time,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
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
                          onTap: () {
                            setState(() {
                              selected = index;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: selected == index
                                    ? appPrimaryColor
                                    : Colors.white,
                                border: Border.all(
                                    color: selected == index
                                        ? appPrimaryColor
                                        : appSecondaryColor,
                                    width: 1.5)),
                            child: Text(
                              recents[index],
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: selected == index
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        );
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
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddressesScreen()));
                        },
                        child: const SingleDishWidget(
                          type: "dish",
                          imgSrc: "assets/burger.png",
                          title: "Buffalo Burgers",
                          subtitle: "Kabab Restaurant",
                          price: "\$75",
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      const SingleDishWidget(
                        type: "dish",
                        imgSrc: "assets/burger1.png",
                        title: "Buffalo Burgers",
                        subtitle: "Kabab Restaurant",
                        price: "\$75",
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
