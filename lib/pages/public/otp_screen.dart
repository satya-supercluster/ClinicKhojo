import 'dart:async';

import 'package:clinic_khojo/pages/private/navigation.dart';
import 'package:clinic_khojo/pages/public/login_screen.dart';
import 'package:clinic_khojo/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  final String phoneNumber;
  const OtpPage({
    super.key,
    required this.phoneNumber
  });

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  bool isLoading = false;
  String otpE = '';
  int _timeLeftInSeconds = 90; // 1.5 minutes in seconds
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  String formatTime(int timeInSeconds) {
    int minutes = timeInSeconds ~/ 60;
    int seconds = timeInSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      setState(() {
        if (_timeLeftInSeconds > 0) {
          _timeLeftInSeconds--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  void stopTimer() {
    _timer?.cancel();
    if(_timeLeftInSeconds <100){
      _timeLeftInSeconds = 90;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;    // Gives the width
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          height: height,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(color: Color(0xFF0529BB)),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: width * 0.5,
                            height: width * 0.307,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/appLogo1.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: height*0.015,
                          right: width * 0.26,
                          child: Container(
                            width: width * 0.03,
                            height: width * 0.03, // Adjust the size as needed
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/image8.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height:50),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(fontSize:14,fontWeight:FontWeight.w400,color:Colors.white),
                                children:[
                                  TextSpan(text: 'Please enter the verification code we\'ve sent you on +91 '+widget.phoneNumber+". ", style:TextStyle(fontSize:15,fontWeight:FontWeight.w400,color:Colors.white)),
                                  TextSpan(text: "Edit",style:TextStyle(fontSize:15,fontWeight:FontWeight.w400,color:Colors.white,decoration:TextDecoration.underline,decorationColor:Colors.white),
                                  recognizer: TapGestureRecognizer() ..onTap=(){
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(phoneNumber: widget.phoneNumber),
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding:EdgeInsets.fromLTRB(20, 15, 20, 0), 
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Pinput(
                              length: 6,
                              showCursor: true,
                              // controller: otpbox,
                              androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                              defaultPinTheme: PinTheme(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: const Color(0xffFFFFFF),
                                  ),
                                  color: Colors.white
                                ),
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF0529BB)),
                              ),
                              onCompleted: (value) {
                                setState(() {
                                  otpE = value;
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Trying to capture",style:TextStyle(fontSize:10,fontWeight:FontWeight.w500,color:Colors.white)),
                          Text(
                            formatTime(_timeLeftInSeconds),
                            style:TextStyle(fontSize:10,fontWeight:FontWeight.w500,color:Colors.white)
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height:50),
                    Container(
                      width: width,
                      height:50,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(isLoading
                              ? Colors.grey // Use a disabled color when button is disabled or loading
                              : Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(27),
                              side: const BorderSide(color: Color(0xFF0529BB)),
                            ),
                            
                          ),
                          shadowColor: MaterialStateProperty.all<Color>(Constants.textRed),
                        ),
                        // onPressed: isLoading ? null : () async {
                        //   if (otpE.length == 6) {
                        //     isLoading=true;
                        //     // _verifyOTP(otpE);
                        //   }
                        //   },
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => NavigationPage()));
                        },
                        child: isLoading
                            ? CircularProgressIndicator() // Show loader when loading
                            : Text(
                          isLoading ? 'Verifying...' : 'Login' ,
                          style: TextStyle(color:Constants.textRed, fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'An ISO 9001:2015 Certified Company',
                      style:TextStyle(fontSize:10,fontWeight:FontWeight.w400,color:Colors.white)
                    ),
                    SizedBox(height:5),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Powered by',
                            style:TextStyle(fontSize:12,fontWeight:FontWeight.w400,color:Colors.white)
                          ),
                          SizedBox(width: 5), // Adjust the spacing between text and image
                          Image.asset(
                            "assets/icon1.png",
                            width: 20, // Adjust the width of the image
                            height: 20, // Adjust the height of the image
                          ),
                          SizedBox(width: 5), // Adjust the spacing between image and text
                          Text(
                            'ZORWAY',
                            style:TextStyle(fontSize:12,fontWeight:FontWeight.w400,color:Colors.white)
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}