import 'package:flutter/material.dart';
class LectureClasses extends StatefulWidget {
  const LectureClasses({Key? key}) : super(key: key);

  @override
  _LectureClassesState createState() => _LectureClassesState();
}

class _LectureClassesState extends State<LectureClasses> {
  int j=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent.withOpacity(0.5),
        title: Text("College ABC"),
      ),
      body: ListView.builder(
          itemCount:15,
          itemBuilder: (context,i){
            j=i+1;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.blueAccent.withOpacity(0.2),
                leading: FlutterLogo(),
                trailing: Icon(Icons.more_vert),
                title: Text("Class "+"$j"),
              ),
            );
          }
      ),
    );
  }
}
