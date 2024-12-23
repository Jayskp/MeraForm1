import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:meraform1/Services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);



  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool showOtpField = false; // Flag to show/hide OTP field
  final formkey = GlobalKey<FormState>();
  String? value;
  String? newValue;
  void submit() {
    final isValid = formkey.currentState?.validate();
    if (isValid == null || !isValid) {
      return; // Stop if the form is not valid
    }formkey.currentState?.save();
    print("OTP sent!");
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>  SecondRoute(number: newValue)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
        child: ConstrainedBox(
        constraints: BoxConstraints(),
    child:
        Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              Stack(
                children: [

                  Container(
                    child: Image.asset(
                        'assets/7431c792-5930-4779-a515-0475dfbe9260.png',
                        scale: 0.10),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 95, 40, 10),
                    child: const Text(
                      'Welcome to MeraForm',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Raleway",
                          fontSize: 27.0),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(20, 140, 40, 10),
                      child: const Text(
                          "we're thrilled to see you again!!",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                              fontFamily: 'Poppins'))),
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 218, 0, 0),
                      height: 696,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20))),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 240, 0, 20),
                    child: const Text(
                      "Enter your registered mobile number to receive a One-Time Password (OTP) for secure login.",
                      style: TextStyle(
                          color: Colors.grey, fontFamily: "Poppins", fontSize: 12),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 310, 20, 0),
                    child: const Text(
                      "Mobile Number",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),

                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 350, 20, 0),
                      child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Image.asset('assets/images (2).png'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value) {
                            if (value == null || value.length>10|| value.length<10) {
                              return 'Please enter a valid number';
                            }
                            return null;
                          },onChanged:(value){
                        setState(() {
                          newValue = value;
                        });
                      })),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 790, 20, 0),
                    width: 500,
                    color: Colors.lightGreenAccent.shade100,
                    child: TextButton(
                      onPressed: () {
                        submit();
                        // margin: const EdgeInsets.fromLTRB(10,690,20,0);
                        // setState(() {
                        //   showOtpField = true; // Set flag to true
                        // });
                      },
                      child: const Text(
                        "Proceed Ahead",
                        style: TextStyle(
                            color: Colors.black, fontFamily: "Raleway"),
                      ),
                    ),
                  ),
                  // Show OTP field only when the flag is true
                  if (showOtpField)
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 500, 20, 0),
                      child: OtpTextField(
                        numberOfFields: 5,
                        borderColor: const Color(0xFF512DA8),
                        showFieldAsBox: true,
                        onCodeChanged: (String code) {
                          // Handle validation or checks here
                        },
                        onSubmit: (String verificationCode) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Verification Code"),
                                  content:
                                  Text('Code entered is $verificationCode'),
                                );
                              });
                        }, // end onSubmit
                      ),
                    ),
                ],
              )
            ],
          ),
        ))));
  }
}
class SecondRoute extends StatelessWidget {
  String? number;
  SecondRoute({required this.number});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:SingleChildScrollView(
        child: ConstrainedBox(
        constraints: BoxConstraints(),
    child:
        Column(

          // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/7431c792-5930-4779-a515-0475dfbe9260.png",
                      scale:0.01,
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(20,90,0,20),
                      child: Text(
                        'Welcome To MeraForm',
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.Raleway,
                            fontFamily:'Raleway',
                            fontSize: 27.0),
                      )),
                  Container(
                      margin: const EdgeInsets.fromLTRB(24,130,0,20),
                      child: Text(
                        "We're thrilled to see you again!",
                        style: TextStyle(color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.Raleway,
                            fontFamily:'Poppins',
                            fontSize: 12.0),
                      )),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0,220,0,0),
                    height: 650,
                    width: 1000,


                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(10.0),
                      color: Colors.white,

                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15,240,15,20),
                    child: Text(
                      "Enter your registered mobile number to receive a One-Time Password (OTP) for secure login.",
                      style: TextStyle(color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                        // fontStyle: FontStyle.Raleway,
                        fontFamily:'Poppins',
                        fontSize: 12.0, ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(15,310,0,20),
                    child: Text(
                      "Mobile Number ",
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w600,
                          // fontStyle: FontStyle.Raleway,
                          fontFamily:'Poppins',
                          fontSize: 12.0),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(330, 300, 20, 0),
                      child: TextButton( onPressed: () { Navigator.pop(context, true); },
                          child: Text("Edit", style: TextStyle(color: Colors.blue),
                          )
                      )
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15,350,15,20),
                    child: TextFormField(
                      // validator: (value){
                      //   if(value == null || value.length>=10){
                      //     return 'enter valid number';
                      //   }
                      // },
                      controller: TextEditingController(text:number),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        prefixIcon: Align(
                          widthFactor: 1.0,
                          child: Image(image: AssetImage('assets/images (2).png')),
                        ),

                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(15,500,15,20),
                    child:OtpTextField(
                      numberOfFields: 5,
                      borderColor: Colors.black,
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode){
                        showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text("Verification Code"),
                                content: Text('Code entered is $verificationCode'),
                              );
                            }
                        );
                      }, // end onSubmit
                    ),
                  ),

                  Container(
                    width: 370,
                    margin: const EdgeInsets.fromLTRB(20, 800, 0, 25),
                    decoration: BoxDecoration(
                      color: Colors.lightGreenAccent.shade100, // Background color for container
                      borderRadius: BorderRadius.circular(8), // Optional rounded corners
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ThirdRoute()),
                        );
                      },
                      child: const Text(
                        'Verify and continue',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  )
                  ,


                ],
              ),
            ]
        ))));
  }
}

