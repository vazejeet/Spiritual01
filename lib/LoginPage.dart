                import 'package:firebase_auth/firebase_auth.dart';
                import 'package:flutter/material.dart';
                import 'package:spiritual_01/Otppage.dart';
                import 'package:spiritual_01/utils/Colors_app.dart';

                class LoginPage extends StatefulWidget {
                  const LoginPage({Key? key}) : super(key: key);

                  @override
                  _LoginPageState createState() => _LoginPageState();
                }

                class _LoginPageState extends State<LoginPage> {
                  final TextEditingController _phoneController = TextEditingController();
                  bool _isPhoneError = false;

                  @override
                  void dispose() {
                    _phoneController.dispose();
                    super.dispose();
                  }

                  @override
                  Widget build(BuildContext context) {
                    double screenHeight = MediaQuery.of(context).size.height;
                    double screenWidth = MediaQuery.of(context).size.width;

                    return Scaffold(
                      body: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          // Background Image
                          Positioned.fill(
                            child: Image.asset(
                              'assets/temple.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Login Form Container
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: 350,
                              width: screenWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                                color: secondary,
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Padding(
                      padding: EdgeInsets.only(bottom: 8,top: 20),
                      child: Text(
                        'Enter Mobile Number',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Description
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'We will send you a 6-digit verification code to \n your mobile number',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    SizedBox(height: 12), 

                    // +91 Prefix Container
                    Container(
                      decoration: BoxDecoration(
                        color: accentLight,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Text(
                            '+91',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              maxLength: 10,
                              controller: _phoneController,
                              onChanged: (value) {
                                setState(() {
                                  _isPhoneError = value.isEmpty || value.length != 10;
                                });
                              },
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: accentLight,
                                hintText: 'Enter your 10-digit mobile number',
                                border: InputBorder.none,
                                counterText: '',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  
                    if (_isPhoneError)
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          'Please enter a valid 10-digit mobile number',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),

                    SizedBox(height: 20), 

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (!_isPhoneError) {
                            String phoneNumber = '+91${_phoneController.text}';
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: phoneNumber,
                              verificationCompleted: (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException ex) {},
                              codeSent: (String verificationId, int? resendToken) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OtpPage(
                                      verificationId: verificationId,
                                      phoneNo: phoneNumber,
                                    ),
                                  ),
                                );
                              },
                              codeAutoRetrievalTimeout: (String verificationId) {},
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                                      ),
                          ),
                        ],
                      ),
                    );
                  }
                }









