import 'package:engro_food/constants/color_constants.dart';
import 'package:engro_food/widgets/round_appbar_button.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String title;
  final String description;
  final String rating;
  final String delivery;
  final String time;
  const DetailsScreen(
      {super.key,
      required this.title,
      required this.description,
      required this.rating,
      required this.delivery,
      required this.time});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int selected = 0;
  List sizes = ["10\"", "14\"", "16\""];
  List ingridients = [
    Icons.star_border_outlined,
    Icons.kitchen_outlined,
    Icons.soup_kitchen_outlined,
    Icons.star_border_outlined,
    Icons.star_border_outlined,
    Icons.star_border_outlined,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leadingWidth: 76,
        backgroundColor: Colors.white,
        toolbarHeight: 76,
        primary: false,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 5.0, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                decoration: BoxDecoration(
                    color: appSecondaryColor,
                    borderRadius: BorderRadius.circular(35)),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                'Details',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 250,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.15),
                                    spreadRadius: 0,
                                    blurRadius: 9,
                                    offset: const Offset(
                                        8, 12), // changes position of shadow
                                  ),
                                ],
                                gradient: const RadialGradient(
                                  colors: [
                                    Color(0xffFCA15A),
                                    Color(0xffFFBF6D),
                                  ],
                                  center: Alignment.center,
                                  radius: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const SizedBox(
                                      height: 120,
                                    ),
                                    Align(
                                      alignment: FractionalOffset.centerRight,
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.white30,
                                        ),
                                        child: const Icon(
                                          Icons.favorite_border,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: FractionalOffset.topCenter,
                          child: Image.asset(
                            "assets/hawaiian-pizza.png",
                            // "assets/burger1.png",
                            fit: BoxFit.cover,
                            height: 220,
                            width: 220,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        border:
                            Border.all(color: appSecondaryColor, width: 1.5)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.dinner_dining_sharp,
                          size: 20,
                          color: Colors.red.shade700,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Uttora Coffee House",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'size:'.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        height: 45,
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 10,
                            );
                          },
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(0),
                          scrollDirection: Axis.horizontal,
                          itemCount: sizes.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selected = index;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(11),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: selected == index
                                        ? appPrimaryColor
                                        : appSecondaryColor,
                                    border: Border.all(
                                        color: selected == index
                                            ? appPrimaryColor
                                            : appSecondaryColor,
                                        width: 1.5)),
                                child: Text(
                                  sizes[index],
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
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'ingredients'.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 45,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      scrollDirection: Axis.horizontal,
                      itemCount: ingridients.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xffFFEBE4),
                          ),
                          child: Icon(
                            ingridients[index],
                            size: 20,
                            color: appPrimaryColor,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: appSecondaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                        30,
                      ),
                      topLeft: Radius.circular(
                        30,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "\$67",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xff121223),
                            border: Border.all(
                                color: appSecondaryColor, width: 1.5)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: const Color(0xff41414F),
                                  borderRadius: BorderRadius.circular(35)),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              "2",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: const Color(0xff41414F),
                                  borderRadius: BorderRadius.circular(35)),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
