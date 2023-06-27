import 'package:fixia_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constants/app_color.dart';
import '../../constants/image_path.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController? _email;
  TextEditingController? _password;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  var _isLogin = true;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "");
    _password = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    final auhtProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
        key: _key,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
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
                height: 40,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: _isLogin
                      ? Text(
                          'Login to your account',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: AppColor.blueTextColor,
                              fontWeight: FontWeight.w600),
                        )
                      : Text(
                          'Create a your account',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: AppColor.blueTextColor,
                              fontWeight: FontWeight.w600),
                        ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                          labelText: 'Email',
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
                      controller: _password,
                      decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.remove_red_eye_rounded),
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
                ),
              ),
              _isLogin
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forget Password?',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: AppColor.blueTextColor,
                              ),
                            )),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 8,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Confirm Password',
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
                    ),
              const SizedBox(height: 36),
              InkWell(
                onTap: () {
                  _isLogin
                      ? auhtProvider.loginUser(context,
                          logEmail: _email?.text, logPassword: _password?.text)
                      : auhtProvider.createUser(context,
                          emailAddress: _email?.text,
                          password: _password?.text);

                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: Container(
                  height: 50,
                  width: 290,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.SecondaryColor),
                  child: Center(
                    child: Text(
                      _isLogin ? 'Login' : 'Signup',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: AppColor.appBarColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'or',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Continue with',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // auhtProvider.signInWithGoogle(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 15,
                      child: Image.asset(
                        ImagePath.googlePic,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 17,
                    child: Image.asset(
                      ImagePath.facebookPic,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              InkWell(
                child: Text(
                    _isLogin ? "Create an account" : 'Already have an account'),
                onTap: () {
                  setState(() {
                    _isLogin = !_isLogin;
                  });
                },
              )
            ],
          ),
        ));
  }
}
