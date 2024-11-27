import 'package:engro_food/constants/color_constants.dart';
import 'package:engro_food/vendor_screens/vendor_details_screen.dart';
import 'package:engro_food/widgets/round_appbar_button.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.white,
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
                  bgColor: appSecondaryColor,
                  onPressed: () {
                    Navigator.pop(context);
                  },),
                SizedBox(width: 15,),
                Text('My Food List',style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
          body: Column(
            children:  [
              TabBar(
                indicatorColor: appPrimaryColor,
                labelColor: appPrimaryColor,
                tabs: [
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Breakfast',
              ),
              Tab(
                text: 'Lunch',
              ),
              Tab(
                text: 'Dinner',
              )
              ]
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0,left: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Total 03 Items",style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w400),),
                            Expanded(
                            child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context,index){
                              return buildOrderItem(context);
                          }),
                        ),
                          ],
                        ),
                      ),
                    ),
                    Container(),
                    Container(),
                    Container()
                ]) )
            ],

          ),
        ),
      ),
    );
  }
}


Widget buildOrderItem(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 20,right: 16),
    child: Container(
      // color: Colors.green.shade300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VendorDetailsScreen()),
          );
            },
            child: Container(
              height: 120,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                // border: Border.all(color: Colors.black)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset("assets/cooking3.jpg",fit: BoxFit.cover,))
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16,left: 8,bottom: 8,right: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Text('Chicken Thai Biryani',style: TextStyle(fontWeight: FontWeight.bold),)),
                      Icon(Icons.more_horiz)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 28,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.orange.shade50,
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                        ),
                        child: Center(child: Text('Breakfast',style: TextStyle(color: appPrimaryColor,fontWeight: FontWeight.w500),)),
                      ),
                      Text("\$30",style: TextStyle(fontWeight: FontWeight.bold,),)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star,color: appPrimaryColor,),
                          Text("4.9",style: TextStyle(color: appPrimaryColor,fontWeight: FontWeight.bold),),
                          SizedBox(width: 5,),
                          Text("(10 Review)",style: TextStyle(color: Colors.grey,),),
                        ],
                      ),
                      Text("Pick UP",style: TextStyle(color: Colors.grey),)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
    
  );
}