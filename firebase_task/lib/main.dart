import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'input_form.dart'; 
import 'firebase_config.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseConfig);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Info App',
      home: InputForm(),
    );
  }
}






