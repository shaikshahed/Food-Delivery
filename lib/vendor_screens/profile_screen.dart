import 'package:engro_food/constants/color_constants.dart';
import 'package:engro_food/vendor_screens/bottom_bar_tabs.dart';
import 'package:engro_food/widgets/round_appbar_button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                  ),
                  margin: EdgeInsets.only(top: 30,left: 24),
                  child: RoundAppbarButton(
                    icon: Icons.arrow_back_ios, 
                    iconColor: Colors.black, 
                    bgColor: appSecondaryColor,
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomBarTabs()));
                  },),
                ),
                SizedBox(width: 8,),
                Padding(
                  padding: const EdgeInsets.only(top: 26.0,left: 10),
                  child: Text("My Profile",style: TextStyle(color: Colors.white,fontSize: 18),),
                )
              ],
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Available Balance",style: TextStyle(color: Colors.white,fontSize: 16),),
                  Text("\$500.00",style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white) ),
                      child: Center(child: Text("Withdraw",style: TextStyle(color: Colors.white),)),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  ),               
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18,right: 18,top: 18,bottom: 18),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            height: 136,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: appSecondaryColor,
                              borderRadius: BorderRadius.circular(12) 
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10,left: 8,bottom: 10,right: 8),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.white,shape: BoxShape.circle
                                      ),
                                      child: Center(
                                        child: Icon(Icons.person_outline,color: appPrimaryColor,)
                                      )
                                      ),
                                      title: Text('Personal Info',style: TextStyle(),),
                                      trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20,),
                                  ),
                                   ListTile(
                                    leading: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.white,shape: BoxShape.circle
                                      ),
                                      child: Center(
                                        child: Icon(Icons.settings,color: Colors.blue,)
                                      )
                                      ),
                                      title: Text('Settings',style: TextStyle(),),
                                      trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20,),
                                  )
                                ],
                              ),
                            ),
                        ),
                        SizedBox(height: 18,),
                        Container(
                            height: 136,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: appSecondaryColor,
                              borderRadius: BorderRadius.circular(12) 
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10,left: 8,bottom: 10,right: 8),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.white,shape: BoxShape.circle
                                      ),
                                      child: Center(
                                        child: Icon(Icons.person_outline,color: appPrimaryColor,)
                                      )
                                      ),
                                      title: Text('Withdrawal History',style: TextStyle(),),
                                      trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20,),
                                  ),
                                   ListTile(
                                    leading: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.white,shape: BoxShape.circle
                                      ),
                                      child: Center(
                                        child: Icon(Icons.settings,color: Colors.blue,)
                                      )
                                      ),
                                      title: Text('Number of Orders'),
                                      trailing: Text("29K",style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.bold),)
                                  )
                                ],
                              ),
                            ),
                        ),
                        SizedBox(height: 18,),
                         Container(
                            height: 70,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: appSecondaryColor,
                              borderRadius: BorderRadius.circular(12) 
                            ),
                            child: ListTile(
                                    leading: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.white,shape: BoxShape.circle
                                      ),
                                      child: Center(
                                        child: Icon(Icons.person_outline,color: appPrimaryColor,)
                                      )
                                      ),
                                      title: Text('User Reviews',style: TextStyle(),),
                                      trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20,),
                                  ),
                         ),
                         SizedBox(height: 18,),
                          Container(
                            height: 70,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: appSecondaryColor,
                              borderRadius: BorderRadius.circular(12) 
                            ),
                            child: ListTile(
                                    leading: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.white,shape: BoxShape.circle
                                      ),
                                      child: Center(
                                        child: Icon(Icons.person_outline,color: appPrimaryColor,)
                                      )
                                      ),
                                      title: Text('Log Out',style: TextStyle(),),
                                      trailing: Icon(Icons.arrow_forward_ios_outlined,size: 20,),
                                  ),
                         ),
                      ],
                    ),
                  ),
                ),
              ) )
          ],
        ),
      ),
    );
  }
}