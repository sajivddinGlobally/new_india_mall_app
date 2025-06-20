import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_india_mall_app/data/provider/allproductsController.dart';
import 'package:new_india_mall_app/data/provider/categoryController.dart';
import 'package:new_india_mall_app/data/provider/productByCategController.dart';
import 'package:new_india_mall_app/screen/particular.search.page.dart';

class CategoryPage extends ConsumerStatefulWidget {
  const CategoryPage({super.key});

  @override
  ConsumerState<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage> {
  List<Map<String, String>> categoryList = [
    {"imageUrl": "assets/glass.png"},
    {"imageUrl": "assets/red.png"},
    {"imageUrl": "assets/makup.png"},
    {"imageUrl": "assets/makup4.png"},
    {"imageUrl": "assets/box.png"},
    {"imageUrl": "assets/ed.png"},
    {"imageUrl": "assets/box1.png"},
    {"imageUrl": "assets/cream.png"},
  ];

  String categoryId = "15";
  @override
  Widget build(BuildContext context) {
    //final getAllProvider = ref.watch(allProductProvider);
    final categoryprovider = ref.watch(categoryProvider);
    final productByController = ref.watch(productByCateProvider(categoryId));
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Row(
              children: [
                SizedBox(width: 20.w),
                Text(
                  "Categories ",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                    color: Color.fromARGB(255, 16, 27, 1),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {},
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
                      child: Icon(
                        Icons.favorite_border,
                        color: Color.fromARGB(255, 16, 27, 1),
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
              ],
            ),
            SizedBox(height: 16.h),
            Divider(color: Color.fromARGB(25, 0, 0, 0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                categoryprovider.when(
                  data: (category) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 40.h),
                      height: MediaQuery.of(context).size.height / 1.26,
                      width: 113.w,
                      // color: Colors.yellow,
                      child: SingleChildScrollView(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  categoryId = category[index].id.toString();
                                });
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 113.w,
                                    height: 110.h,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(0, 150, 28, 130),
                                          Color.fromARGB(102, 150, 28, 130),
                                        ],
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          // "assets/homekitchen.png",
                                          category[index].imageUrl ??
                                              "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg",
                                          width: 50.w,
                                          height: 50.h,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(height: 6.h),
                                        Text(
                                          textAlign: TextAlign.center,
                                          // "Home &\nKitchen",
                                          category[index].name,
                                          style: GoogleFonts.inter(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromARGB(
                                              255,
                                              102,
                                              102,
                                              102,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 1.h,
                                    decoration: BoxDecoration(
                                      color: Colors.black38,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  error: (error, stackTrace) =>
                      Center(child: Text(error.toString())),
                  loading: () => Center(child: CircularProgressIndicator()),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: 2.w,
                  decoration: BoxDecoration(color: Color.fromARGB(25, 0, 0, 0)),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 10.w,
                      left: 10.w,
                      bottom: 10.h,
                    ),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 25.h),
                      height: MediaQuery.of(context).size.height / 1.272,
                      // width: 300.w,
                      // color: Colors.amber,
                      child: productByController.when(
                        data: (products) {
                          return SingleChildScrollView(
                            child: GridView.builder(
                              padding: EdgeInsets.zero, // 👈 Yeh line add karo
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 10,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10.w,
                                    mainAxisSpacing: 10.h,
                                    childAspectRatio: 0.60,
                                  ),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) =>
                                            ParticularSearchPage(
                                              id: products[index].id.toString(),
                                            ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                        child: Image.network(
                                          //"assets/pieces.png",
                                          products[index].image,
                                          width: 144.w,
                                          height: 160.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Row(
                                        children: [
                                          Container(
                                            width: 40.w,
                                            height: 20.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.r),
                                              color: Color(0xFF961C82),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.white,
                                                  size: 15.sp,
                                                ),
                                                Text(
                                                  "4.5",
                                                  style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10.sp,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 5.w),
                                          Text(
                                            "(512 reviews)",
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10.sp,
                                              color: Color.fromARGB(
                                                255,
                                                102,
                                                102,
                                                102,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.h),
                                      SizedBox(
                                        width: 140.w,
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          //"5 in 1 Lipstick Red Edition &...",
                                          products[index].name,
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                            color: Color.fromARGB(
                                              255,
                                              102,
                                              102,
                                              102,
                                            ),
                                            letterSpacing: -0.80,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        //"\$450.00",
                                        products[index].regularPrice,
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF961C82),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        error: (error, stackTrace) =>
                            Center(child: Text(error.toString())),
                        loading: () =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
