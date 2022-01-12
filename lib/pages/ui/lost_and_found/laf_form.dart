import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
final List<File?> _media = [];

class LostandFound extends StatefulWidget {
  const LostandFound({Key? key}) : super(key: key);

  @override
  _LostandFoundState createState() => _LostandFoundState();
}

class _LostandFoundState extends State<LostandFound> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  Future takeMedia(String type) async {
    try {
      final XFile? media;
      List<File> mediaList = [];
      if (type == 'Image') {
        media = await ImagePicker().pickImage(source: ImageSource.camera);
        if (media == null) return;
        setState(() {
          _media.add(File(media!.path));
        });
      }
    }
    catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent.withOpacity(0.5),
        title: Text("College ABC"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter the Person's Name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Person's Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the Description';
                    }
                    return null;
                  },
                  maxLines: 5,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(3, 48, 131, 1),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Enter the Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  cursorColor: const Color.fromRGBO(3, 48, 131, 1),
                  cursorHeight: 24,
                  autocorrect: true,
                  enableSuggestions: true,
                  onChanged: (String d) {
//                _evidenceDescription = d;
                  },
  //            initialValue: _evidenceDescription,
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.pinkAccent),
                  ),
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Your data has been submitted'),
                        ),
                      );
                      Navigator.of(context).pop();
                    }
                    },
                  child: Text("Submit")
              )
            ],
          ),
        ),
      ),
    );
  }
}
