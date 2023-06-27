import 'package:fixia_app/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceWidget extends StatelessWidget {
  final String image;
  final String categoryName;
  const ServiceWidget({
    super.key,
    required this.image,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 18),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
          color: AppColor.backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 0.0,
                blurRadius: 10,
                offset: const Offset(3.0, 3.0)),
            BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: 0.0,
                blurRadius: 10,
                offset: const Offset(3.0, 3.0)),
            const BoxShadow(
                color: Colors.white,
                spreadRadius: 2.0,
                blurRadius: 10,
                offset: Offset(-3.0, -3.0)),
            const BoxShadow(
                color: Colors.white,
                spreadRadius: 2.0,
                blurRadius: 10,
                offset: Offset(-3.0, -3.0)),
          ]),
      child: Column(
        children: [
          Container(
              height: 100,
              width: 100,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              )),
          Text(
            categoryName,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: AppColor.SecondaryColor,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
