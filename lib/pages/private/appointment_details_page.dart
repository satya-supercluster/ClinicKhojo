import 'package:clinic_khojo/pages/private/appointment_form_page.dart';
import 'package:clinic_khojo/services/functions/common_functions.dart';
import 'package:clinic_khojo/utils/constants.dart';
import 'package:clinic_khojo/widgets/global/time_picker.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

class AppointmentDetailsPage extends StatefulWidget {
  final String title;
  final Map<String,dynamic> doctorsDetails;
  final int index;
  const AppointmentDetailsPage({
    required this.title,
    required this.doctorsDetails,
    required this.index,
    super.key,
  });

  @override
  State<AppointmentDetailsPage> createState() => _AppointmentDetailsPageState();
}

class _AppointmentDetailsPageState extends State<AppointmentDetailsPage> {
  late String currMonth;
  @override
    void initState() {
      super.initState();
      setState(() {
        currMonth=getMonth(DateTime.now());
      });
    }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // Gives the width
    return SafeArea(
      child: Scaffold(
        backgroundColor:Constants.themeLightBlue,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child:GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 24),
                        child: const Icon(
                          size: 22,
                          Icons.arrow_back_ios,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 24),
                    alignment: Alignment.center,
                    child: Text(
                      widget.title,
                      style: const TextStyle(color: Constants.themeGrey,fontSize: 14,fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      width:width,
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
                                        width:width*0.33,
                                        height: width*0.252,
                                        margin:const EdgeInsets.only(top:5,right:3),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(widget.doctorsDetails['image']??"assets/doctor.jpg"),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: const BorderRadius.all(Radius.circular(8))
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
                                        borderRadius: const BorderRadius.all(Radius.circular(27)),
                                        border:Border.all(width:1,color: Colors.white)
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(width:24),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                //Title
                      
                                Text("${widget.doctorsDetails['name']}",style: const TextStyle(fontWeight:FontWeight.bold,fontSize:18),),
                      
                                const SizedBox(height:4),
                                // Degree, Specialization and Fee
                      
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${widget.doctorsDetails['degree']}",style: const TextStyle(fontWeight:FontWeight.w500,fontSize:10,color:Constants.themeGrey),),
                                    const SizedBox(width:10),
                                    Text("Fee: ₹${widget.doctorsDetails['fee']}",style: const TextStyle(fontWeight:FontWeight.w500,fontSize:10,color:Colors.green),),
                                    const SizedBox(width:10),
                                    Expanded(
                                      child: Text("${widget.doctorsDetails['specialization']} Specialist",style: const TextStyle(fontWeight:FontWeight.w500,fontSize:10,color:Constants.themeGrey),)
                                    ),
                                  ],
                                ),
                                const SizedBox(height:12),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      padding:const EdgeInsets.fromLTRB(8.5, 6, 8.5, 6),
                                      decoration:const BoxDecoration(
                                        color:Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(2)),
                                      ),
                                      child: const Text("Appointment",style: TextStyle(fontWeight:FontWeight.w500,fontSize:10,color:Constants.themeGrey)),
                                    ),
                                    const SizedBox(width:24),
                                    // image of star should be added here
                                    Align(
                                      alignment: Alignment.center,
                                      child: Image.asset("assets/star.png",width:12,height:12),
                                    ),
                                    const SizedBox(width:3.7),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text("${widget.doctorsDetails['rating']}",style: const TextStyle(fontWeight:FontWeight.w500,fontSize:10,color:Constants.themeGrey))
                                    )
                                  ],
                                ),
                                const SizedBox(height:12),
                                Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width:30,
                                          height: 30,
                                          padding:const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(widget.doctorsDetails['clinics'][widget.index]['image']??"assets/img.jpg"),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: const BorderRadius.all(Radius.circular(8))
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(width:8),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(widget.doctorsDetails['clinics'][widget.index]['name']??"",style: const TextStyle(fontWeight:FontWeight.w500,fontSize:14),),
                                        GestureDetector(
                                          // onTap: (){
                                          //   Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (BuildContext context) => DoctorProfile(map:widget.doctorsDetails)));
                                          // },
                                          child: Container(
                                            padding: const EdgeInsets.fromLTRB(0, 1, 0, 1),
                                            child: const Text("View Profile",style: TextStyle(fontWeight:FontWeight.w500,fontSize:14,decoration:TextDecoration.underline,color:Colors.red,decorationColor:Colors.red),)
                                          )
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height:25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child:Container(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                        decoration: const BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Address",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Constants.themeBlue)),
                                SizedBox(height:2),
                                Text("123,xyz,Lucknow",style: TextStyle(fontSize: 8,fontWeight: FontWeight.w500,color: Constants.themeSubheadingGrey))
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Timings",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Constants.themeBlue)),
                                SizedBox(height:2),
                                Text("Mon-Fri  11am-6pm",style: TextStyle(fontSize: 8,fontWeight: FontWeight.w500,color: Constants.themeSubheadingGrey)),
                                SizedBox(height:2),
                                Text("Sat-Sun  11am-3pm",style: TextStyle(fontSize: 8,fontWeight: FontWeight.w500,color: Constants.themeSubheadingGrey)),
                      
                              ],
                            )
                          ],
                        ),
                      )
                    ),
                    const SizedBox(height:25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Schedules",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Constants.themeSubheadingGrey)),
                          Row(
                            children: [
                              Text(currMonth,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color:Constants.textRed,)),
                              const SizedBox(width:8),
                              const Icon(Icons.arrow_forward_ios,color:Constants.textRed,size: 12,)
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height:10),
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: const BoxDecoration(
                            color:Constants.themeLightRed,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: DatePicker(
                            DateTime.now(),
                            height:width/5,
                            width:width/5-10,
                            initialSelectedDate: DateTime.now(),
                            selectionColor: Constants.themeBlue,
                            selectedTextColor: Colors.white,
                            dayTextStyle: const TextStyle(fontSize: 12),
                            dateTextStyle: const TextStyle(fontSize: 12),
                            monthTextStyle: const TextStyle(fontSize:0,color: Constants.themeLightBlue),
                            deactivatedColor:Constants.themeGrey,
                            onDateChange: (date){
                              print(getMonth(date));
                              setState(() {
                                currMonth=getMonth(date);
                              });
                            },
                          ),
                        ),
                        Positioned(
                          top: width/10-10,
                          left:10,
                          child: Container(
                            width: 20,
                            height:20,
                            decoration: const BoxDecoration(
                              color:Constants.themeLightRed,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            alignment: Alignment.center,
                            child: const Icon(Icons.arrow_back_ios,color: Constants.textRed,size:12),
                          )
                        ),
                        Positioned(
                          top: width/10-10,
                          right:10,
                          child: Container(
                            width: 20,
                            height:20,
                            decoration: const BoxDecoration(
                              color:Constants.themeLightRed,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            alignment: Alignment.center,
                            child: const Icon(Icons.arrow_forward_ios,color: Constants.textRed,size:12),
                          )
                        )
                      ],
                    ),
                    const SizedBox(height:25),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          Text("Visit Hours",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Constants.themeSubheadingGrey),),
                        ],
                      ),
                    ),
                    const SizedBox(height:10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child:TimePicker(),
                    ),
                    const SizedBox(height:10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Fees",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Constants.themeSubheadingGrey)),
                        ],
                      ),
                    ),
                    const SizedBox(height:10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child:Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text("Normal Appointment fees",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: Constants.themeSubheadingGrey)),
                              const SizedBox(width:20),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(text:"₹${widget.doctorsDetails['fee']}",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Constants.feeGreen)),
                                    const TextSpan(text:"+₹50 booking charge",style: TextStyle(fontSize: 8,fontWeight: FontWeight.w300,color: Constants.themeSubheadingGrey))
                                  ]
                                )
                              )
                            ],
                          ),
                          const SizedBox(height:10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text("Emergency Appointment fees",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: Constants.themeSubheadingGrey)),
                              const SizedBox(width:20),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(text:"₹${widget.doctorsDetails['fee']}",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Constants.textRed)),
                                    const TextSpan(text:"+₹50 booking charge",style: TextStyle(fontSize: 8,fontWeight: FontWeight.w300,color: Constants.themeSubheadingGrey))
                                  ]
                                )
                              )
                            ],
                          ),     
                        ],
                      )
                    ),
                    const SizedBox(height:40),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap:(){
                              Navigator.push(
                                context, MaterialPageRoute(
                                  builder: ((context) => const AppointmentFormPage())
                                )
                              );
                            }, 
                            child: Container(
                              width:double.infinity,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              margin: const EdgeInsets.symmetric(horizontal: 32),
                              decoration: const BoxDecoration(
                                color:Constants.textRed,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child:const Text("Book Emergency Appointment",style:TextStyle(fontSize:13,fontWeight: FontWeight.w500,color: Colors.white))
                            ),
                          )
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32,vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color:Constants.themeGrey,
                            ),
                          ),
                          Text(" or ",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Constants.themeSubheadingGrey),),
                          Expanded(
                            child: Divider(
                              color:Constants.themeGrey,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap:(){
                              Navigator.push(
                                context, MaterialPageRoute(
                                  builder: ((context) => const AppointmentFormPage())
                                )
                              );
                            },
                            child: Container(
                              width:double.infinity,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              margin: const EdgeInsets.symmetric(horizontal: 32),
                              decoration: const BoxDecoration(
                                color:Constants.feeGreen,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child:const Text("Book Normal Appointment",style:TextStyle(fontSize:13,fontWeight: FontWeight.w500,color: Colors.white))
                            ),
                          )
                        )
                      ],
                    ),
                    const SizedBox(height:50)
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}