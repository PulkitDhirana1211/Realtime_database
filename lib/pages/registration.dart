import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:realtime_database/pages/verify.dart';
// ignore_for_file: prefer_const_constructors
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late UserCredential userCredential;
  final globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  bool hidePassword = true;
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
          Stack(
            children: [
              Form(
                key: globalFormKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: 'Name',
                            prefixIcon: Icon(Icons.account_circle_rounded,color: Colors.orange)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
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
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: passwordcontroller,
                        obscureText: hidePassword,
                        keyboardType: TextInputType.text,
                        validator: (input)=> input!.length >3 ? null: "Password should be greater than 3",
                        decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.password,color: Colors.orange),
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  hidePassword=!hidePassword;
                                });
                              },
                              color: Colors.orange.withOpacity(0.4),
                              icon: Icon(hidePassword?Icons.visibility_off: Icons.visibility),
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:
                        [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange, // background
                              onPrimary: Colors.white, // foreground
                            ),
                            child: Text('Sign Up',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'RobotoCondensed'),),
                            onPressed: ()  async {
                              try {
                                userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                    email: emailcontroller.text,
                                    password: passwordcontroller.text
                                );
                                  DatabaseReference userref=FirebaseDatabase.instance.reference().child('users');
                                  String uid=userCredential.user!.uid;
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(builder: (context)=> Verify(userCredentials: userCredential)));


                              } on FirebaseAuthException catch (e) {
                                 if (e.code == 'email-already-in-use') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Email Already Registered'),
                                    ),
                                  );
                                }
                              } catch (e) {
                                print(e);
                              }
                            }
                          )
                        ]
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
/*
_auth.createUserWithEmailAndPassword(
                                      email: emailcontroller.text,
                                      password: passwordcontroller.text
                                  ).then((_){
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(builder: (context)=> Verify()));
                                  });
 */
