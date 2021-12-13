import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
class CustomData extends StatefulWidget {
  late final FirebaseApp app;
  late String uids;
  CustomData({Key? key, required this.app, required this.uids})
      : super(key: key);

  @override
  _CustomDataState createState() => _CustomDataState(app: app, ids: uids);
}

class _CustomDataState extends State<CustomData> {
  String ans="";
  List abc = [];
  late final FirebaseApp app;
  late String ids;

  _CustomDataState({required this.app, required this.ids});
  @override
  void initState() {
    super.initState();
  }

  var controller1 = TextEditingController();
  final referencedatab = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    final ref = referencedatab.reference();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Realtime Database",
            style: TextStyle(
                fontFamily: 'RobotoCondensed', fontWeight: FontWeight.w700),
          ),
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
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Fav Movies",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      controller: controller1,
                      decoration: InputDecoration(
                        hintText: "Enter Your Fav. Movie",
                        enabledBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                    ),
                    onPressed: () async {
                      ref
                          .child(ids)
                          .child("Movies")
                          .push()
                          .child("Movie Title")
                          .set(controller1.text);
                      setState(() {
                        abc.add(controller1.text);
                      });
                    },
                    child: Text("Submit"),
                  ),
                  Flexible(
                    child: ListView.builder(
                      itemCount: abc.length,
                        itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(abc[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async{
                            setState(() {
                              abc.remove(abc[index]);
                               ref
                                  .child(ids)
                                  .child("Movies")
                                  .child("Movie Title")
                                  .child(abc[index])
                                  .remove();
                            });
                          },
                        ),
                      );
                    },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}


