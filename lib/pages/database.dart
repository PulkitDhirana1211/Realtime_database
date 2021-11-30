import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
class CustomData extends StatefulWidget {
  late final FirebaseApp app;
  late String uids;
  CustomData({Key? key,required this.app,required this.uids}) : super(key: key);

  @override
  _CustomDataState createState() => _CustomDataState(app: app, ids:uids);
}

class _CustomDataState extends State<CustomData> {

  late final FirebaseApp app;
  late String ids;

  _CustomDataState({required this.app,required this.ids});
  @override
  void initState() {
    super.initState();
  }
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
                        onPressed: ()async {
                            ref
                            .child(ids)
                            .child("Movies")
                            .push().set(controller1.text);
                        },
                        child: Text("Submit"),
                    ),

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
