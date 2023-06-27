import 'package:fixia_app/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  // final TextEditingController controller;
  // final String title;
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      child: Form(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Email/Number',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColor.blueTextColor,
                      width: 1,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColor.blueTextColor,
                      width: 1,
                    )),
                labelStyle: const TextStyle(
                  color: AppColor.SecondaryColor,
                )),
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            textCapitalization: TextCapitalization.none,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Password',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColor.blueTextColor,
                      width: 1,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColor.blueTextColor,
                      width: 1,
                    )),
                labelStyle: const TextStyle(
                  color: AppColor.SecondaryColor,
                )),
            obscureText: true,
            validator: (value) {
              if (value == null || value.trim().length < 8) {
                return 'Password must be at least 8 characters long';
              }
              return null;
            },
          ),
        ],
      )),
    );

    //  Padding(
    //   padding: const EdgeInsets.only(left: 20, right: 20),
    //   child: TextFormField(
    //     controller: controller,
    //     decoration: InputDecoration(
    //       enabledBorder: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(10),
    //           borderSide: const BorderSide(
    //             color: AppColor.blueTextColor,
    //             width: 1,
    //           )),
    //       focusedBorder: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(10),
    //           borderSide: const BorderSide(
    //             color: AppColor.blueTextColor,
    //             width: 1,
    //           )),
    //       labelStyle: GoogleFonts.poppins(
    //         color: Colors.grey,
    //       ),
    //       focusColor: Colors.grey,
    //       label: Text(title),
    //     ),
    //   ),
    // );
  }
}