class ThirdRoute extends StatelessWidget{
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void submit() {
      final isValid = formkey.currentState?.validate();
      if (isValid == null || !isValid) {
        return; // Stop if the form is not valid
      }formkey.currentState?.save();
      print("OTP sent!");
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  FourthRoute()));
    }
    // TODO: implement build
    return Scaffold(
        body:
        SingleChildScrollView(
        child: ConstrainedBox(
        constraints: BoxConstraints(),
    child:Form(
          key: formkey,
        child:Column(

          // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.fromLTRB(20,60,0,20),
                        child: Text(
                          'Welcome!',
                          style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.bold,
                              // fontStyle: FontStyle.Raleway,
                              fontFamily:'Raleway',
                              fontSize: 27.0),
                        )

                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(20,100,40,20),
                        child: Text(
                          'Its seems like you are new to MeraForm, Please fill out the details below to create your account and get started on your journey with us.',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black,
                              // fontStyle: FontStyle.Raleway,
                              fontFamily:'Poppins',
                              fontSize: 12.0),
                        )

                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(20,180,40,20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // First Name
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'First Name',
                                        style: TextStyle(fontWeight: FontWeight.w600,fontFamily:'Poppins',fontSize: 12.0),
                                      ),
                                      SizedBox(height: 8),
                                      TextFormField(
                                        validator: (value){
                                          if(value==null){
                                            return "Please enter your first name";
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Enter First Name',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                          ),
                                          contentPadding:
                                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 16), // Spacing between First Name and Last Name

                                // Last Name
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Last Name',
                                        style: TextStyle(fontWeight: FontWeight.w600,fontFamily:'Poppins',fontSize: 12.0),
                                      ),
                                      SizedBox(height: 8),
                                      TextFormField(
                                        validator: (value){
                                          if(value==null){
                                            return "Please enter your last name";
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Enter Last Name',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                          ),
                                          contentPadding:
                                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(20,270,0,20),
                        child: Text(
                          'Mobile Number*',
                          style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.w600,
                              // fontStyle: FontStyle.Raleway,
                              fontFamily:'Poppins',
                              fontSize: 12.0),
                        )

                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20,300,10,20),
                      child: TextFormField(
                        // validator: (value){
                        //   if(value == null || value.length>=10){
                        //     return 'enter valid number';
                        //   }
                        // },
                        decoration: InputDecoration(
                          hintText: "99999-99999" ,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Align(
                            widthFactor: 1.0,
                            child: Image(image: AssetImage('assets/images (2).png')),
                          ),

                        ),
                          validator: (value) {
                            if (value == null || value.length>10|| value.length<10) {
                              return 'Please enter a valid number';
                            }
                            return null;
                          }
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(20,380,0,20),
                        child: Text(
                          'Email Address',
                          style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.w600,
                              // fontStyle: FontStyle.Raleway,
                              fontFamily:'Poppins',
                              fontSize: 12.0),
                        )

                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20,410,15,20),
                      child: TextFormField(
                        // validator: (value){
                        //   if(value == null || value.length>=10){
                        //     return 'enter valid number';
                        //   }
                        // },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid email';
                          }
                          if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$")
                              .hasMatch(value)) {
                            return 'Enter a valid email!';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your email address",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),

                        ),
                      ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(20,490,0,20),
                        child: Text(
                          'Adhar Card Number*',
                          style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.w600,
                              // fontStyle: FontStyle.Raleway,
                              fontFamily:'Poppins',
                              fontSize: 12.0),
                        )

                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20,520,15,20),
                      child: TextFormField(
                        // validator: (value){
                        //   if(value == null || value.length>=10){
                        //     return 'enter valid number';
                        //   }
                        // },
                        validator: (value){
                          if(value==null || value.length!=12){
                            return "Please enter valid card number";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Ex 1234-5678-8919",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),

                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(20,600,0,20),
                        child: Text(
                          'GST Number*',
                          style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.w600,
                              // fontStyle: FontStyle.Raleway,
                              fontFamily:'Poppins',
                              fontSize: 12.0),
                        )

                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20,630,15,20),
                      child: TextFormField(
                        // validator: (value){
                        //   if(value == null || value.length>=10){
                        //     return 'enter valid number';
                        //   }
                        // },
                        validator: (value){
                          if(value==null || value.length!=15){
                            return "Please enter valid GST number";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Ex 12345-67890-12345",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),

                      ),
                    ),
                    Container(
                      width: 370,
                      margin: const EdgeInsets.fromLTRB(20, 810, 0, 25),
                      decoration: BoxDecoration(
                        color: Colors.lightGreenAccent.shade100, // Background color for container
                        borderRadius: BorderRadius.circular(8), // Optional rounded corners
                      ),
                      child: TextButton(
                        onPressed: () {
                          submit();

                        },
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    )

                  ]),
            ]
        )
    ))));
  }
}

