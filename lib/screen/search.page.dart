import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_india_mall_app/data/provider/allproductsController.dart';
import 'package:new_india_mall_app/data/provider/searchTxtController.dart';
import 'package:new_india_mall_app/screen/particular.search.page.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  bool isSearching = false;
  final searchController = TextEditingController();
  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    final getAllProvider = ref.watch(allProductProvider);
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30.h),
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
                if (!isSearching)
                  Text(
                    "Deal of the day",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp,
                      color: Color.fromARGB(255, 16, 27, 1),
                    ),
                  )
                else
                  SizedBox(
                    height: 50.h,
                    width: 300.w,
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        ref.read(searchTxtProvider.notifier).state = value;
                        searchQuery = value;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8.h, right: 20.w),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20.sp,
                          color: Color.fromARGB(255, 153, 153, 153),
                        ),
                        hintText: "Search Anything",
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
                  ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSearching = !isSearching;
                      if (!isSearching) {
                        searchController.clear();
                      }
                    });
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
                      child: Icon(
                        isSearching ? Icons.close : Icons.search,
                        color: Color.fromARGB(255, 16, 27, 1),
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
              ],
            ),
            getAllProvider.when(
              data: (products) {
                final searchText = ref.watch(searchTxtProvider);
                final fileterProducts = products
                    .where(
                      (element) => element.name.toLowerCase().contains(
                        searchText.toLowerCase(),
                      ),
                    )
                    .toList();
                if (fileterProducts.isNotEmpty) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      top: 20.h,
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: GridView.builder(
                        padding: EdgeInsets.only(bottom: 120.h),
                        // shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: fileterProducts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15.w,
                          mainAxisSpacing: 10.h,
                          childAspectRatio: 0.60,
                        ),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                              ParticularSearchPage(
                                                id: products[index].id
                                                    .toString(),
                                              ),
                                        ),
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.r),
                                      child: Image.network(
                                        //"assets/lipistic.png",
                                        // products[index].imageUrl,
                                        fileterProducts[index].imageUrl,
                                        width: 195.w,
                                        height: 238.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                                  // Positioned(
                                  //   top: 19.h,
                                  //   child: Image.asset(
                                  //     // "assets/of.png"
                                  //     searchList[index]['ofImage'].toString(),
                                  //   ),
                                  // ),
                                  // Positioned(
                                  //   top: 20.h,
                                  //   left: 15.w,
                                  //   child: Column(
                                  //     crossAxisAlignment:
                                  //         CrossAxisAlignment.start,
                                  //     children: [
                                  //       Text(
                                  //         // "20%",
                                  //         searchList[index]['text'].toString(),
                                  //         style: GoogleFonts.inter(
                                  //           fontWeight: FontWeight.w600,
                                  //           fontSize: 18.sp,
                                  //           color: Colors.white,
                                  //         ),
                                  //       ),
                                  //       Text(
                                  //         // "OFF",
                                  //         searchList[index]['offtext'].toString(),
                                  //         style: GoogleFonts.inter(
                                  //           fontWeight: FontWeight.w400,
                                  //           fontSize: 15.sp,
                                  //           color: Colors.white,
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                              SizedBox(height: 15.h),
                              Row(
                                children: [
                                  Container(
                                    width: 40.w,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.r),
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

                                          //searchList[index]['rating'].toString(),
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

                                    // searchList[index]['review'].toString(),
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp,
                                      color: Color.fromARGB(255, 102, 102, 102),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              SizedBox(
                                width: 159.w,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  //"5 in 1 Lipstick Red Edition & Nud",
                                  //products[index].name,
                                  fileterProducts[index].name,
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: Color.fromARGB(255, 102, 102, 102),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                //"\$450.00",
                                // products[index].regularPrice,
                                fileterProducts[index].regularPrice,
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF961C82),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: Center(
                      child: Text(
                        "No Data found",
                        style: GoogleFonts.inter(fontSize: 18.sp),
                      ),
                    ),
                  );
                }
              },
              error: (error, stackTrace) => SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(child: CircularProgressIndicator()),
              ),
              loading: () => Center(child: CircularProgressIndicator()),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
