import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spiritual_01/Homepage.dart';
import 'package:spiritual_01/LoginPage.dart';
import 'package:spiritual_01/Otppage.dart';
import 'package:spiritual_01/firebase_options.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
      ),
      debugShowCheckedModeBanner: false,
      home:LoginPage() 
    );
  }
}


 
