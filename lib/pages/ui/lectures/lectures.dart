import 'package:flutter/material.dart';
class Lectures extends StatefulWidget {
  const Lectures({Key? key}) : super(key: key);

  @override
  _LecturesState createState() => _LecturesState();
}

class _LecturesState extends State<Lectures> {
  int j=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent.withOpacity(0.5),
        title: Text("College ABC"),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,i){
            j=i+1;
            return Container(
              padding: const EdgeInsets.all(10),
              height: 190,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.cyan,
                child: Center(child: Text("Lecture $j")),
              ),
            );
          }),
    );
  }
}
