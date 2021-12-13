import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

class categories extends StatelessWidget {
  const categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 12),
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage("assets/p1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text("",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(width: 12),
          Container(
            margin: const EdgeInsets.only(left: 12),
            height: 150,
            width: 150,
            child: Center(
              child: Text(" ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage("assets/p1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12),
          Container(
            margin: const EdgeInsets.only(left: 12),
            height: 150,
            width: 150,
            child: Center(
              child: Text(" ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage("assets/p1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12),
          Container(
            margin: const EdgeInsets.only(left: 12),
            height: 150,
            width: 150,
            child: Center(
              child: Text(" ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage("assets/p1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 18),
        ],
      ),
    );
  }
}
