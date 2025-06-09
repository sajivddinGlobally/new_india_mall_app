import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_india_mall_app/screen/account/account.page.dart';
import 'package:new_india_mall_app/screen/cart/cart.page.dart';
import 'package:new_india_mall_app/screen/home/category.page.dart';
import 'package:new_india_mall_app/screen/particular.search.page.dart';
import 'package:new_india_mall_app/screen/search.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabBottom = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: tabBottom == 0
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h),
                  Row(
                    children: [
                      SizedBox(width: 20.w),
                      Container(
                        width: 44.w,
                        height: 44.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 217, 217, 217),
                        ),
                        child: Image.asset("assets/girl.png"),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: const Color.fromARGB(255, 16, 27, 1),
                            ),
                          ),
                          Text(
                            "Jaipur, 302033",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              color: const Color.fromARGB(255, 102, 102, 102),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        width: 44.w,
                        height: 44.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: const Color.fromARGB(25, 0, 0, 0),
                            width: 1.w,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.favorite_border,
                            color: const Color.fromARGB(255, 16, 27, 1),
                            size: 20.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SizedBox(
                      height: 50.h,
                      child: TextField(
                        readOnly: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const SearchPage(),
                            ),
                          );
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 8.h,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 20.sp,
                            color: const Color.fromARGB(255, 153, 153, 153),
                          ),
                          hintText: "Search Anything",
                          hintStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: const Color.fromARGB(255, 153, 153, 153),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(25, 0, 0, 0),
                              width: 1.w,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(25, 0, 0, 0),
                              width: 1.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    height: 77.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 244, 232, 243),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35.w),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.repeat,
                            color: Color.fromARGB(255, 150, 28, 130),
                          ),
                          SizedBox(width: 6.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "7 days",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: const Color.fromARGB(
                                    255,
                                    150,
                                    28,
                                    130,
                                  ),
                                ),
                              ),
                              Text(
                                "Easy Return",
                                style: GoogleFonts.inter(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(
                                    255,
                                    102,
                                    102,
                                    102,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          VerticalDivider(
                            color: Colors.grey,
                            indent: 15,
                            endIndent: 15,
                            width: 1.w,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.repeat,
                            color: Color.fromARGB(255, 150, 28, 130),
                          ),
                          SizedBox(width: 6.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "COD",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: const Color.fromARGB(
                                    255,
                                    150,
                                    28,
                                    130,
                                  ),
                                ),
                              ),
                              Text(
                                "Available",
                                style: GoogleFonts.inter(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(
                                    255,
                                    102,
                                    102,
                                    102,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          VerticalDivider(
                            color: Colors.grey,
                            indent: 15,
                            endIndent: 15,
                            width: 1.w,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.repeat,
                            color: Color.fromARGB(255, 150, 28, 130),
                          ),
                          SizedBox(width: 6.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Lowest",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: const Color.fromARGB(
                                    255,
                                    150,
                                    28,
                                    130,
                                  ),
                                ),
                              ),
                              Text(
                                "Price Item",
                                style: GoogleFonts.inter(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(
                                    255,
                                    102,
                                    102,
                                    102,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 100.h,
                    child: ListView.builder(
                      itemCount: 2,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Column(
                            children: [
                              Container(
                                width: 60.w,
                                height: 60.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 244, 232, 243),
                                ),
                                child: ClipOval(
                                  child: Image.network(
                                    "https://placehold.jp/3d4070/ffffff/150x150.png",
                                    width: 60.w,
                                    height: 60.h,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                              "assets/placeholder.png",
                                              width: 60.w,
                                              height: 60.h,
                                              fit: BoxFit.cover,
                                            ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.h),
                              SizedBox(
                                width: 75.w,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "categorydata[index].name",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: const Color.fromARGB(
                                      255,
                                      102,
                                      102,
                                      102,
                                    ),
                                    letterSpacing: -0.70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Deal of the day",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 20.sp,
                                color: const Color.fromARGB(255, 16, 27, 1),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Deals ends in ",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: const Color.fromARGB(
                                      255,
                                      102,
                                      102,
                                      102,
                                    ),
                                  ),
                                ),
                                Text(
                                  "- 04:45:00",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: Color(0xFF961C82),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          width: 75.w,
                          height: 36.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            color: const Color.fromARGB(25, 150, 28, 130),
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
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  DealsBody(showDiscount: true),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Image.asset("assets/shop.png"),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      SizedBox(width: 20.w),
                      Text(
                        "Product for you",
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromARGB(255, 16, 27, 1),
                          letterSpacing: -1,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 75.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: const Color.fromARGB(25, 150, 28, 130),
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
                      SizedBox(width: 40.w),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: GridViewBody(),
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 395.h,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 244, 231, 243),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 25.w,
                            right: 20.w,
                            top: 26.h,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Low Price Store",
                                style: GoogleFonts.inter(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(255, 16, 27, 1),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 75.w,
                                height: 36.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  color: const Color.fromARGB(25, 150, 28, 130),
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
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        DealsBody(showDiscount: false),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : tabBottom == 1
          ? const CategoryPage()
          : tabBottom == 2
          ? const CartPage()
          : const AccoountPage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            tabBottom = value;
          });
        },
        currentIndex: tabBottom,
        selectedItemColor: Color(0xFF961C82),
        selectedLabelStyle: GoogleFonts.inter(
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xFF961C82),
        ),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.layers_outlined),
            label: 'Category',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: 'Cart'),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity_sharp),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

class DealsBody extends StatefulWidget {
  final bool showDiscount;
  const DealsBody({super.key, required this.showDiscount});

  @override
  State<DealsBody> createState() => _DealsBodyState();
}

class _DealsBodyState extends State<DealsBody> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310.h,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ParticularSearchPage(),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.network(
                          "https://placehold.jp/3d4070/ffffff/150x150.png",
                          width: 166.w,
                          height: 200.h,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                                "assets/placeholder.png",
                                width: 166.w,
                                height: 200.h,
                                fit: BoxFit.cover,
                              ),
                        ),
                      ),
                      if (widget.showDiscount)
                        Positioned(
                          top: 10.h,
                          child: Image.asset(
                            "assets/of.png",
                            width: 60.w,
                            height: 60.h,
                          ),
                        ),
                      if (widget.showDiscount)
                        Positioned(
                          top: 20.h,
                          left: 10.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "20%",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "OFF",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.white, size: 15.sp),
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
                        "(15 reviews)",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp,
                          color: const Color.fromARGB(255, 102, 102, 102),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 159.w,
                    child: Text(
                      "5 in 1 Lipstick Red Edition & Nud...",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: const Color.fromARGB(255, 102, 102, 102),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "450.00",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF961C82),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class GridViewBody extends StatefulWidget {
  const GridViewBody({super.key});

  @override
  State<GridViewBody> createState() => _GridViewBodyState();
}

class _GridViewBodyState extends State<GridViewBody> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
              CupertinoPageRoute(builder: (context) => ParticularSearchPage()),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  "https://placehold.jp/3d4070/ffffff/150x150.png",
                  height: 235.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    "assets/placeholder.png",
                    height: 235.h,
                    fit: BoxFit.cover,
                  ),
                ),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.white, size: 15.sp),
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
                    "(12 reviews)",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                      color: const Color.fromARGB(255, 102, 102, 102),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: 159.w,
                child: Text(
                  "53 Pieces Cabana Tent Birthday Deco...",
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: const Color.fromARGB(255, 102, 102, 102),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                "\$450.00",
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
    );
  }
}