class FourthRoute extends StatefulWidget {
  const FourthRoute({Key? key}) : super(key: key);

  @override
  FourState createState() => FourState();
}

 class FourState extends State<FourthRoute>{
   String dropdownvalue='Select A City';
   String dropdownvalue1='Select A State';
   var items =['Select A City','Banglore', 'Ahmedabad','Hyderabad','Delhi'];
   var items1 =['Select A State','Karnataka','Gujarat','Telangana','Delhi'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:SingleChildScrollView(
        child: ConstrainedBox(
        constraints: BoxConstraints(),
    child:
      Form(
        child: Column(
          children: [
            Stack(
        children: [
            Container(
                margin: const EdgeInsets.fromLTRB(20,0,0,20),
              child: Text("Add Address", style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.bold,
                // fontStyle: FontStyle.Raleway,
                fontFamily:'Raleway',
                fontSize: 27.0))),
            Container(
              margin: const EdgeInsets.fromLTRB(20,50,0,20),
              child: Text("Please enter the details of your current address.",
              style: TextStyle(fontSize: 12, fontFamily: 'Poppins', color: Colors.grey.shade900))
            ),
        Container(
          width: 600,
          margin: const EdgeInsets.fromLTRB(20,80,20,20),
          child: Padding(padding: const EdgeInsets.fromLTRB(20,20,20,20),
          child: Text("Work Address*", style: TextStyle(fontSize: 15, fontFamily: 'Raleway',fontWeight: FontWeight.bold),)),
          color: Colors.blue.shade100,
        ),
          Container(
              margin: const EdgeInsets.fromLTRB(20,160,20,20),
            child: Text("Address line 1", style: TextStyle(
              fontSize: 12, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w600))
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20,190,20,20),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Address",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),

            ),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(20,260,20,20),
              child: Text("Address line 2", style: TextStyle(
                  fontSize: 12, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w600))
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20,290,20,20),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Address",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),

            ),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(20,360,20,20),

              child: Text("City",style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black
            ))
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20,390,20,20),
            child: DropdownButtonFormField(
              isExpanded:  true,
              decoration: InputDecoration(border:OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
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
              margin: const EdgeInsets.fromLTRB(20,450,20,20),

              child: Text("State",style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black
              ))
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20,480,20,20),
            child: DropdownButtonFormField(
              isExpanded: true,
              // Initial Value
              value: dropdownvalue1,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items1.map((String items1) {
                return DropdownMenuItem(
                  value: items1,
                  child: Text(items1),
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
              margin: const EdgeInsets.fromLTRB(20,540,20,20),
              child: Text("Pincode", style: TextStyle(
                  fontSize: 12, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w600))
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20,570,20,20),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Pincode",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),

            ),
          ),


          Container(
            width: 600,
            margin: const EdgeInsets.fromLTRB(20,650,20,20),
            child: Padding(padding: const EdgeInsets.fromLTRB(20,20,20,20),
                child: Text("Home Address*", style: TextStyle(fontSize: 15, fontFamily: 'Raleway',fontWeight: FontWeight.bold),)),
            color: Colors.blue.shade100,
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(20,740,20,20),
              child: Text("Address line 1", style: TextStyle(
                  fontSize: 12, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w600))
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20,770,20,20),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Address",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),

            ),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(20,850,20,20),
              child: Text("Address line 2", style: TextStyle(
                  fontSize: 12, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w600))
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20,880,20,20),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Address",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),

            ),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(20,950,20,20),

              child: Text("City",style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black
              ))
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20,980,20,20),
            child: DropdownButtonFormField(
              isExpanded: true,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
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
              margin: const EdgeInsets.fromLTRB(20,1040,20,20),

              child: Text("State",style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black
              ))
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20,1070,20,20),
            child: DropdownButtonFormField(
              isExpanded: true,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
              // Initial Value
              value: dropdownvalue1,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items1.map((String items1) {
                return DropdownMenuItem(
                  value: items1,
                  child: Text(items1),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue1 = newValue!;
                });
              },
            ),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(20,1130,20,20),
              child: Text("Pincode", style: TextStyle(
                  fontSize: 12, fontFamily: "Poppins", color: Colors.black, fontWeight: FontWeight.w600))
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20,1160,20,20),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Pincode",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),

            ),
          ),
          Container(
            width: 370,
            margin: const EdgeInsets.fromLTRB(20, 1280, 0, 25),
            decoration: BoxDecoration(
              color: Colors.lightGreenAccent.shade100, // Background color for container
              borderRadius: BorderRadius.circular(8), // Optional rounded corners
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  FifthRoute()));
              },
              child: const Text(
                'Continue',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          )


        ])
          ],
        )
      )
    )));
  }
}
class FifthRoute extends StatefulWidget {
  const FifthRoute({super.key});

