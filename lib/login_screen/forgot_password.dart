import 'package:engro_food/constants/textfield.dart';
import 'package:engro_food/login_screen/verify_otp_screen.dart';
import 'package:engro_food/widgets/food_elevated_button.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  color: Colors.white, 
                  shape: BoxShape.circle),
              margin: const EdgeInsets.only(top: 36, left: 24),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
            ),
          ],
        ),
        const Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Please sign in to your existing account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            )),
        Expanded(
            flex: 5,
            child: Container(
              // height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'EMAIL',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Textfield(
                        controller: _emailController,
                        input: 'example@gmail.com',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40),
                      FoodElevatedButton(
                        btnText: "send code".toUpperCase(),
                        onTapFunction: () {
                          if (_formkey.currentState!.validate()) {
                            print('Email: ${_emailController.text}');
                            //  Future.delayed(Duration(seconds: 2), () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => VerifyOtp(email: _emailController.text),
                            //     ),
                            //   );
                            // });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VerifyOtp(
                                          email: _emailController.text,
                                        )));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ))
      ]),
    );
  }
}
