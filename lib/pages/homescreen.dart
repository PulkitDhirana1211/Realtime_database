import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'database.dart';
// ignore_for_file: prefer_const_constructors

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final signout = FirebaseAuth.instance;
  int _selectedIndex=0;
  List<Widget> _cardList = [];
  List<Widget> texts = [];
  removeDynamic(){
    setState(() {
      _cardList.removeAt(_selectedIndex);
    });
  }

  void _addCardWidget() {
    setState(() {
      if(_cardList.length>4)
        {ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Verify Phone Number first")));
        }
      else{
        _cardList.add(_card());
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.red
          ),
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 40,
                ),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Settings'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {},
                ),

              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.orange,
        ),
        body: IndexedStack(
          children:
          [
          Column(
            children:
            [Flexible(
              child: ListView.builder(
                  itemCount: _cardList.length,
                  itemBuilder: (context,index){
                    return _cardList[index];
                  }
                  ),
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: FloatingActionButton(
                        onPressed: removeDynamic,
                        child: Icon(Icons.remove)),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                        onPressed: _addCardWidget,
                        child: Icon(Icons.add)),
                  ),
                ],
              ),

            ]
          ),
    ]
        ),
      ),
    );
  }

  Widget _card() {
    return Container(
        height: 100,
        margin: EdgeInsets.only(top: 5, left: 8, right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.red,
        ),
        child: Center(
            child: ListTile(
                leading: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 26,
                  ),
                ),
                title: Text(
                  "Movies",
                  style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.deepPurple),
                ),
                subtitle: Text(
                  '',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white),
                ),
                trailing: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 50,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('5',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey)
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            Icon(
                              Icons.access_alarms_outlined,
                              textDirection: TextDirection.rtl,
                              size: 20, color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    )
                )
            )
        )
    );
  }
  void tap(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
}
/*
 ElevatedButton(
                      onPressed: () async{
                        signout.signOut();
                        Navigator.pop(context);
                      },
                      child: Text("Go Back")
                  )
 */