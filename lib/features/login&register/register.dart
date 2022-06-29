// @dart=2.9
import 'package:conditional_builder/conditional_builder.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:fitnow_trainee/controller/cubit/register_controller/register_cubit.dart';
import 'package:fitnow_trainee/controller/cubit/register_controller/register_states.dart';
import 'package:fitnow_trainee/features/login&register/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../shared/project_colors/colors.dart';

class RegisterTrainee extends StatefulWidget {
  const RegisterTrainee({Key key}) : super(key: key);

  @override
  State<RegisterTrainee> createState() => _RegisterTraineeState();
}

class _RegisterTraineeState extends State<RegisterTrainee> {
  var emailController = TextEditingController();
   Color malecolor=ProjectColors.dark_grey_color;
   Color femalecolor = ProjectColors.dark_grey_color;
  var gendercontroller = "1";
  var passwordController = TextEditingController();
  var countrycontroller="Egypt" ;

  var namecontroller = TextEditingController();






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("register screen",style: TextStyle(color: ProjectColors.green_color),),
        centerTitle: true,
        backgroundColor:Colors.grey[200],
        foregroundColor: Colors.grey[400],
      ),
      body: BlocProvider(
        create: (BuildContext context) => Registercubit(),
        child: BlocConsumer<Registercubit, Registerstates>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: SingleChildScrollView(
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
                            "Register",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text("Please Register your account "),
                          SizedBox(
                            height: 50.0,
                          ),
                          TextFormField(
                            validator: (value) => validateEmail(value),
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (String value) {
                              print(value);
                            },
                            onChanged: (String value) {
                              print(value);
                            },
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              prefixIcon: Icon(
                                Icons.email,
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
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
                            onFieldSubmitted: (String value) {
                              print(value);
                            },
                            onChanged: (String value) {
                              print(value);
                            },
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock,
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                              validator: (value) => validaterequiredfields(value),
                            controller: namecontroller,
                            keyboardType: TextInputType.text,
                            onFieldSubmitted: (String value) {
                              print(value);
                            },
                            onChanged: (String value) {
                              print(value);
                            },
                            decoration: InputDecoration(
                                labelText: 'Full Name',
                                contentPadding:
                                    EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),

                                prefixIcon: Icon(Icons.person)),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),

                          SizedBox(height: 15,),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey[500])),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text("Choose Your Country"),
                                SizedBox(width: 10,),
                                CountryListPick(
                                    appBar: AppBar(
                                      backgroundColor: ProjectColors.green_color,
                                      title: Text('Choose A country'),
                                    ),
                                    // To disable option set to false
                                    theme: CountryTheme(
                                      isShowFlag: true,
                                      isShowTitle: true,
                                      isShowCode: false,
                                      isDownIcon: true,
                                      showEnglishName: true,
                                    ),
                                    // Set default value
                                    initialSelection: '+20',
                                    onChanged:  (CountryCode code) {
                                    countrycontroller=code.name.toString();

                                    },
                                    // Whether to allow the widget to set a custom UI overlay
                                    useUiOverlay: true,
                                    // Whether the country list should be wrapped in a SafeArea
                                    useSafeArea: false
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: [
                              Text(
                                "Choose Your Gender",
                                style: TextStyle(),
                              ),
                              Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        decoration: BoxDecoration(
                                            color: malecolor,
                                            border: Border.all(
                                                color:
                                                   malecolor)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    gendercontroller="1";
                                                   malecolor=ProjectColors.green_color;
                                                    femalecolor=ProjectColors.dark_grey_color;
                                                  });

                                                  },
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Male",
                                                      style: TextStyle(
                                                          color: ProjectColors
                                                              .white_color),
                                                    ),
                                                    Icon(
                                                      Icons.male,
                                                      color: ProjectColors
                                                          .white_color,
                                                    )
                                                  ],
                                                ))
                                          ],
                                        ),
                                      )),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      Expanded(
                                          child: Container(
                                        decoration: BoxDecoration(
                                            color: femalecolor,
                                            border: Border.all(
                                                color:
                                                   femalecolor)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    gendercontroller="2";
                                                   femalecolor=ProjectColors.green_color;
                                                    malecolor=ProjectColors.dark_grey_color;
                                                  });


                                                  },
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Female",
                                                      style: TextStyle(
                                                          color: ProjectColors
                                                              .white_color),
                                                    ),
                                                    Icon(
                                                      Icons.female,
                                                      color: ProjectColors
                                                          .white_color,
                                                    )
                                                  ],
                                                ))
                                          ],
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ConditionalBuilder(
                            condition: state is! registerLoadingstate,
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

                                            Registercubit.get(context)
                                                .userregister(
                                              namecontroller.text,
                                              emailController.text,
                                              passwordController.text,
                                              gendercontroller.toString(),
                                              countrycontroller,
                                            );
                                          },
                                          child: Text(
                                            "register",
                                            style: TextStyle(color: Colors.white),
                                          ))),
                                ),
                              ],
                            ),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            listener: (context, state) {}),
      ),
    );
  }
  String validateEmail(String value) {
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
  String validaterequiredfields(String value) {

    if (value == null || value.isEmpty )
      return "it is a required field you can\'t leave it empty" ;
    else
      return "";
  }
}