  @override
  State<FifthRoute> createState() => _FifthRouteState();
}

class _FifthRouteState extends State<FifthRoute> {
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
        child: ConstrainedBox(
        constraints: BoxConstraints(),
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(10,60,20,0),
                      child:IconButton(onPressed: (){}, icon: Image(image: AssetImage("assets/Group 331.png")))
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(70,55,20,0),
                      child: Text("Welcome Jay",style: TextStyle(fontSize: 18, fontFamily: "Poppins",fontWeight: FontWeight.w600, color: Colors.black),)
                    ),
                    Container(
                      margin:const EdgeInsets.fromLTRB(90,85,20,0),
                      child: Text("Ahmedabad", style: TextStyle(fontSize: 12,fontFamily:"Poppins", fontWeight: FontWeight.w400, color:Colors.black))
                    ),
                    Container(
                      margin:const EdgeInsets.fromLTRB(70,85, 20,0),
                      child: Icon(Icons.location_pin, size: 18,),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(180,85,20,0),
                      child: Icon(Icons.keyboard_arrow_down, size: 20,)
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(350,60,0,0),
                        child:IconButton(onPressed: (){}, icon: Image(image: AssetImage("assets/noun-notification-7044045.png"),height: 30,))
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20,150,20,10),
                      alignment: Alignment.center,
                      child: Image.asset("assets/Rectangle 470.png",scale: 0.01,)
                    ),
                    Container(
                      margin:const EdgeInsets.fromLTRB(40, 170,0,0),
                      child: Text("₹ 1500",style:TextStyle(fontSize:25, fontWeight: FontWeight.w900,color: Colors.black, fontFamily: "Poppins")),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(40,210,0,0),
                      child: Text("Total Earning",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w100,fontFamily: "Poppins"),)
                    ),
                    Container(
                      width: 110,
                      margin: const EdgeInsets.fromLTRB(262,170,20,0),
                      child: DropdownButtonFormField(
                        hint: Text("Month",style: TextStyle(fontFamily: 'Poppins')),
                        decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
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
                        margin: const EdgeInsets.fromLTRB(265,235,0,0),
                        child: Image.asset("assets/noun-arrow-out-3652533.png"),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(280,230,0,0),
                      child: Text("-4%", style: TextStyle(fontFamily: 'Poppins', fontSize: 12,color: Colors.black,fontWeight: FontWeight.w800),)
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(312,230,0,0),
                      child: Text("(₹ 60)", style: TextStyle(fontSize: 12, fontFamily: 'Poppins',fontWeight: FontWeight.w100),)
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
                        dashGradient: [Colors.red, Colors.blue],
                        dashRadius: 0.0,
                        dashGapLength: 4.0,
                        dashGapColor: Colors.transparent,
                        dashGapGradient: [Colors.red, Colors.blue],
                        dashGapRadius: 0.0,
                      )
                    ),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.fromLTRB(41,290,0,0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.fromLTRB(10,0,10,0),
                           child:Text("25",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w800,fontFamily: "Poppins"))),
                          Container(
                            margin: const EdgeInsets.fromLTRB(62,10,10,0),
                            child: Image.asset("assets/purchase-order.png")
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10,40,10,0),
                            child: Text("Total Order", style: TextStyle(fontSize: 11, fontFamily: 'Poppins',fontWeight: FontWeight.w100))
                          )
                        ],
                      )

                    ),
                    Container(
                        color: Colors.white,
                        margin: const EdgeInsets.fromLTRB(160,290,0,0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                                margin: const EdgeInsets.fromLTRB(10,0,10,0),
                                child:Text("05",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w800,fontFamily: "Poppins"))),
                            Container(
                                margin: const EdgeInsets.fromLTRB(62,10,10,0),
                                child: Image.asset("assets/g579.png")
                            ),
                            Container(
                                margin: const EdgeInsets.fromLTRB(10,40,10,0),
                                child: Text("New order", style: TextStyle(fontSize: 11, fontFamily: 'Poppins',fontWeight: FontWeight.w100))
                            )
                          ],
                        )

                    ),
                    Container(
                        color: Colors.white,
                        margin: const EdgeInsets.fromLTRB(270,290,0,0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                                margin: const EdgeInsets.fromLTRB(10,0,10,0),
                                child:Text("20",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w800,fontFamily: "Poppins"))),
                            Container(
                                margin: const EdgeInsets.fromLTRB(62,10,10,0),
                                child: Image.asset("assets/Product_Return.png")
                            ),
                            Container(
                                margin: const EdgeInsets.fromLTRB(10,40,10,0),
                                child: Text("Orders", style: TextStyle(fontSize: 11, fontFamily: 'Poppins',fontWeight: FontWeight.w100))
                            )
                          ],
                        )

                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20,390,20,0),
                      child: Text("Recent Orders",style: TextStyle(fontFamily: "Raleway",fontWeight: FontWeight.bold,fontSize: 16))
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(340,390,20,0),
                      child: Text("See All", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Poppins'))
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(20,450,20,10),
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
                      width:170,
                      color: Colors.lightGreenAccent.shade100,
                      margin:  const EdgeInsets.fromLTRB(40,470,0,0),
                      child: TextButton(
                        onPressed: () {
                        },
                        child: const Text(
                          'New Order',
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      )
                    ),
                    Container(
                        width:169,
                        color: Colors.white,
                        margin:  const EdgeInsets.fromLTRB(200,470,20,0),
                        child: TextButton(
                          onPressed: () {
                          },
                          child: const Text(
                            'Current Orders',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                        )
                    ),
                    Container(
                        height:140,

                      margin: const EdgeInsets.fromLTRB(0,530,0,0),
                    child:CarouselSlider(
                      items: [
                        Container(
                          padding: EdgeInsets.fromLTRB(10,16,10,10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/graduation-cap (1).png",
                                    height: 40,
                                    width: 40,
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Digital Education Initiatives",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/noun-calendar-7019700.png",
                                            height: 20,
                                            width: 20,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "12 August 2024",
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontFamily: "Poppins",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.black,
                                thickness: 1,
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Rohit Sharma",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "₹ 528",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      // Approve Button
                                      Container(
                                        height: 30,
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.green.shade50,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/noun-approvals-3039210.png",
                                              height: 20,
                                              width: 20,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              "Approve",
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontFamily: "Poppins",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      // Reject Button
                                      Container(
                                        height: 30,
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.red.shade50,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/Group 255.png",
                                              height: 20,
                                              width: 20,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              "Reject",
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontFamily: "Poppins",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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
                    )),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20,725,20,0),
                      child: Text("Service Overview", style: TextStyle(fontSize:16, fontWeight: FontWeight.bold, fontFamily: 'Raleway'))
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(340,725,20,0),
                        child: Text("See All", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Poppins'))
                    ),
                    Container(
                      color: Colors.yellow.shade50,
                      margin: const EdgeInsets.fromLTRB(20,770,0,0),
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
                        margin: const EdgeInsets.fromLTRB(240,770,0,0),
                        child: TextButton(onPressed: (){},
                            child: Stack(
                              children: [
                                Container(
                                    margin: const EdgeInsets.fromLTRB(0,5,0,0),
                                    child: Text("New Service",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold, fontFamily: "Raleway", color: Colors.black),)
                                ),
                                Container(
                                    margin: const EdgeInsets.fromLTRB(100,0,0,0),
                                    child: Image.asset("assets/Group 399.png")
                                )
                              ],
                            ))
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(20,850,20,0),
                        width: 170,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[400]
                        ),
                        child:Stack(children:[
                          Container(
                            margin: const EdgeInsets.fromLTRB(10,20,10,0),
                            child:  Text('26',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,fontFamily: 'Poppins'),),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10,60,10,0),
                            child:  Text('Service Application',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Poppins',color: Colors.grey[600]),),
                          ),
                          Container(
                              margin: const EdgeInsets.fromLTRB(10,100,10,0),
                              child:DottedLine(
                                direction: Axis.horizontal,
                                alignment: WrapAlignment.center,
                                lineLength: double.infinity,
                                lineThickness: 1.0,
                                dashLength: 4.0,
                                dashColor: Colors.black,
                                dashGradient: [Colors.red, Colors.black],
                                dashRadius: 0.0,
                                dashGapLength: 4.0,
                                dashGapColor: Colors.transparent,
                                dashGapGradient: [Colors.red, Colors.black],
                                dashGapRadius: 0.0,
                              )
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10,100,10,0),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(10,10,0,0),
                                  height: 5,
                                  width: 5,
                                  decoration: BoxDecoration(
                                      color: Colors.green
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(10,10,0,0),
                                  child:  Text('20 ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,fontFamily: 'Poppins',color: Colors.black),),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(10,10,0,0),
                                  child:  Text('Approved ',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 11,fontFamily: 'Poppins',color: Colors.grey[600]),),
                                ),

                              ],
                            ),

                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10,120,10,0),
                            child:  Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(10,10,0,0),
                                  height: 5,
                                  width: 5,
                                  decoration: BoxDecoration(
                                      color: Colors.orange
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(10,10,0,0),
                                  child:  Text('04 ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,fontFamily: 'Poppins',color: Colors.black),),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(10,10,0,0),
                                  child:  Text('In Review ',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 11,fontFamily: 'Poppins',color: Colors.grey[600]),),
                                ),

                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10,140,10,0),
                            child:   Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(10,10,0,0),
                                  height: 5,
                                  width: 5,
                                  decoration: BoxDecoration(
                                      color: Colors.red
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(10,10,0,0),
                                  child:  Text('01 ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,fontFamily: 'Poppins',color: Colors.black),),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(10,10,0,0),
                                  child:  Text('Rejected',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 11,fontFamily: 'Poppins',color: Colors.grey[600]),),
                                ),

                              ],
                            ),

                          )


                        ])
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(226,850,20,0),
                        width: 170,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[400]
                        ),
                        child:Stack(children:[
                          Container(
                            margin: const EdgeInsets.fromLTRB(10,20,10,0),
                            child:  Text('30',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,fontFamily: 'Poppins'),),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10,60,5,0),
                            child:  Text('Enrolled Services',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Poppins',color: Colors.grey[600]),),
                          ),
                          Container(
                              margin: const EdgeInsets.fromLTRB(10,100,10,0),
                              child:DottedLine(
                                direction: Axis.horizontal,
                                alignment: WrapAlignment.center,
                                lineLength: double.infinity,
                                lineThickness: 1.0,
                                dashLength: 4.0,
                                dashColor: Colors.black,
                                dashGradient: [Colors.red, Colors.black],
                                dashRadius: 0.0,
                                dashGapLength: 4.0,
                                dashGapColor: Colors.transparent,
                                dashGapGradient: [Colors.red, Colors.black],
                                dashGapRadius: 0.0,
                              )
                          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10,100,10,0),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(10,10,0,0),
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                      color: Colors.green
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10,10,0,0),
                  child:  Text('20 ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,fontFamily: 'Poppins',color: Colors.black),),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10,10,0,0),
                  child:  Text('Approved ',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 11,fontFamily: 'Poppins',color: Colors.grey[600]),),
                ),

              ],
            ),

          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10,120,10,0),
            child:  Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(10,10,0,0),
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                      color: Colors.orange
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10,10,0,0),
                  child:  Text('04 ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,fontFamily: 'Poppins',color: Colors.black),),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10,10,0,0),
                  child:  Text('In Review ',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 11,fontFamily: 'Poppins',color: Colors.grey[600]),),
                ),

              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(10,140,10,0),
              child:   Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(10,10,0,0),
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                        color: Colors.red
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10,10,0,0),
                    child:  Text('01 ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,fontFamily: 'Poppins',color: Colors.black),),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10,10,0,0),
                    child:  Text('Rejected',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 11,fontFamily: 'Poppins',color: Colors.grey[600]),),
                  ),

                ],
              ),)
                        ])
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0,1090,0,0),
                      color: Colors.blue.shade50,
                      width:420,
                      height: 356,
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(20,1110,20,0),
                        child: Text("Service Overview", style: TextStyle(fontSize:16, fontWeight: FontWeight.bold, fontFamily: 'Raleway'))
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(340,1110,20,0),
                        child: Text("See All", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Poppins'))
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                      ),
                      margin: const EdgeInsets.fromLTRB(20,1150,20,0),
                      child: ExpansionTile(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        backgroundColor: Colors.white,
                        title: Text('How do I book a service on MeraForm?',style: TextStyle(fontSize: 13, fontFamily: 'Poppins')),
                        children: <Widget>[
                          ListTile(title: Text('This is tile number 1',style: TextStyle(fontSize: 13, fontFamily: 'Poppins'))),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                      ),
                      margin: const EdgeInsets.fromLTRB(20,1240,20,0),
                      child: ExpansionTile(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        backgroundColor: Colors.white,
                        title: Text('Are the service providers on MeraForm verified?',style: TextStyle(fontSize: 13, fontFamily: 'Poppins')),
                        children: <Widget>[
                          ListTile(title: Text('This is tile number 1',style: TextStyle(fontSize: 13, fontFamily: 'Poppins'))),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                      ),
                      margin: const EdgeInsets.fromLTRB(20,1330,20,0),
                      child: ExpansionTile(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        backgroundColor: Colors.white,
                        title: Text('What should I do if I am not satisfied with the service provided?',style: TextStyle(fontSize: 13, fontFamily: 'Poppins')),
                        children: <Widget>[
                          ListTile(title: Text('This is tile number 1',style: TextStyle(fontSize: 13, fontFamily: 'Poppins'))),
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(20,1480,20,20),
                        child: Text("Contact Support", style: TextStyle(fontSize:16, fontWeight: FontWeight.bold, fontFamily: 'Raleway'))
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20,1520,20,20),
                      child: Image.asset("assets/Group 478.png")
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(60,1520,20,20),
                      child: Text("+91 7984335182", style: TextStyle(fontSize: 13, fontFamily: 'Poppins'))
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20,1550,20,20),
                      child:Divider()
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(20,1570,20,20),
                        child: Image.asset("assets/Group 479.png")
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(60,1570,20,20),
                        child: Text("jayskapadia11@gmail.com", style: TextStyle(fontSize: 13, fontFamily: 'Poppins'))
                    ),
                  ],
                )
              ],
        )
    )),
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
           child: Image(image: AssetImage('assets/Mask Group 4.png'))),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
      ),);
  }
}
