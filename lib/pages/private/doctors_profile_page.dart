import 'package:clinic_khojo/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorProfile extends StatefulWidget {
  final Map<String,String> map;
  const DoctorProfile({
    super.key,
    required this.map,
  });

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body:Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height:20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child:GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        size: 18,
                        Icons.arrow_back_ios,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Text(
                    widget.map['title']??"",
                    style: TextStyle(color: Constants.themeGrey,fontSize: 12,fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height:24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width:width*0.25,
                        height:width*0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          // boxShadow: BoxShadow()
                          image: DecorationImage(image: AssetImage("assets/doctor.jpg"),fit: BoxFit.cover,)
                        ),
                      ),
                      SizedBox(height:8),
                      Text(widget.map['name']??"",style:GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Constants.themeHeadingBlue))
                    ],
                  ),
                ],
              ),
              SizedBox(height:24),
              Row(
                children: [
                  SizedBox(width:8),
                  Text("More Details",style:GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Constants.themeSubheadingGrey))
                ],
              ),
              SizedBox(height:10),
              Container(
                padding:EdgeInsets.symmetric(horizontal: 16,vertical: 20),
                decoration: BoxDecoration(
                  color: Constants.themeLightBlue,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child:Column(
                  children: [
                    Row(
                      children: [
                        Text("Gender:",style:GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w400,color:Constants.themeGrey)),
                        SizedBox(width:24),
                        Expanded(child: Text("Male",style:GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w500,color:Constants.themeSubheadingGrey))),
                      ],
                    ),
                    SizedBox(height:8),
                    Row(
                      children: [
                        Text("Address:",style:GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w400,color:Constants.themeGrey)),
                        SizedBox(width:24),
                        Expanded(child: Text(widget.map['location']??"xyz",style:GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w500,color:Constants.themeSubheadingGrey))),
                      ],
                    ),
                    SizedBox(height:8),
                    Row(
                      children: [
                        Text("Degree:",style:GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w400,color:Constants.themeGrey)),
                        SizedBox(width:24),
                        Expanded(child: Text(widget.map['degree']??"xyz",style:GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w500,color:Constants.themeSubheadingGrey))),
                      ],
                    ),
                    SizedBox(height:8),
                    Row(
                      children: [
                        Text("Specialization:",style:GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w400,color:Constants.themeGrey)),
                        SizedBox(width:24),
                        Expanded(child: Text(widget.map['specialization']??"xyz",style:GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w500,color:Constants.themeSubheadingGrey))),
                      ],
                    ),
                    SizedBox(height:8),
                    Row(
                      children: [
                        Text("Years of Experience:",style:GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w400,color:Constants.themeGrey)),
                        SizedBox(width:24),
                        Expanded(child: Text("2",style:GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w500,color:Constants.themeSubheadingGrey))),
                      ],
                    ),
                    SizedBox(height:8),
                    Row(
                      children: [
                        Text("Title of clinic:",style:GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w400,color:Constants.themeGrey)),
                        SizedBox(width:24),
                        Expanded(child: Text(widget.map['title']??"xyz",style:GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w500,color:Constants.themeSubheadingGrey))),
                      ],
                    ),
                    SizedBox(height:8),
                    Row(
                      children: [
                        Text("Title of clinic:",style:GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w400,color:Constants.themeGrey)),
                        SizedBox(width:24),
                        Expanded(child: Text(widget.map['title']??"xyz",style:GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w500,color:Constants.themeSubheadingGrey))),
                      ],
                    ),
                    SizedBox(height:8),
                    Row(
                      children: [
                        Text("Title of clinic:",style:GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w400,color:Constants.themeGrey)),
                        SizedBox(width:24),
                        Expanded(child: Text(widget.map['title']??"xyz",style:GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w500,color:Constants.themeSubheadingGrey))),
                      ],
                    ),
                  ],
                )
              )
            ],
          ),
        )
      )
    );
  }
}