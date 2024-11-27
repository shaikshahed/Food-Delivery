import 'package:engro_food/constants/images.dart';
import 'package:engro_food/widgets/add_card.dart';
import 'package:engro_food/widgets/success_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  List logos = [cash, visa, mastercard, paypal];
  List logoNames = ["Cash", "Visa", "Mastercard", "PayPal"];
  int? selectedCardIndex;
  bool cardAdded = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      "Payment",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(4, (index) {
                    bool isSelected = selectedCardIndex == index;

                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCardIndex = isSelected ? null : index;
                            });
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            margin: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color:
                                  isSelected ? Colors.white : Colors.grey[300],
                              border: Border.all(
                                color: isSelected
                                    ? Colors.orange
                                    : Colors.transparent,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                    child: Image.asset(
                                  logos[index],
                                  height: 80,
                                  width: 80,
                                )),
                                if (isSelected)
                                  Positioned(
                                    right: 0.1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.amber[900]),
                                      height: 20,
                                      width: 20,
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Text(logoNames[index]),
                      ],
                    );
                  }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              cardAdded
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: [
                          const Text("Card"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    mastercard,
                                    height: 30,
                                    width: 50,
                                  ),
                                  const Text("*********654"),
                                ],
                              ),
                              Icon(Icons.expand_more_sharp)
                            ],
                          )
                        ],
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: [
                          Image.asset(
                            creditcard,
                          ),
                          const Text(
                            "No Card Added",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text("You can add a card and save it for later")
                        ],
                      ),
                    ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddCard()));
                  },
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: Colors.orange[700],
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    '+ ADD NEW',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[700],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textAlign: TextAlign.start,
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "TOTAL : ",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                              TextSpan(
                                text: "\$96",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5),
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SuccessPayment()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange[700],
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              minimumSize: const Size(double.infinity, 56),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text(
                              'PAY & CONFIRM',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
