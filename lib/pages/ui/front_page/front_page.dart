import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realtime_database/pages/authentication/signup_page.dart';
import 'package:realtime_database/pages/ui/classroom/classroom.dart';
import 'package:realtime_database/pages/ui/front_page/horizontal_vertical_scrolling.dart';
import 'package:realtime_database/pages/ui/lectures/lectures.dart';
import 'package:realtime_database/pages/ui/lost_and_found/laf_form.dart';
import 'package:realtime_database/pages/ui/star_boys/info.dart';
// ignore_for_file: prefer_const_constructors
class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  final  categories cater= categories();
//  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   List<Widget> abc=[
//     Container(
//       margin: const EdgeInsets.only(left: 12),
//       height: 150,
//       width: 150,
//       decoration: BoxDecoration(
//         color: Colors.red,
//         borderRadius: BorderRadius.circular(20),
//         image: DecorationImage(
//           image: AssetImage("assets/p1.png"),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Center(
//         child: Text("",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
//       ),
//     ),
//     SizedBox(width: 12),
//     Container(
//       margin: const EdgeInsets.only(left: 12),
//       height: 150,
//       width: 150,
//       child: Center(
//         child: Text(" ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
//       ),
//       decoration: BoxDecoration(
//         color: Colors.red,
//         borderRadius: BorderRadius.circular(20),
//         image: DecorationImage(
//           image: AssetImage("assets/p1.png"),
//           fit: BoxFit.cover,
//         ),
//       ),
//     ),
//     SizedBox(width: 12),
//     Container(
//       margin: const EdgeInsets.only(left: 12),
//       height: 150,
//       width: 150,
//       child: Center(
//         child: Text(" ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
//       ),
//       decoration: BoxDecoration(
//         color: Colors.red,
//         borderRadius: BorderRadius.circular(20),
//         image: DecorationImage(
//           image: AssetImage("assets/p1.png"),
//           fit: BoxFit.cover,
//         ),
//       ),
//     ),
//     SizedBox(width: 12),
//     Container(
//       margin: const EdgeInsets.only(left: 12),
//       height: 150,
//       width: 150,
//       child: Center(
//         child: Text(" ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
//       ),
//       decoration: BoxDecoration(
//         color: Colors.red,
//         borderRadius: BorderRadius.circular(20),
//         image: DecorationImage(
//           image: AssetImage("assets/p1.png"),
//           fit: BoxFit.cover,
//         ),
//       ),
//     ),
//     SizedBox(width: 18),
//   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
           icon: Icon(Icons.account_circle),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Realtime()),
              );
            },
          ),
        ],
          backgroundColor: Colors.pinkAccent.withOpacity(0.5),
          title: Text("College ABC"),
          ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                        child: Container(
                          margin: const EdgeInsets.all(7.5),
                          height: 130,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/rec4.jpg'
                                  ),
                                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(7.5),
                            child: Center(
                              child: Text("Lectures",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'RobotoCondensed',
                                  color: Colors.black87
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Lectures()),
                          );

                        },
                      )
                  ),
                  Expanded(
                    child: InkWell(
                        child: Container(
                          margin: const EdgeInsets.all(7.5),
                          height: 130,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/rec2.jpg'),
                              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(7.5),
                            child: Center(
                              child: Text("Classroom",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'RobotoCondensed',
                                    color: Colors.black
                                ),
                              ),
                            ),
                          ),
                        ),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LectureClasses()),
                        );

                      },
                    )
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                        child: Container(
                          margin: const EdgeInsets.all(7.5),
                          height: 130,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/rec1.jpg'),
                                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(7.5),
                            child: Center(
                              child: Text("Club Activities",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'RobotoCondensed',
                                    color: Colors.black
                                ),
                              ),
                            ),
                          ),
                        ),
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'We are working on Club Activities page.',
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.pinkAccent,
                          ),
                        );

                      },
                    )
                  ),
                  Expanded(
                      child: InkWell(
                        child: Container(
                          margin: const EdgeInsets.all(7.5),
                          height: 130,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/rec3.jpg'),
                                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(7.5),
                            child: Center(
                              child: Text("Lost and Found",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'RobotoCondensed',
                                    color: Colors.black
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LostandFound()),
                          );
                      },
                      )
                  ),
                ],
              ),
              SizedBox(height: 10),
              cater,
              Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                    child: Text("Campus Stars",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue))
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 15),
                  Flexible(
                    child: customcard("John Eriksen","https://data.whicdn.com/images/184907458/original.jpg","john245@gmail.com","Love to play basketball and Football","9K","4000")
                  ),
                  SizedBox(width: 15),
                   Flexible(
                     child:
                     customcard("Judy Williams","https://ds393qgzrxwzn.cloudfront.net/resize/m600x500/cat1/img/images/0/J7RGiQdufS.jpg","judy856@gmal.com","Influencer, Traveler, Modelling, Singing and Creative","17.6K","1200")
                   ),
                   SizedBox(width: 15),
                  Flexible(
                    child: customcard("David Lewis","https://images.unsplash.com/photo-1552337557-45792b252a2e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y29vbCUyMG1hbnxlbnwwfHwwfHw%3D&w=1000&q=80","david985@gmail.com","Professional Gamer, Footballer, Singing, Traveler","10K","3000")
                  ),
                  SizedBox(width: 10),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget customcard(String x,String net,String ema,String pa,String flr,String flw){
    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red.withOpacity(0.3)
      ),
      child: Column(
        children: [
          SizedBox(height: 7),
          Text(x),
          SizedBox(height: 12),
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(net),
              backgroundColor: Colors.transparent,
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Info(info: x,url: net,email: ema,passion: pa,flr: flr,flw: flw,)),
                  );
                  },
              ),
            ),
          )
        ],
      ),
    );
  }
}
