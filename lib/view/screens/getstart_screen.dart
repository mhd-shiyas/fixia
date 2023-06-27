import 'package:fixia_app/constants/app_color.dart';
import 'package:fixia_app/constants/image_path.dart';
import 'package:fixia_app/view/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartScreen extends StatelessWidget {
  const GetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.appBarColor,
        body: Stack(children: [
          Container(
            width: double.infinity,
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 24),
                    height: 90,
                    width: 150,
                    color: AppColor.appBarColor,
                    child: Image.asset(
                      ImagePath.fixiaBlueLogo,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Your Home\nOur Periority',
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: AppColor.blueTextColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      'Bringing convenience and expertise\nto your doorstep ',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColor.blueTextColor,
                      ),
                    ),
                  ),
                ]),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: const BoxDecoration(
                  color: AppColor.SecondaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.elliptical(150, 100),
                    topLeft: Radius.elliptical(150, 100),
                  )),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            child: Container(
                height: 560,
                // width: double.infinity,
                child: Image.asset(
                  ImagePath.workerPic,
                  fit: BoxFit.cover,
                )),
          ),
          Positioned(
              bottom: 45,
              left: 80,
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AuthScreen())),
                child: Container(
                  width: 230,
                  height: 60,
                  decoration: BoxDecoration(
                      color: AppColor.getStartedButtonColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Get Started',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: AppColor.getStartedColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ))
        ]));
  }
}
