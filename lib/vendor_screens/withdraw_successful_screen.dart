import 'package:engro_food/constants/images.dart';
import 'package:engro_food/vendor_screens/vendor_home_screen.dart';
import 'package:engro_food/widgets/food_elevated_button.dart';
import 'package:flutter/material.dart';

class WithdrawSuccessfulScreen extends StatelessWidget {
  const WithdrawSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                child: Image.asset(withdrawImage,fit: BoxFit.cover,)),
              SizedBox(height: 5,),
              Text("Withdraw Successful",style: TextStyle(fontSize: 24),),
              SizedBox(height: 15,),
              FoodElevatedButton(btnText: "OK", onTapFunction: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>VendorHomeScreen()));
              })
            ],
          ),
        ),
      ),
    );
  }
}