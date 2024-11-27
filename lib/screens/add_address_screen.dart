import 'package:engro_food/constants/color_constants.dart';
import 'package:engro_food/widgets/food_elevated_button.dart';
import 'package:engro_food/widgets/round_appbar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  int selected = 0;
  List labels = ["Home", "Work", "Others"];
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
          title: Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 20),
            child: RoundAppbarButton(
                icon: Icons.arrow_back_ios_new,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                bgColor: Colors.black,
                iconColor: appSecondaryColor),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'address'.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.location_on,
                          size: 24,
                        ),
                        fillColor: appFieldsColor,
                        filled: true,
                        contentPadding: const EdgeInsets.all(20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none),
                        hintText: "Search location",
                        hintStyle: const TextStyle(fontSize: 14)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'street'.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                fillColor: appFieldsColor,
                                filled: true,
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width / 2.3,
                                    maxHeight: 100),
                                contentPadding: const EdgeInsets.all(20),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none),
                                hintText: "Street number",
                                hintStyle: const TextStyle(fontSize: 14)),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'post code'.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                fillColor: appFieldsColor,
                                filled: true,
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width / 2.3,
                                    maxHeight: 100),
                                contentPadding: const EdgeInsets.all(20),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none),
                                hintText: "Postcode",
                                hintStyle: const TextStyle(fontSize: 14)),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'apartment'.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        fillColor: appFieldsColor,
                        filled: true,
                        contentPadding: const EdgeInsets.all(20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none),
                        hintText: "Apartment number",
                        hintStyle: const TextStyle(fontSize: 14)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'label as'.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
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
                      itemCount: labels.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selected = index;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
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
                              labels[index],
                              style: TextStyle(
                                  fontSize: 15,
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
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Align(
                  alignment: Alignment.center,
                  child: FoodElevatedButton(
                    btnText: "Save Location",
                    onTapFunction: () {},
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
