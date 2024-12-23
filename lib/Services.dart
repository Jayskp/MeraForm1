import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
class ServicesState extends StatefulWidget {
  const ServicesState({super.key});

  @override
  State<ServicesState> createState() => _ServicesStateState();
}

class _ServicesStateState extends State<ServicesState> {
  String dropdownvalue='Month';
  var items =['Month','Jan', 'Feb','Mar','Apr','Jun','Jul','Aug','Sept','Oct','Nov','Dec'];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: ConstrainedBox(constraints: BoxConstraints(),
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(194, 233, 106,210),
                      Color.fromRGBO(104, 146, 255,210),
                    ])
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(20,75,20,0),
                    child: Text("Services",style: TextStyle(fontSize: 25, fontFamily: "Poppins",fontWeight: FontWeight.w600, color: Colors.black),)
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(350,75,0,0),
                    child:IconButton(onPressed: (){}, icon: Image(image: AssetImage("assets/noun-notification-7044045.png"),height: 30,))
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20,150,20,10),

                  alignment: Alignment.center,
                  height:240,
                  width:380,

                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color:Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
                Container(
                  margin:const EdgeInsets.fromLTRB(40, 170,0,0),
                  child: Text("35",style:TextStyle(fontSize:25, fontWeight: FontWeight.w900,color: Colors.black, fontFamily: "Poppins")),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(40,210,0,0),
                    child: Text("My Services",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w100,fontFamily: "Poppins"),)
                ),
                Container(
                  width: 110,
                  margin: const EdgeInsets.fromLTRB(262,170,20,0),
                  color:  Colors.lightGreenAccent.shade100,
                  child: DropdownButtonFormField(
                    hint: Text("Month",style: TextStyle(fontFamily: 'Poppins')),
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),


                Container(
                    margin: const EdgeInsets.fromLTRB(40,270,40,0),
                    child: DottedLine(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      lineLength: double.infinity,
                      lineThickness: 1.0,
                      dashLength: 4.0,
                      dashColor: Colors.black,
                      // dashGradient: [Colors.red, Colors.blue],
                      // dashRadius: 0.0,
                      // dashGapLength: 4.0,
                      // dashGapColor: Colors.transparent,
                      // dashGapGradient: [Colors.red, Colors.blue],
                      // dashGapRadius: 0.0,
                    )
                ),
                Container(
                    color: Colors.yellow.shade50,
                    margin: const EdgeInsets.fromLTRB(40,300,0,0),
                    child: TextButton(onPressed: (){},
                        child: Stack(
                          children: [
                            Container(
                                margin: const EdgeInsets.fromLTRB(0,5,0,0),
                                child: Text("Add New",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold, fontFamily: "Raleway", color: Colors.black),)
                            ),
                            Container(
                                margin: const EdgeInsets.fromLTRB(100,0,0,0),
                                child: Image.asset("assets/Group 398.png")
                            ),

                          ],
                        ))
                ),
                Container(
                    color: Colors.blue.shade50,
                    margin: const EdgeInsets.fromLTRB(210,300,0,0),
                    child: TextButton(onPressed: (){},
                        child: Stack(
                          children: [
                            Container(
                                margin: const EdgeInsets.fromLTRB(0,5,0,0),
                                child: Text("Apply Service",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold, fontFamily: "Raleway", color: Colors.black),)
                            ),
                            Container(
                                margin: const EdgeInsets.fromLTRB(110,0,0,0),
                                child: Image.asset("assets/Group 399.png")
                            ),

                          ],
                        ))
                ),
            Container(
              margin: const EdgeInsets.fromLTRB(20,420,20,0),
              height: 50,width: 370,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red.shade50,
              ),
                child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(20,15,10,0),
                    child: Image.asset("assets/Group 241.png"),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(60,15,0,0),
                    child: Text("Check Your Service Application",style: TextStyle(fontSize: 12,fontFamily: "Poppins",fontWeight: FontWeight.w500))
                  ),
                  Container(
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    margin: const EdgeInsets.fromLTRB(310,10,20,10),
                    child: Image.asset("assets/arrow-out-3652533.png")
                  )
                ],
            )
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0,490,0,0),
                  height: 576, width: 476,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(20,540,20, 20),
                      color: Colors.white,
                    child:Stack(
                        children: [
                          Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100],

                ),
                            child: ExpansionTile(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              title: Text(
                                '      Digital Education Initiatives',
                                style: TextStyle(color: Colors.black,
                                    // fontStyle: FontStyle.Raleway,
                                    fontFamily:'Poppins',
                                    fontSize: 13.0),
                              ),
                              children: <Widget>[
                                ListTile(title: Text('This is tile number 1')),
                              ],
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.fromLTRB(10,14,0,0),
                              color: Colors.white,

                              height: 30,
                              padding: const EdgeInsets.all(5),
                              child: Text('1')
                          ),
                        ]
                    )

                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(20,640,20, 20),
                    color: Colors.white,
                    child:Stack(

                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100],

                            ),
                            child: ExpansionTile(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              title: Text(
                                '      Digital Education Initiatives',
                                style: TextStyle(color: Colors.black,
                                    // fontStyle: FontStyle.Raleway,
                                    fontFamily:'Poppins',
                                    fontSize: 13.0),
                              ),
                              children: <Widget>[
                                ListTile(title: Text('This is tile number 1')),
                              ],
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.fromLTRB(10,14,0,0),
                              color: Colors.white,

                              height: 30,
                              padding: const EdgeInsets.all(5),
                              child: Text('2')
                          ),
                        ]
                    )

                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(20,740,20, 20),
                    color: Colors.white,
                    child:Stack(

                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100],
                            ),
                            child: ExpansionTile(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              title: Text(
                                '      Digital Education Initiatives',
                                style: TextStyle(color: Colors.black,
                                    // fontStyle: FontStyle.Raleway,
                                    fontFamily:'Poppins',
                                    fontSize: 13.0),
                              ),
                              children: <Widget>[
                                ListTile(title: Text('This is tile number 1')),
                              ],
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.fromLTRB(10,14,0,0),
                              color: Colors.white,

                              height: 30,
                              padding: const EdgeInsets.all(5),
                              child: Text('3')
                          ),
                        ]
                    )

                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(20,840,20, 20),
                    color: Colors.white,
                    child:Stack(

                        children: [
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[100],),
                            child: ExpansionTile(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              title: Text(
                                '      Digital Education Initiatives',
                                style: TextStyle(color: Colors.black,
                                    // fontStyle: FontStyle.Raleway,
                                    fontFamily:'Poppins',
                                    fontSize: 13.0),
                              ),
                              children: <Widget>[
                                ListTile(title: Text('This is tile number 1')),
                              ],
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.fromLTRB(10,14,0,0),
                              color: Colors.white,

                              height: 30,
                              padding: const EdgeInsets.all(5),
                              child: Text('4')
                          ),
                        ]
                    )

                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(20,540,20, 20),
                    color: Colors.white,
                    child:Stack(

                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100],

                            ),
                            child: ExpansionTile(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              title: Text(
                                '      Digital Education Initiatives',
                                style: TextStyle(color: Colors.black,
                                    // fontStyle: FontStyle.Raleway,
                                    fontFamily:'Poppins',
                                    fontSize: 13.0),
                              ),
                              children: <Widget>[
                                ListTile(title: Text('This is tile number 1')),
                              ],
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.fromLTRB(10,14,0,0),
                              color: Colors.white,

                              height: 30,
                              padding: const EdgeInsets.all(5),
                              child: Text('1')
                          ),
                        ]
                    )

                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20,930,20,20),
                  height: 89,width: 106,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300]
                  ),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(10,10,0,0),
                        child: Image.asset("assets/graduation-cap (1).png")
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(80,10,0,10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey,

                          ),
                          height: 20,width: 20,
                          padding: const EdgeInsets.all(5),
                          child: Text(' 1',style: TextStyle(fontSize: 9, fontFamily: "Poppins"))
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10,50,0,10),
                        child: Text("Education",style: TextStyle(fontSize: 12, fontFamily: "Poppins"),),
                      )
                    ],
                  )
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(150,930,20,20),
                  height: 89,width: 106,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300]
                  ),
                    child: Stack(
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(10,10,0,0),
                            child: Image.asset("assets/suitcase.png")
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(80,10,0,10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey,

                            ),
                            height: 20,width: 20,
                            padding: const EdgeInsets.all(3),
                            child: Text('12',style: TextStyle(fontSize: 9, fontFamily: "Poppins"))
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10,50,0,10),
                          child: Text("Jobs",style: TextStyle(fontSize: 12, fontFamily: "Poppins"),),
                        )
                      ],
                    )
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(280,930,20,20),
                  height: 89,width: 106,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300]
                  ),
                    child: Stack(
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(10,10,0,0),
                            child: Image.asset("assets/grant.png")
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(80,10,0,10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey,

                            ),
                            height: 20,width: 20,
                            padding: const EdgeInsets.all(2),
                            child: Text('20',style: TextStyle(fontSize: 9, fontFamily: "Poppins"))
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10,50,0,10),
                          child: Text("Schemes",style: TextStyle(fontSize: 12, fontFamily: "Poppins"),),
                        )
                      ],
                    )
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20,1040,20,20),
                  height: 89,width: 106,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300]
                  ),
                    child: Stack(
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(10,10,0,0),
                            child: Image.asset("assets/Group 40.png")
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(80,10,0,10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey,

                            ),
                            height: 20,width: 20,
                            padding: const EdgeInsets.all(2),
                            child: Text('52',style: TextStyle(fontSize: 9, fontFamily: "Poppins"))
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10,50,0,10),
                          child: Text("Subsidies",style: TextStyle(fontSize: 12, fontFamily: "Poppins"),),
                        )
                      ],
                    )
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(150,1040,20,20),
                  height: 89,width: 106,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300]
                  ),
                    child: Stack(
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(10,10,0,0),
                            child: Image.asset("assets/scholarship.png")
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(80,10,0,10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey,

                            ),
                            height: 20,width: 20,
                            padding: const EdgeInsets.all(3),
                            child: Text('10',style: TextStyle(fontSize: 9, fontFamily: "Poppins"))
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10,50,0,10),
                          child: Text("Scholarships",style: TextStyle(fontSize: 12, fontFamily: "Poppins"),),
                        )
                      ],
                    )
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(280,1040,20,20),
                  height: 89,width: 106,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300]
                  ),
                    child: Stack(
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(10,10,0,0),
                            child: Image.asset("assets/noun-goverment-5796825.png")
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(80,10,0,10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey,

                            ),
                            height: 20,width: 20,
                            padding: const EdgeInsets.all(2),
                            child: Text('25',style: TextStyle(fontSize: 9, fontFamily: "Poppins"))
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10,50,0,10),
                          child: Text("Government",style: TextStyle(fontSize: 12, fontFamily: "Poppins"),),
                        ),

                      ],
                    )
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(10,1150,10,50),
                    child: Divider()
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20,1180,0,50),
                  child: Text("Recent Customer Review",style: TextStyle(fontFamily: "Poppins", fontSize: 16, fontWeight: FontWeight.w600))
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20,1230,0,50),
                  child:CarouselSlider(
                items: [
                Container(
                padding: EdgeInsets.fromLTRB(10,16,0,10),
          decoration: BoxDecoration(
            color: Colors.lightBlue[50],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/star.png",
                  ), Image.asset(
                    "assets/star.png",
                  ),
                  Image.asset(
                    "assets/star1.png",
                  ),
                  Image.asset(
                    "assets/star1.png",
                  ),  Image.asset(
                    "assets/star1.png",
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                    ],
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0,10,20,0),
                     child: Text(
                        "Rohit Sharma",
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      ),

                    ],
                  )]),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0,10,0,0),
                        child: Text(
                          "Excellent service from start to finish. ",
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      )

                    ],
                  ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0,0,0,0),
                    child: Text(
                      "The vendor was professional, punctual ",
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0,0,0,0),
                    child: Text(
                      "and went above and beyond to meet ",
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0,0,0,0),
                    child: Text(
                      " our requirements. Highly recommended",
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  )

                ],
              ),
                ],
          ),
        ),
          ],
      options: CarouselOptions(
      height: 200,
      enlargeCenterPage: true,
      autoPlay: false,
      aspectRatio: 10 / 6,
      autoPlayCurve: Curves.fastOutSlowIn,
      enableInfiniteScroll: true,
      autoPlayAnimationDuration: Duration(milliseconds: 800),
    ),
    )
                )
              ],
            )
          ]
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

        items: [
          BottomNavigationBarItem(
            icon: Container(
                padding: const EdgeInsets.fromLTRB(0,5,0,5),
                child:Image(image: AssetImage('assets/Mask Group 1.png'))),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
                padding: const EdgeInsets.fromLTRB(0,5,0,5),
                child:IconButton(onPressed:(){
                  Navigator.push(context,MaterialPageRoute(builder: (context) =>  ServicesState()));
                },icon: Image(image: AssetImage('assets/Mask Group 2.png')) )),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Container(
                padding: const EdgeInsets.fromLTRB(0,5,0,5),
                child: Image(image: AssetImage('assets/Mask Group 3.png'))),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Container(
                padding: const EdgeInsets.fromLTRB(0,5,0,5),
                child: const Image(image: AssetImage('assets/Mask Group 4.png'))),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
      ),
    );
  }
}
