import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_india_mall_app/data/provider/particularProductController.dart';
import 'package:new_india_mall_app/screen/home/home.page.dart';

class ParticularSearchPage extends ConsumerStatefulWidget {
  final String id;
  const ParticularSearchPage({super.key, required this.id});

  @override
  ConsumerState<ParticularSearchPage> createState() =>
      _ParticularSearchPageState();
}

class _ParticularSearchPageState extends ConsumerState<ParticularSearchPage> {
  int tab = 0;
  int count = 1;

  bool isFavorite = false;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final particularProvider = ref.watch(particularProductsProvider(widget.id));
    return Scaffold(
      body: particularProvider.when(
        data: (particular) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Row(
                  children: [
                    SizedBox(width: 20.w),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
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
                    SizedBox(width: 8.w),
                    Text(
                      "Product Details",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 20.sp,
                        color: Color.fromARGB(255, 16, 27, 1),
                      ),
                    ),
                    // Spacer(),
                    // Container(
                    //   width: 44.w,
                    //   height: 44.h,
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     color: Color.fromARGB(255, 255, 255, 255),
                    //     border: Border.all(
                    //       color: Color.fromARGB(25, 0, 0, 0),
                    //       width: 1.w,
                    //     ),
                    //   ),
                    //   child: Center(
                    //     child: Icon(
                    //       Icons.favorite_border,
                    //       color: Color.fromARGB(255, 16, 27, 1),
                    //       size: 20.sp,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(width: 6.w),
                    // Container(
                    //   width: 44.w,
                    //   height: 44.h,
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     color: Color.fromARGB(255, 255, 255, 255),
                    //     border: Border.all(
                    //       color: Color.fromARGB(25, 0, 0, 0),
                    //       width: 1.w,
                    //     ),
                    //   ),
                    //   child: Center(
                    //     child: Icon(
                    //       Icons.share_outlined,
                    //       color: Color.fromARGB(255, 16, 27, 1),
                    //       size: 20.sp,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(width: 20.w),
                  ],
                ),
                SizedBox(height: 22.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.network(
                          //"assets/detailslip.png",
                          particular.imageUrl,
                          // width: 400.w,
                          // height: 300.h,
                          // fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
                SizedBox(height: 26.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Text(
                    //"Huda Professional Set of 4 Liquid Matte Mini Red Lipsticks (Red Edition) – Long Lasting & Waterproof Combo Pack Of Red, Deep Red, Wine and Pink Shades | For women",
                    particular.name,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: Color.fromARGB(255, 16, 27, 1),
                      letterSpacing: -1.1,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    // "\$450.00",
                    particular.regularPrice,
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF961C82),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select quantity",
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 102, 102, 10),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(color: Colors.grey, width: 1.w),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 20.w),
                            GestureDetector(
                              onTap: () {
                                decrement();
                              },
                              child: Text(
                                "-",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(180, 0, 0, 0),
                                  fontSize: 25.sp,
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              // "0",
                              count.toString(),
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(180, 0, 0, 0),
                                fontSize: 20.sp,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                increment();
                              },
                              child: Text(
                                "+",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(180, 0, 0, 0),
                                  fontSize: 25.sp,
                                ),
                              ),
                            ),
                            SizedBox(width: 20.w),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Divider(
                  color: Color.fromARGB(25, 0, 0, 0),
                  indent: 20.w,
                  endIndent: 20.w,
                  thickness: 1,
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  child: Html(data: particular.description),
                  // child: Text(
                  //   "12 Shades-Effortless Blending: This palette offers 12 beautiful, versatile shades from Light to Dark, suitable for all Indian skin tones, and is easy to blend for a flawless finish.",
                  //   style: GoogleFonts.inter(
                  //     fontSize: 13.sp,
                  //     fontWeight: FontWeight.w400,
                  //     color: Color(0xFF666666),
                  //     letterSpacing: -1,
                  //   ),
                  // ),
                ),
                SizedBox(height: 30.h),
                Divider(
                  color: Color.fromARGB(25, 0, 0, 0),
                  indent: 20.w,
                  endIndent: 20.w,
                  thickness: 1,
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    SizedBox(width: 20.w),
                    Text(
                      "Reviews",
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 16, 27, 1),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 75.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: Color.fromARGB(25, 150, 28, 130),
                      ),
                      child: Center(
                        child: Text(
                          "View All",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                            color: Color(0xFF961C82),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(color: Colors.grey, width: 1.w),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15.w,
                            right: 15.w,
                            top: 15.h,
                          ),
                          child: Text(
                            "absolutely love the 12 Shades-Effortless Blending palette! The range of shades is perfect for my Indian skin tone, and the formula blends seamlessly for a natural look. It feels so light on my skin, yet provides amazing coverage for blemishes and dark circles. Plus, it lasts all day without any heaviness. Whether I m going to a wedding or just out with friends, this palette is my go-to!",
                            style: GoogleFonts.inter(
                              letterSpacing: -0.1,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 102, 102, 102),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15.w,
                            right: 15.w,
                            top: 15.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Emily Chelan",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                  // color: textColor,
                                ),
                              ),
                              Text(
                                "26 jan 2025",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                  color: Color.fromARGB(255, 102, 102, 102),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Divider(
                  color: Color.fromARGB(25, 0, 0, 0),
                  // indent: 20.w,
                  // endIndent: 20.w,
                  thickness: 1,
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    SizedBox(width: 20.w),
                    Text(
                      "Related Products",
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 16, 27, 1),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 75.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: Color.fromARGB(25, 150, 28, 130),
                      ),
                      child: Center(
                        child: Text(
                          "View All",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                            color: Color(0xFF961C82),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
                SizedBox(height: 20.w),
                DealsBody(showDiscount: true),
                SizedBox(height: 100.h),
              ],
            ),
          );
        },
        error: (error, stackTrace) => Center(child: Text(e.toString())),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 74.h,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color.fromARGB(25, 0, 0, 0))),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child: Container(
                  width: 46.w,
                  height: 46.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Color(0xFF961C82), width: 1.w),
                  ),
                  child: Center(
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Color(0xFF961C82),
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Container(
                width: 167.w,
                height: 46.h,
                decoration: BoxDecoration(
                  color: Color.fromARGB(25, 150, 28, 130),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Center(
                  child: Text(
                    "Buy Now",
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF961C82),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: GestureDetector(
                  onTap: () async {},
                  child: Container(
                    height: 46.h,
                    decoration: BoxDecoration(
                      color: Color(0xFF961C82),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Center(
                      child: Text(
                        "Add to cart",
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
