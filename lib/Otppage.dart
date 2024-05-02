        import 'dart:async';
        import 'package:flutter/material.dart';
        import 'package:flutter/gestures.dart';
        import 'package:firebase_auth/firebase_auth.dart';
        import 'package:pinput/pinput.dart';
        import 'package:spiritual_01/homepage.dart';
        import 'package:spiritual_01/utils/Colors_app.dart';

        class OtpPage extends StatefulWidget {
          final String phoneNo;
          final String verificationId;

          OtpPage({required this.phoneNo, required this.verificationId});

          @override
          State<OtpPage> createState() => _OtpPageState();
        }

        class _OtpPageState extends State<OtpPage> {
          final TextEditingController otpController = TextEditingController();
          late String code;

          int _counter = 30;
          late Timer _timer;
          bool showResendText = false;

          @override
          void initState() {
            super.initState();
            startTimer();
            code = '';
          }

          @override
          void dispose() {
            _timer.cancel();
            otpController.dispose();
            super.dispose();
          }

          void startTimer() {
            const oneSec = Duration(seconds: 1);
            _timer = Timer.periodic(
              oneSec,
              (Timer timer) {
                if (_counter == 0) {
                  setState(() {
                    timer.cancel();
                    showResendText = true;
                  });
                } else {
                  setState(() {
                    _counter--;
                  });
                }
              },
            );
          }

          @override
          Widget build(BuildContext context) {
            double screenWidth = MediaQuery.of(context).size.width;
            double screenHeight = MediaQuery.of(context).size.height;

            return Scaffold(
              body: Container(
                width: screenWidth,
                height: screenHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/temple1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 350,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                        color: secondary,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:30),
                            child: Text(
                                    'Enter 6 digit verification code',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),

                        SizedBox(height: 25,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,  
                          children: [
                            Container(
                              child: Pinput(
                                controller: otpController,
                                length: 6,
                              ),
                            ),
                
                          ],
                        ),
                          
                          SizedBox(height: 20),
                              Container(
                                height: 50,
                                width: 360,
                                child: TextButton(
                                onPressed: ()  async {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      
                          },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white, 
                                  backgroundColor:primary,            
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15), 
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Submit'),
                                ),
                                ),
                              ),  
                            
                            SizedBox(height: 10),
                            RichText(
                              text: TextSpan(
                            style: TextStyle(
                          
                            fontSize: 16.0,
                          ),
                          children: [
                            TextSpan(text: "Didn't receive code ?",style: TextStyle(color: Colors.black)),
                            
                            if (showResendText)
                                TextSpan(
                                text: ' Resend',
                                style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: steel_blue, 
                          ),
                            recognizer: TapGestureRecognizer()
                            ..onTap = () {
                        
                            startTimer(); 
                            setState(() {
                            _counter = 15; 
                          showResendText = false; 
                        });
                      },
                  ),
                    if (!showResendText) 
                      TextSpan(
                      text: ' 00:$_counter',
                      style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: time,
                    ),
                  ),
                          
                          ],
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
        }












