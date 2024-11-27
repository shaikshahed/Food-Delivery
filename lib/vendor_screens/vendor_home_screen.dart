import 'package:engro_food/constants/color_constants.dart';
import 'package:engro_food/constants/images.dart';
import 'package:engro_food/vendor_screens/graph_screen.dart';
import 'package:engro_food/vendor_screens/gridview_widget.dart';
import 'package:engro_food/widgets/round_appbar_button.dart';
import 'package:flutter/material.dart';

class VendorHomeScreen extends StatefulWidget {
  const VendorHomeScreen({super.key});

  @override
  State<VendorHomeScreen> createState() => _VendorHomeScreenState();
}

class _VendorHomeScreenState extends State<VendorHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          leadingWidth: 76,
          backgroundColor: Colors.white,
          toolbarHeight: 76,
          primary: false,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 5, top: 20),
            child: Row(
              children: [
                RoundAppbarButton(
                icon: Icons.menu, 
                iconColor: Colors.black,
                onPressed: () {
                  
                }, 
                bgColor: appSecondaryColor),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('LOCATION', style: TextStyle(color: appPrimaryColor, fontSize: 13, fontWeight: FontWeight.w800),),
                    Row(
                      children: [
                        Text('HALAL LAB OFFICE', style: TextStyle(fontSize: 14),),
                        Icon(Icons.arrow_drop_down,)
                      ],
                    )
                  
                  ],     
                ), 
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle
                ),
                child: Image.asset(allYourFav,fit: BoxFit.cover,),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, top: 20,right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 120,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('20', style: TextStyle(color: Colors.black, fontSize: 30,fontWeight: FontWeight.bold),),
                              Text('RUNNING ORDERS', style: TextStyle(fontSize: 18, color: Colors.grey),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Container(
                        height: 120,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('05', style: TextStyle(color: Colors.black, fontSize: 30,fontWeight: FontWeight.bold),),
                              Text('ORDER REQUEST', style: TextStyle(fontSize: 18, color: Colors.grey),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                ),
                SizedBox(height: 15,),
               Container(
                    
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0,left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Total Revenue', style: TextStyle(fontSize: 16,color: Colors.black),),
                                    Text('2,214',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                              SizedBox(width: 10,),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Daily', style: TextStyle(color: Colors.grey),),
                                      Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              TextButton(
                                child: Text('See Details', style: TextStyle(decoration: TextDecoration.underline,decorationColor: appPrimaryColor,color: appPrimaryColor, fontSize: 18),),
                                onPressed: (){
                                                  
                                },
                                ),
                            ],
                          ),
                      ],
                      ),
                     
                    ],
                  ),
                ),

                SizedBox(height: 10,),
                Container(
                  height: 210,
                  child: LineChartSample2()),
                SizedBox(height: 10,),
                Container(
                  color: Colors.white,
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0,left: 12),
                            child: Text('Reviews',style: TextStyle(fontSize: 16),),
                          ),
                          TextButton(onPressed: (){
                  
                          }, child: Text('See All Reviews',style: TextStyle(decoration: TextDecoration.underline,decorationColor: appPrimaryColor,color: appPrimaryColor,fontSize: 16),))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Icon(Icons.star,color: appPrimaryColor,size: 30,),
                            Text('4.9',style: TextStyle(color: appPrimaryColor,fontSize: 18),),
                            SizedBox(width: 10,),
                            Text('Total 20 Reviews',style: TextStyle(fontSize: 16),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  // color: Colors.blue,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only( left: 12),
                            child: Text('Popular Items This Weeks',style: TextStyle(fontSize: 16),),
                          ),
                          TextButton(onPressed: (){
                
                          }, child: Text('See All', style: TextStyle(decoration: TextDecoration.underline,decorationColor: appPrimaryColor,color: appPrimaryColor,fontSize: 16),))
                        ],
                      ),
                      GridViewWidget()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

