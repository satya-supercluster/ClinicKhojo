import 'package:clinic_khojo/pages/private/appointment_details_page.dart';
import 'package:clinic_khojo/pages/private/doctors_profile_page.dart';
import 'package:clinic_khojo/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
class HospitalsTile extends StatefulWidget {
  final Map<String,dynamic> doctorsDetails;
  final int index;
  const HospitalsTile({
    required this.doctorsDetails,
    super.key,
    required this.index
  });

  @override
  State<HospitalsTile> createState() => _HospitalsTileState();
}

class _HospitalsTileState extends State<HospitalsTile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AppointmentDetailsPage(title:"Search Doctors",doctorsDetails:widget.doctorsDetails,index:widget.index)));
      },
      child: Container(
        width:width,
        padding: EdgeInsets.all(8),
        decoration:BoxDecoration(
          color:Color.fromARGB(255, 231, 236, 255),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width:width*0.2,
                          height: width*0.17,
                          margin:EdgeInsets.only(top:5,right:3),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(widget.doctorsDetails['clinics'][widget.index]['image']??"assets/img.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8))
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 3,
                      right: 0,
                      child:Container(
                        width:10.21,
                        height:10,
                        decoration: BoxDecoration(
                          color:Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(27)),
                          border:Border.all(width:1,color: Colors.white)
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(width:10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Title  
                  Row(
                    children: [
                      Expanded(child: Text(widget.doctorsDetails['clinics'][widget.index]['name']??"",style: GoogleFonts.poppins(fontWeight:FontWeight.bold,fontSize:18),)),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset("assets/star.png",width:12,height:12),
                      ),
                      SizedBox(width:3.7),
                      Align(
                        alignment: Alignment.center,
                        child: Text("${widget.doctorsDetails['clinics'][widget.index]['rating']}",style: TextStyle(fontWeight:FontWeight.w500,fontSize:10,color:Constants.themeGrey))
                      ),
                      SizedBox(width:12),
                      Text("Fee: ₹${widget.doctorsDetails['clinics'][widget.index]['fee']}",style: TextStyle(fontWeight:FontWeight.w500,fontSize:11,color:Colors.green),),
                      SizedBox(width:12),
                      Expanded(child: Text("Location: ${widget.doctorsDetails['clinics'][widget.index]['location']}",style: TextStyle(fontWeight:FontWeight.w500,fontSize:11,color:Constants.themeGrey),)),
                    ],
                  ),
                  SizedBox(height:5),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => DoctorProfile(map:widget.doctorsDetails['clinics'][widget.index])));
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 1, 1, 1),
                          child: Text("View Profile",style: TextStyle(fontWeight:FontWeight.w500,fontSize:14,decoration:TextDecoration.underline,color:Colors.red,decorationColor:Colors.red),)
                        )
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}