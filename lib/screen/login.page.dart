import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_india_mall_app/screen/register.page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSecure = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.only(left: 20.w),
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 255, 255, 255),
              border: Border.all(
                color: Color.fromARGB(25, 0, 0, 0),
                width: 1.w,
              ),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromARGB(255, 16, 27, 1),
                  size: 20.sp,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          "Login Your Account",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 20.sp,
            color: Color.fromARGB(255, 16, 27, 1),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Image.asset(
                      "assets/detailslip.png",
                      height: 260.h,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                          color: Color.fromARGB(255, 16, 27, 1),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 8.h,
                            right: 20.w,
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            size: 20.sp,
                            color: Color.fromARGB(255, 153, 153, 153),
                          ),
                          hintText: "Enter Your Email",
                          hintStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Color.fromARGB(255, 153, 153, 153),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                            borderSide: BorderSide(
                              color: Color.fromARGB(25, 0, 0, 0),
                              width: 1.w,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                            borderSide: BorderSide(
                              color: Color.fromARGB(25, 0, 0, 0),
                              width: 1.w,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "Password",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                          color: Color.fromARGB(255, 16, 27, 1),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextField(
                        controller: passwordController,
                        obscureText: isSecure == true ? isSecure : false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 8.h,
                            right: 20.w,
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 20.sp,
                            color: Color.fromARGB(255, 153, 153, 153),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isSecure = !isSecure;
                              });
                            },
                            child: isSecure == true
                                ? Icon(
                                    Icons.visibility_off,
                                    size: 20.sp,
                                    color: Color.fromARGB(255, 153, 153, 153),
                                  )
                                : Icon(
                                    Icons.visibility,
                                    size: 20.sp,
                                    color: Color.fromARGB(255, 153, 153, 153),
                                  ),
                          ),
                          hintText: "Password",
                          hintStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Color.fromARGB(255, 153, 153, 153),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                            borderSide: BorderSide(
                              color: Color.fromARGB(25, 0, 0, 0),
                              width: 1.w,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                            borderSide: BorderSide(
                              color: Color.fromARGB(25, 0, 0, 0),
                              width: 1.w,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                            MediaQuery.of(context).size.width,
                            46.h,
                          ),
                          backgroundColor: Color(0xFF961C82),
                        ),
                        onPressed: () async {},
                        child: isLogin == false
                            ? Text(
                                "Login",
                                style: GoogleFonts.inter(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              )
                            : CircularProgressIndicator(color: Colors.white),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp,
                              color: Color.fromARGB(255, 16, 27, 1),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => RegisterPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign In",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color: Color(0xFF961C82),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
