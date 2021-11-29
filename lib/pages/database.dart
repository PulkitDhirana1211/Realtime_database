import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:realtime_database/pages/homescreen.dart';

// ignore_for_file: prefer_const_constructors
class CustomData extends StatefulWidget {
  late final FirebaseApp app;
  CustomData({Key? key,required this.app}) : super(key: key);

  @override
  _CustomDataState createState() => _CustomDataState();
}

class _CustomDataState extends State<CustomData> {
  var controller1=TextEditingController();
  final referencedatab=FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    final ref=referencedatab.reference();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Realtime Database",style: TextStyle(fontFamily: 'RobotoCondensed',fontWeight: FontWeight.w700),),
        ),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  color: Colors.green,
                  width: MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Fav Movies/Games",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                      textAlign: TextAlign.center,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        controller: controller1,
                        decoration: InputDecoration(
                          hintText: "Enter Your Fav. Movie/Game",
                          enabledBorder: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                      ),
                        onPressed: (){
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context)=>  HomeScreen()));
                        },
                        child: Text("Submit"),
                    )
                  ],
                ),
                ),
              )
            ],
          )
      ),
    );
  }
}
