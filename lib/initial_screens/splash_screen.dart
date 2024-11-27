import 'package:engro_food/constants/images.dart';
import 'package:engro_food/login_screen/login_screen.dart';
import 'package:engro_food/widgets/food_elevated_button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  final PageController _pageController = PageController();

  final List<Map<String, String>> pages = [
    {
      'image': allYourFav,
      'title': 'All your favourites',
    },
    {
      'image': orderFromChef,
      'title': 'Order from chosen Chef',
    },
    {
      'image': deliveryOffer,
      'title': 'Free delivery Offers',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 140,
            ),
            SizedBox(
              height: 300, // Need to change with expanded
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    return Image.asset(pages[index]['image']!);
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              pages[currentPage]['title']!,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Get all your loved foods in one place,',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 5),
            const Text(
              'you just place the order we do the rest',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pages.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? Colors.deepOrange
                        : Colors.orange,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FoodElevatedButton(
                onTapFunction: () {
                  if (currentPage < pages.length - 1) {
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  }
                },
                btnText:
                    currentPage < pages.length - 1 ? 'Next' : 'Get Started',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            currentPage < pages.length - 1
                ? SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text('Skip'),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
