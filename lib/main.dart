import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:realtime_database/pages/ui/front_page/front_page.dart';
// ignore_for_file: prefer_const_constructors
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ABC",
      home: FrontPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
