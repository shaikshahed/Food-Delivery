import 'package:engro_food/screens/add_address_screen.dart';
import 'package:engro_food/constants/color_constants.dart';
import 'package:engro_food/widgets/address_widget.dart';
import 'package:engro_food/widgets/food_elevated_button.dart';
import 'package:engro_food/widgets/payment.dart';
import 'package:engro_food/widgets/round_appbar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
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
              const Text(
                'My Addresses',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            const Column(
              children: [
                AddressWidget(
                  address: "2324 Royal Ln, Street, New Jersey 398423",
                  type: "home",
                ),
                SizedBox(
                  height: 20,
                ),
                AddressWidget(
                  address: "2324 Royal Ln, Street, New Jersey 398423",
                  type: "work",
                ),
                SizedBox(
                  height: 20,
                ),
                AddressWidget(
                  address: "2324 Royal Ln, Street, New Jersey 398423",
                  type: "others",
                )
              ],
            ),
            Positioned(
              bottom: 10,
              child: Align(
                  alignment: Alignment.center,
                  child: FoodElevatedButton(
                    btnText: "Add New Address",
                    onTapFunction: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddAddressScreen()));
                    },
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
