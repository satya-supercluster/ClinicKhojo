import 'package:clinic_khojo/data.dart';
import 'package:clinic_khojo/pages/private/search_doctor_screen.dart';
import 'package:clinic_khojo/utils/constants.dart';
import 'package:clinic_khojo/widgets/features/home_page/banner.dart';
import 'package:clinic_khojo/widgets/features/home_page/hospital_tile.dart';
import 'package:clinic_khojo/widgets/features/home_page/sort_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // Gives the width
    double height = MediaQuery.of(context).size.height;
    List<Map<String,dynamic>>details=l;
    List<Map<String,dynamic>>specialist=[
      {
        'value':'Heart',
        'no':5,
        'image':"assets/heart.png"
      },
      {
        'value':'Dental',
        'no':5,
        'image':"assets/dental.png"
      },
      {
        'value':'Eye',
        'no':5,
        'image':"assets/eye.png"
      },
      {
        'value':'More',
        'image':"assets/more.png"
      },
    ];
    return SafeArea(
      child: Scaffold(
        body:Column(
          children: [
            const SizedBox(height:20),
            const Row(children: [
              SizedBox(width:28),
              Text("Welcome Back!",style:TextStyle(fontSize:14,fontWeight:FontWeight.w400,color:Constants.themeGrey)),
            ],),
            const SizedBox(height:3),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child:const Row(
                      children: [
                        Text("Explore Doctors",style:TextStyle(fontSize:20,fontWeight:FontWeight.w500,color:Constants.themeHeadingBlue))
                      ],
                    )
                  ),
                  Container(
                    child:Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color:Constants.themeLightBlue,
                            borderRadius: BorderRadius.all(Radius.circular(4))
                          ),
                          child:Row(
                            children: [
                              Image.asset("assets/Subtract.png",width: 11.83,height:16),
                              const SizedBox(width:3),
                              const Text("Ayushmaan",style:TextStyle(fontSize:10,fontWeight:FontWeight.w500)),
                            ],
                          )
                        ),
                        const SizedBox(width:5),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color:Constants.themeLightBlue,
                            borderRadius: BorderRadius.all(Radius.circular(4))
                          ),
                          child:Row(
                            children: [
                              Image.asset("assets/Subtract.png",width: 11.83,height:16),
                              const SizedBox(width:3),
                              const Text("ABHA",style:TextStyle(fontSize:10,fontWeight:FontWeight.w500)),
                            ],
                          )
                        ),
                      ],
                    )
                  )
                ],
              ),
            ),
            const SizedBox(height:10),
            GestureDetector(
              onTap:(){
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SearchDoctorsPage(title:"Explore Doctors",details: details,)));
              },
              child: Container(
                width:width*0.822,
                height:height*0.05,
                decoration: BoxDecoration(
                  border:Border.all(
                    width: 1,
                    color:Constants.themeGrey
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(27))
                ),
                padding: const EdgeInsets.only(left:13),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Container(
                      alignment: Alignment.center,
                      width:width*0.06,
                      padding: const EdgeInsets.all(2),
                      child: Icon(
                        Icons.search,
                        size:width*0.05,
                        color:Constants.themeGrey
                      ),
                    ),
                    Expanded(
                      child:TextField(
                        enabled: false,
                        autofocus: false,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Search Doctors...",
                          hintStyle: GoogleFonts.poppins(fontSize:12),
                          contentPadding: const EdgeInsets.only(left:4,bottom: 10),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: null,
                          focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 0),
                          ),
                        ),
                      )
                    ),
                    Container(
                      alignment: Alignment.center,
                      width:width*0.13,
                      height: height*0.05,
                      decoration: const BoxDecoration(
                        border:Border(
                          left:BorderSide(
                            width:1,
                            color: Constants.themeGrey
                          ),
                        ),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                        color: Constants.themeLightRed
                      ),
                      child: const Icon(
                        Icons.tune,
                        size:25,
                        color:Colors.red
                      ),
                    )
                  ]
                )
              ),
            ),
            const SizedBox(height:20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Row(
                      children: [
                        SizedBox(width:24),
                        Text("View By Specialist",style:TextStyle(fontSize:14,fontWeight:FontWeight.w500,color:Constants.themeSubheadingGrey))
                      ],
                    ),
                    const SizedBox(height:10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:List.generate(specialist.length, 
                          (index) => GestureDetector(
                            onTap:()=>{
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchDoctorsPage(title: "View By Specialist", details: details)))
                            },
                            child: SortingTile(no: '${specialist[index]['no']} Doctors', image: specialist[index]['image'], value: specialist[index]['value'])
                            )
                        )
                      ),
                    ),
                    const SizedBox(height:20),
                    const Row(
                      children: [
                        SizedBox(width:24),
                        Text("View By Symptom",style:TextStyle(fontSize:14,fontWeight:FontWeight.w500,color:Constants.themeSubheadingGrey))
                      ],
                    ),
                    const SizedBox(height:10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          GestureDetector(
                            onTap:()=>{
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchDoctorsPage(title: "View By Specialist", details: details)))
                            },
                            child: const SortingTile(value:"Pregnany",no:"5"+" Doctors",image:"assets/pregnant.png")
                          ),
                          GestureDetector(
                            onTap:()=>{
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchDoctorsPage(title: "View By Specialist", details: details)))
                            },
                            child: const SortingTile(value:"Fever",no:"5"+" Doctors",image:"assets/fever.png")
                          ),
                          GestureDetector(
                            onTap:()=>{
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchDoctorsPage(title: "View By Specialist", details: details)))
                            },
                            child: const SortingTile(value:"Dengue",no:"5"+" Doctors",image:"assets/dengue.png")
                          ),
                          GestureDetector(
                            onTap:()=>{
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchDoctorsPage(title: "View By Specialist", details: details)))
                            },
                            child: const SortingTile(value:"More",no:"",image:"assets/more.png")
                          ),
                        ]
                      ),
                    ),
                    const SizedBox(height:20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("View By Hospital",style:TextStyle(fontSize:14,fontWeight:FontWeight.w500,color:Constants.themeSubheadingGrey)),
                          Text("View All",style:TextStyle(fontSize:12,fontWeight:FontWeight.w500,color:Constants.themeGrey)),
                        ],
                      ),
                    ),
                    const SizedBox(height:10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap:()=>{
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchDoctorsPage(title: "View By Specialist", details: details)))
                            },
                            child: const HospitalTile()
                          ),
                          GestureDetector(
                            onTap:()=>{
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchDoctorsPage(title: "View By Specialist", details: details)))
                            },
                            child: const HospitalTile()
                          ),
                          GestureDetector(
                            onTap:()=>{
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchDoctorsPage(title: "View By Specialist", details: details)))
                            },
                            child: const HospitalTile()
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: SlideshowBanner(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height:60)
          ],
        )
      )
    );
  }
}
