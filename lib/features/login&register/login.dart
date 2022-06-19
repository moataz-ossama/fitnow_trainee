import 'package:conditional_builder/conditional_builder.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fitnow_trainee/controller/cubit/login_controller/cubit.dart';
import 'package:fitnow_trainee/features/login&register/register.dart';
import 'package:fitnow_trainee/layout/home_layout.dart';
import 'package:fitnow_trainee/main.dart';
import 'package:fitnow_trainee/shared/project_colors/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import '../../controller/cubit/login_controller/states.dart';
import '../../shared/project_colors/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  final Color facebookColor = const Color(0xff39579A);
  final Color googleColor = const Color(0xffDF4A32);
  var passwordController = TextEditingController();
  bool _validate = false;
  static String token = "";
  bool ispassword = true;
  Icon passwordshown = Icon(Icons.visibility_off_outlined);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Logincubit(),
      child: BlocConsumer<Logincubit, Loginstates>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Login Screen",
              style: TextStyle(color: ProjectColors.green_color),
            ),
            centerTitle: true,
            backgroundColor: Colors.grey[200],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, bottom: 20, top: 120),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        children: [
                          SvgPicture.asset("assets/images/Asset1.svg",
                              height: 100, width: 100),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            "LogIn",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text("Please enter your account email and pasword "),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (String value) {
                              print(value);
                            },
                            validator: (value) => validateEmail(value),
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              prefixIcon: Icon(
                                Icons.email,
                                color: ProjectColors.green_color,
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              int res = validatePassword(value.toString());
                              if (res == 1) {
                                return "Please enter password";
                              } else if (res == 2) {
                                return "Please enter minimum 6 characters";
                              } else {
                                return null;
                              }
                            },
                            obscureText: ispassword,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: ProjectColors.green_color,
                              ),
                              suffixIcon: IconButton(
                                icon: passwordshown,
                                onPressed: () {
                                  setState(() {
                                    ispassword = !ispassword;
                                    if (ispassword) {
                                      passwordshown =
                                          Icon(Icons.visibility_off_outlined);
                                    } else {
                                      passwordshown =
                                          Icon(Icons.visibility_outlined);
                                    }
                                  });
                                },
                                color: ProjectColors.green_color,
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ConditionalBuilder(
                            condition: state is! Loadingloginstate,
                            builder: (context) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: ProjectColors.green_color,
                                          border: Border.all(
                                              color: ProjectColors.green_color),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TextButton(
                                          onPressed: () {
                                            Logincubit.get(context).userlogin(
                                                emailController.text,
                                                passwordController.text);
                                          },
                                          child: Text(
                                            "Login",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ))),
                                ),
                              ],
                            ),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'don\'t have an account?',
                              ),
                              TextButton(
                                  onPressed: () {
                                    Get.to(RegisterTrainee());
                                  },
                                  child: Text(
                                    'Register Now',
                                    style: TextStyle(
                                        color: ProjectColors.green_color),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }, listener: (context, state) async {
        setState(()async {
          if (state is Successfulloginstate) {
            token = state.loginmodel.userData.access_token;
            if (state.loginmodel.status == "success") {
              print(state.loginmodel.status);
              SharedPreferences sharedpref =
                  await SharedPreferences.getInstance();
              sharedpref.setString(
                  'access_token', state.loginmodel.userData.access_token);
              Get.off(HomeLayout());
// Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeLayout()));

            }
          }
        });

      }),
    );
  }

  String validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Enter a valid email address';
    else
      return "";
  }

  int validatePassword(String pswd) {
    if (pswd.isEmpty || pswd.length == 0) {
      return 1;
    } else if (pswd != null && pswd.isNotEmpty && pswd.length <= 5) {
      return 2;
    } else {
      return 0;
    }
  }
}
