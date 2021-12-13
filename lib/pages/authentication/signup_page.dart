import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:realtime_database/pages/database/database.dart';
import 'package:realtime_database/pages/authentication/registration.dart';
import 'package:realtime_database/pages/authentication/reset_pass.dart';
// ignore_for_file: prefer_const_constructors

class Realtime extends StatefulWidget {
  const Realtime({Key? key}) : super(key: key);

  @override
  _RealtimeState createState() => _RealtimeState();
}

class _RealtimeState extends State<Realtime> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var controller1=TextEditingController();
  var controller2=TextEditingController();
  final globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  FirebaseApp app=Firebase.app();
  bool hidePassword = true;
  bool a=false;
  late User user;
  @override
  Widget build(BuildContext context) {
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
              Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            StylizedFlutterLogo(
                              colorFilter: ColorFilter.matrix(<double>[
                                0.393,
                                0.769,
                                0.189,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1,
                                0,
                              ]),
                            ),
                            SizedBox(height: 20),
                            Form(
                              key: globalFormKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: TextFormField(
                                      controller: controller1,
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
                                      controller: controller2,
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
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.orange,
                                    ),
                                    onPressed: ()=>
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                            builder: (context)=> ResetScreen()
                                        )
                                        ),
                                    child: Text("Forgot Password?",
                                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'RobotoCondensed'),),
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
                                      onPressed: () async {
                                        try {
                                          UserCredential usercredential= await _auth.signInWithEmailAndPassword(
                                              email: controller1.text,
                                              password: controller2.text
                                          );
                                          String uid=usercredential.user!.uid;
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(builder: (context)=> CustomData(app: app,uids: uid)));
                                        } on FirebaseAuthException catch (e) {
                                          if (e.code == 'user-not-found') {
                                            print('No user found for that email.');
                                          } else if (e.code == 'wrong-password') {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(
                                                content: Text('Wrong password'),
                                              ),
                                            );
                                          }
                                        }
                                        catch(e){
                                          print(e);
                                        }
                                      },
                                      child: Text('Sign In',style: TextStyle(fontSize: 18,fontFamily: 'RobotoCondensed',fontWeight: FontWeight.bold),),
                                    ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.orange, // background
                                          onPrimary: Colors.white, // foreground
                                        ),
                                        child: Text('Sign Up',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'RobotoCondensed'),),
                                        onPressed: (){
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(builder: (context)=> Register()));

                                        },
                                      ),
                                    ]
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]
              ),
            ]
        ),
      ),
    );
  }
}
class StylizedFlutterLogo extends StatelessWidget {
  final ColorFilter colorFilter;

  const StylizedFlutterLogo({required this.colorFilter});

  @override
  Widget build(BuildContext context) {
    return  ColorFiltered(
      colorFilter: colorFilter,
      child: FlutterLogo(size: 150),
    );
  }
}

/*
                                        _auth.signInWithEmailAndPassword(email: controller1.text, password: controller2.text).then((_){
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(builder: (context)=> CustomData(app: app)));

                                        });

 */
