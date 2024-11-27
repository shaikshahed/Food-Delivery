import 'package:engro_food/screens/category_screen.dart';
import 'package:engro_food/widgets/single_dish_widget.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  final String imgSrc;
  const CategoryWidget({super.key, required this.imgSrc});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  int selected = 0;

  List categories = ["All", "Burgers", "Pizza", "abcd"];
  List restaurants = [
    "assets/burger1.png",
    "assets/hawaiian-pizza.png",
    "assets/burger1.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 10,
              );
            },
            shrinkWrap: true,
            padding: const EdgeInsets.only(bottom: 15),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selected = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 10, top: 10, bottom: 10, right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: selected == index
                          ? const Color(0xffFFD27C)
                          : Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 9,
                          offset: const Offset(5, 6),
                        ),
                      ]),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        decoration: BoxDecoration(
                            color: selected == index
                                ? Colors.white
                                : const Color(0xffF6F5F5),
                            borderRadius: BorderRadius.circular(35)),
                        child: IconButton(
                          icon: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 9,
                                offset: const Offset(
                                    5, 6), // changes position of shadow
                              ),
                            ]),
                            child: Image.asset(
                              widget.imgSrc,
                              fit: BoxFit.cover,
                              height: 30,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              selected = index;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        categories[index],
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 205,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 20,
              );
            },
            shrinkWrap: true,
            padding: const EdgeInsets.only(bottom: 15),
            scrollDirection: Axis.horizontal,
            itemCount: restaurants.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CategoryScreen()));
                },
                child: SingleDishWidget(
                  type: "starting",
                  imgSrc: restaurants[index],
                  title: "Burger",
                  subtitle: "",
                  price: "\$75",
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
