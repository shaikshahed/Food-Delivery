// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:engro_food/constants/color_constants.dart';
import 'package:engro_food/vendor_screens/add_item_screen.dart';
import 'package:engro_food/vendor_screens/menu_screen.dart';
import 'package:engro_food/vendor_screens/notification_screen.dart';
import 'package:engro_food/vendor_screens/profile_screen.dart';
import 'package:engro_food/vendor_screens/vendor_home_screen.dart';

class BottomBarTabs extends StatefulWidget {
  const BottomBarTabs({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomBarTabs> createState() => _BottomBarTabsState();
}

class _BottomBarTabsState extends State<BottomBarTabs> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = [
    const VendorHomeScreen(),
    const MenuScreen(),
    const AddItemScreen(),
    const NotificationScreen(),
    const ProfileScreen()
  ];


  void onItemTapped (int index){
    if(index == 4){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfileScreen()));
    }else if(index==2){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddItemScreen()));
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,color: Colors.grey,),
            activeIcon: Icon(Icons.home, color: appPrimaryColor,),
            label: '' ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu,color: Colors.grey,),
            activeIcon: Icon(Icons.menu, color: appPrimaryColor),
            label: '' ),
            BottomNavigationBarItem(
            icon: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: appPrimaryColor),
              ),
              child: Icon(Icons.add,color: Colors.grey,)),
            activeIcon: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: appPrimaryColor),
              ),
              child: Icon(Icons.add, color: appPrimaryColor,)),
            label: '' ),
            BottomNavigationBarItem(
            icon: Icon(Icons.notification_add,color: Colors.grey,),
            activeIcon: Icon(Icons.notification_add,color: appPrimaryColor,),
            label: ''),
            BottomNavigationBarItem(
            icon:Icon(Icons.person_outline,color: Colors.grey,),
            activeIcon: Icon(Icons.person_outline, color: appPrimaryColor,),
            label: '' )
        ] ),
    );
  }
}