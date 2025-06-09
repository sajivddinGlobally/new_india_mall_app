import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_india_mall_app/data/provider/addressProvider.dart';

class AddresslistPage extends ConsumerStatefulWidget {
  const AddresslistPage({super.key});

  @override
  ConsumerState<AddresslistPage> createState() => _AddresslistPageState();
}

class _AddresslistPageState extends ConsumerState<AddresslistPage> {
  final addresses = [
    {
      'name': 'Rahul Sharma',
      'phone': '9876543210',
      'address':
          'Flat No. 201, Green Residency, Near HDFC Bank, MG Road, Bangalore - 560001',
      'type': 'Home',
    },
    {
      'name': 'Priya Patel',
      'phone': '9123456789',
      'address': 'Office 3rd Floor, Tech Park, Sector 44, Gurgaon - 122003',
      'type': 'Work',
    },
  ];
  @override
  Widget build(BuildContext context) {
    final addresslistData = ref.watch(addressProvider);
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: addresslistData.when(
        data: (address) {
          return Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Row(
                  children: [
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
                      "address list",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 20.sp,
                        color: Color.fromARGB(255, 16, 27, 1),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  margin: EdgeInsets.only(bottom: 16.h),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.h),
                        Text(
                          "Nick Jones ",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          // "Nick Jones ",
                          address.addresses.address683B202Aedfcb801257173.addressLine,
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          // "phalpura",
                          address.addresses.address683B202Aedfcb801257173.city,
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          // "phalpura",
                          address.addresses.address683B202Aedfcb801257173.state,
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          // "phalpura",
                          address.addresses.address683B202Aedfcb801257173.zipcode,
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
