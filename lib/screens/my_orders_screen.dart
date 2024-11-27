import 'package:engro_food/constants/images.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 245, 250, 1.0),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            'My Orders',
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 245, 250, 1.0),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            TabBar(
              indicatorColor: Colors.orange,
              labelColor: Colors.orange,
              tabs:  [
                Tab(
                  text: 'Ongoing',
                ),
                Tab(
                  text: 'History',
                )
              ]
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Ongoing Orders Tab
                  Container(
                    child: ListView.builder(
                      itemCount: 3, 
                      itemBuilder: (context, index) {
                        return buildOrderItem(true); // true indicates ongoing orders
                      },
                    ),
                  ),
                  // History Orders Tab
                  Container(
                    child: ListView.builder(
                      itemCount: 3, 
                      itemBuilder: (context, index) {
                        return buildOrderItem(false); // false indicates history orders
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOrderItem(bool isOngoing) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Food'),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Image.asset(deliveryOffer, fit: BoxFit.cover),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Pizza hut', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Text('#162432', style: TextStyle(decoration: TextDecoration.underline)),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Text('35.25', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            SizedBox(width: 10,),
                            Text('|'),
                            SizedBox(width: 10,),
                            Text(
                              isOngoing ? '03 Items' : '09 June,4:30 • 03 Items'
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (isOngoing) {
                          // Track Order button action
                        } else {
                          // Rate button action
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: isOngoing ?  Colors.orange : Colors.white, // Customize button color based on tab
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color:  Colors.orange ),
                            borderRadius: BorderRadius.circular(5.0),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                        child: Text(isOngoing ? 'Track Order' : 'Rate', textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (isOngoing) {
                          // Cancel button action
                        } else {
                          // Re-order button action
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: isOngoing ? Colors.white :Colors.orange,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color:  Colors.orange),
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 10),
                        child: Text(isOngoing ? 'Cancel' : 'Re-order', textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
