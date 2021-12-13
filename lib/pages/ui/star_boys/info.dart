import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

class Info extends StatelessWidget {
  String info,url,email,passion,flr,flw;
  Info({Key? key,required this.info,required this.url,required this.email,required this.passion,required this.flr,required this.flw}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent.withOpacity(0.7),
        title: Center(
          child: Text("Campus Stars"),
        )
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(info,style: TextStyle(fontSize: 20),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(builder: (BuildContext context) => Profile(pr: url)),
                            );
                            },
                        ),
                        radius: 27,
                        backgroundImage: NetworkImage(url),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                      onPressed: null,
                      child: Text(passion)
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(flr,style: TextStyle(color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold) ),
                  Text(flw,style: TextStyle(color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold) ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text("Followers",style: TextStyle(fontSize: 18,color: Colors.grey) ),
                  Text("Following",style: TextStyle(fontSize: 18,color: Colors.grey) ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class Profile extends StatelessWidget {
  String pr;
  Profile({Key? key,required this.pr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Center(
        child: CircleAvatar(
          radius: 180,
          backgroundImage: NetworkImage(pr),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}

