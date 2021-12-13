import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

class ResetScreen extends StatefulWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final globalFormKey1 = GlobalKey<FormState>();
  var emailcontroller=TextEditingController();
  final authe = FirebaseAuth.instance;

  late String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Realtime Database",style: TextStyle(fontFamily: 'RobotoCondensed',fontWeight: FontWeight.w700),),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: globalFormKey1,
              child: TextFormField(
                controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
                validator: (input)=> input!.contains("@") ? null : "Email id should be valid",
                decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email,color: Colors.orange)
                ),
              ),
            ),
          ),
          ElevatedButton(
          child: Text('Send Request',style: TextStyle(fontSize: 18,fontFamily: 'RobotoCondensed',fontWeight: FontWeight.bold),),
           style: ElevatedButton.styleFrom(
              primary: Colors.orange, // background
              onPrimary: Colors.white, // foreground
            ),
            onPressed: () async{
              if(globalFormKey1.currentState!.validate()){
           ScaffoldMessenger.of(context)
           .showSnackBar(
           SnackBar(content: Text("An email has been sent to ${emailcontroller.text} to change the password")
            ));
           authe.sendPasswordResetEmail(email: emailcontroller.text);
           Navigator.of(context).pop();
            }

    print(emailcontroller.text);
              }
          ),
        ],
      ),
    );
  }
}
