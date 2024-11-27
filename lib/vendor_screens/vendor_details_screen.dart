import 'package:carousel_slider/carousel_slider.dart';
import 'package:engro_food/constants/color_constants.dart';
import 'package:engro_food/widgets/round_appbar_button.dart';
import 'package:flutter/material.dart';

class VendorDetailsScreen extends StatefulWidget {
  const VendorDetailsScreen({super.key});

  @override
  State<VendorDetailsScreen> createState() => _VendorDetailsScreenState();
}

class _VendorDetailsScreenState extends State<VendorDetailsScreen> {
  int _current = 0;
  List imgList = [
    "assets/cooking1.jpg",
    "assets/cooking2.jpg",
    "assets/cooking3.jpg"
  ];
  final CarouselController _carouselController = CarouselController();
   List ingridients = [
    Icons.star_border_outlined,
    Icons.kitchen_outlined,
    Icons.soup_kitchen_outlined,
    Icons.star_border_outlined,
    Icons.star_border_outlined,
    Icons.star_border_outlined,
    Icons.kitchen,
    Icons.star,
    Icons.safety_check
  ];
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
                  Navigator.pop(context);
                }, 
                bgColor: appSecondaryColor),
                SizedBox(
                  width: 20,
                ),
              Text("Food Details",style: TextStyle(fontSize: 18),)
          ],
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20,),
            child: Text("EDIT",style: TextStyle(color: appPrimaryColor,fontSize: 14,),),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height/3.2,
                  padEnds: false,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: imgList.map((i){
                  return Builder(
                    builder: (BuildContext context){
                    return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      child: Image.asset(
                        i,
                        fit: BoxFit.cover,
                        // color: Colors.green,
                        height: MediaQuery.of(context).size.height/3.2,
                        width: MediaQuery.of(context).size.width,
                      ),
                    );
                  },
                  );
                }).toList(),
                ),
                Positioned(
                  bottom: 40,
                  left: 10,
                  child: Container(
                    height: 28,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: appSecondaryColor
                    ),
                    child: Center(child: Text('Breakfast',style: TextStyle(color: Colors.black),)),
                  ),
                ),
                 SizedBox(
                  height: MediaQuery.of(context).size.height/3,
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry){
                        return GestureDetector(
                          onTap: () => _carouselController.animateToPage(entry.key),
                          child: Container(
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(
                              vertical: 50.0,horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.white60
                            ).withOpacity(_current == entry.key ? 0.9 : 0.4)
                            ),
                          ),
                        );
                      }).toList()
                    ),
                  ),
                 ),
                Positioned(
                  bottom: 40,
                  right: 10,
                  child: Container(
                    height: 28,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white
                    ),
                    child: Center(child: Text('Delivery',style: TextStyle(color: Colors.black),)),
                  ),
                )
              ]
            ),
            // SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: [
                Text("Chicken Thai Biryani",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                Text("\$60",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
              ],
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_pin,color: Colors.grey,),
                    Text("Kentucky 39495",style: TextStyle(color: Colors.grey,fontSize: 14),),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star,color: appPrimaryColor,),
                    Text("4.9",style: TextStyle(color: appPrimaryColor,fontSize: 14),),
                    Text("(10 Reviews)",style: TextStyle(color: Colors.grey,fontSize: 14),)
                  ],
                )
              ],
            ),
            SizedBox(height: 8,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 1.0,
              color: Colors.grey,
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Text("Ingredients".toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 16),)
              ],
            ),
            SizedBox(height: 10,),
           SizedBox(
            // height: 290,
             child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 18,
                crossAxisSpacing: 10),
                itemCount: ingridients.length, 
              itemBuilder: (context,index){
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                    height: 40,
                    width: 40,
                          // padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xffFFEBE4),
                          ),
                          child: Icon(
                            ingridients[index],
                            size: 20,
                            color: appPrimaryColor,
                          ),
                        ),
                        SizedBox(height: 4,),
                        Text("Salt",style: TextStyle(fontSize: 14),)
                  ]
                );
              }),
           ),
           SizedBox(height: 8,),
           Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 1.0,
              color: Colors.grey,
            ),
             Padding(
               padding: const EdgeInsets.only(bottom: 5.0,top: 8),
               child: Column(
                 children: [
                   Row(
                    children: [
                      Text("Description".toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 14),)
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text("Lorem ipsum dolorLorem ipsum dolorLorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor ", style: TextStyle(color: Colors.grey,fontSize: 14),)
                 ],
               ),
             ),
      
            
          ],
        ),
      ),
    );
  }
}