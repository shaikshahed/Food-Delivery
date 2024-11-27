import 'package:engro_food/constants/color_constants.dart';
import 'package:engro_food/constants/images.dart';
import 'package:engro_food/widgets/round_appbar_button.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
                },
              ),
              SizedBox(width: 15),
              Text(
                'Notifications',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            TabBar(
              indicatorColor: appPrimaryColor,
              labelColor: appPrimaryColor,
              tabs: [
                Tab(
                  text: 'Notifications',
                ),
                Tab(
                  text: 'Messages',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    // color: Colors.green,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              "assets/cooking2.jpg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                       Expanded(
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: 'Tanbir Ahmed ',
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 14,
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            
                                                            text: 'Placed a new order',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors.grey,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                '20 min ago',
                                                style: TextStyle(fontSize: 12,color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                        SizedBox(width: 50),
                                        Container(
                                          height: 60,
                                          width: 60,
                                        
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            // shape: BoxShape.circle,
                                          ),
                                          child: 
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(12),
                                            child: Image.asset(
                                              "assets/cooking1.jpg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
