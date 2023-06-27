import 'package:fixia_app/constants/app_color.dart';
import 'package:fixia_app/constants/image_path.dart';
import 'package:fixia_app/providers/auth_provider.dart';
import 'package:fixia_app/widgets/custom_appbar.dart';
import 'package:fixia_app/widgets/service_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: CustomAppBar(),
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 36,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: Container(
                decoration: BoxDecoration(boxShadow: [
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
                child: TextField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      fillColor: AppColor.backgroundColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                      hintText: 'Search for services',
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                      prefixIconColor: Colors.black,
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 30,
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Catergory',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: AppColor.SecondaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      ServiceWidget(
                        image: ImagePath.plumber,
                        categoryName: 'Plumbing',
                      ),
                      ServiceWidget(
                        image: ImagePath.laundry,
                        categoryName: 'Laundry',
                      ),
                      ServiceWidget(
                        image: ImagePath.painting,
                        categoryName: 'Painting',
                      ),
                      ServiceWidget(
                        image: ImagePath.tool,
                        categoryName: 'Repair',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Catergory',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: AppColor.SecondaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      ServiceWidget(
                        image: ImagePath.plumber,
                        categoryName: 'Plumbing',
                      ),
                      ServiceWidget(
                        image: ImagePath.laundry,
                        categoryName: 'Laundry',
                      ),
                      ServiceWidget(
                        image: ImagePath.painting,
                        categoryName: 'Painting',
                      ),
                      ServiceWidget(
                        image: ImagePath.tool,
                        categoryName: 'Repair',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Catergory',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: AppColor.SecondaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      ServiceWidget(
                        image: ImagePath.plumber,
                        categoryName: 'Plumbing',
                      ),
                      ServiceWidget(
                        image: ImagePath.laundry,
                        categoryName: 'Laundry',
                      ),
                      ServiceWidget(
                        image: ImagePath.painting,
                        categoryName: 'Painting',
                      ),
                      ServiceWidget(
                        image: ImagePath.tool,
                        categoryName: 'Repair',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.SecondaryColor,
                ),
                onPressed: () {
                  final provider =
                      Provider.of<AuthProvider>(context, listen: false);
                  provider.signOutUSer(context);
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
