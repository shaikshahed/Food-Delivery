import 'package:engro_food/constants/color_constants.dart';
import 'package:engro_food/location/location_access.dart';
import 'package:engro_food/login_screen/forgot_password.dart';
import 'package:engro_food/sign_up_screen/signup_screen.dart';
import 'package:engro_food/widgets/food_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:engro_food/constants/textfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  bool _obscureText = true;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(18, 18, 35, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Log In',
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
                        ),
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
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: _formkey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'EMAIL',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Textfield(
                                  controller: _emailController,
                                  input: 'example@gmail.com',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                        .hasMatch(value)) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'PASSWORD',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Textfield(
                                  controller: _passwordController,
                                  input: '• • • • • • • •',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    } else if (value.length < 6) {
                                      return 'Password must be atleast 6 characters long';
                                    }
                                    return null;
                                  },
                                  isPassword: true,
                                  obscureText: _obscureText,
                                  onIconPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                                // SizedBox(height: 10),
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Checkbox(
                                        value: rememberMe,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            rememberMe = value ?? false;
                                          });
                                        },
                                      ),
                                      Text(
                                        'Remember Me',
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  trailing: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgotPassword()));
                                    },
                                    child: Text(
                                      'Forgot Password',
                                      style: TextStyle(
                                          color: Colors.orange, fontSize: 16),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                FoodElevatedButton(
                                  btnText: "login".toUpperCase(),
                                  onTapFunction: () {
                                    if (_formkey.currentState!.validate()) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LocationAccess()));
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('''Don't have an account?''',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.grey)),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignupScreen()));
                                        },
                                        child: Text('SIGN UP',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: appPrimaryColor)))
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  'Or',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                )),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle,
                                        ),
                                        // padding: EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.facebook_outlined,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.circle,
                                          ),
                                          // padding: EdgeInsets.all(10),
                                          child: Center(
                                            child: FaIcon(
                                                FontAwesomeIcons.twitter,
                                                size: 30, 
                                                color: Colors.white,
                                              ),
                                          ),
                                          ),
                                      Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.circle,
                                          ),
                                          // padding: EdgeInsets.all(10),
                                          child: Icon(
                                            Icons.apple_outlined,
                                            size: 30,
                                            color: Colors.white,
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
