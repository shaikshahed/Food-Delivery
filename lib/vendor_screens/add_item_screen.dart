import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:engro_food/constants/color_constants.dart';
import 'package:engro_food/vendor_screens/bottom_bar_tabs.dart';
import 'package:engro_food/widgets/food_elevated_button.dart';
import 'package:engro_food/widgets/round_appbar_button.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  TextEditingController _itemNameController = TextEditingController();
  TextEditingController _detailsController = TextEditingController();

  List images = [
    "assets/cooking1.jpg",
    "assets/cooking2.jpg",
    "assets/cooking3.jpg",
    "assets/cooking1.jpg",
    "assets/cooking2.jpg",
  ];

  List basicList = [
    Icons.star_border_outlined,
    Icons.kitchen_outlined,
    Icons.soup_kitchen_outlined,
    Icons.star_border_outlined,
    Icons.star_border_outlined,
    Icons.star_border_outlined,
    Icons.kitchen,
    Icons.star,
    Icons.safety_check,
  ];

  List fruitList = [
    Icons.star_border_outlined,
    Icons.kitchen_outlined,
    Icons.soup_kitchen_outlined,
    Icons.star_border_outlined,
    Icons.star_border_outlined,
    Icons.star_border_outlined,
    Icons.kitchen,
    Icons.star,
    Icons.safety_check,
  ];

  bool pickUp = false;
  bool delivery = false;

  List<File?> _imageList = List.generate(5, (index) => null);
  final picker = ImagePicker();

  Future getImageGallery(int index) async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    setState(() {
      if (pickedFile != null) {
        _imageList[index] = File(pickedFile.path);
      } else {
        print("No image picked");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leadingWidth: 76,
        backgroundColor: Colors.white,
        toolbarHeight: 76,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            RoundAppbarButton(
              icon: Icons.arrow_back_ios_sharp,
              iconColor: Colors.black,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BottomBarTabs()));
              },
              bgColor: appSecondaryColor,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Add New Items",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: Text(
              "RESET",
              style: TextStyle(
                color: appPrimaryColor,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "ITEM NAME",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 50,
                    child: Center(
                      child: TextFormField(
                        controller: _itemNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          hintText: "Mazalichiken Halim",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "UPLOAD PHOTO/VIDEO",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Container(
                height: 150,
                child: ListView.builder(
                  itemCount: images.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: _imageList[index] == null
                                ? () => getImageGallery(index)
                                : null,
                            child: _imageList[index] != null
                                ? Image.file(
                                    _imageList[index]!,
                                    fit: BoxFit.cover,
                                  )
                                : Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add_a_photo,
                                          size: 30,
                                        ),
                                        Text("Add")
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [Text("PRICE")],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 12),
                        child: Text("\$50",
                            style: TextStyle(color: Colors.grey, fontSize: 16)),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: pickUp,
                        onChanged: (bool? value) {
                          setState(() {
                            pickUp = value ?? false;
                          });
                        },
                      ),
                      Text("Pick Up", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Checkbox(
                        value: delivery,
                        onChanged: (bool? value) {
                          setState(() {
                            delivery = value ?? false;
                          });
                        },
                      ),
                      Text("Delivery", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [Text('INGREDIENTS', style: TextStyle(fontSize: 16))],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Basic",
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "See All",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 65,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: basicList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RoundAppbarButton(
                        icon: basicList[index],
                        iconColor: Colors.black,
                        bgColor: appSecondaryColor,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fruit",
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "See All",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 65,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: fruitList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RoundAppbarButton(
                        icon: fruitList[index],
                        iconColor: Colors.black,
                        bgColor: appSecondaryColor,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "DETAILS",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: TextFormField(
                  maxLines: 4,
                  controller: _detailsController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: "Lorem ipsum dolor sit amet,",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ), 
              ),
              SizedBox(
                height: 20,
              ),
              FoodElevatedButton(
                btnText: 'SAVE CHANGES',
                onTapFunction: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
