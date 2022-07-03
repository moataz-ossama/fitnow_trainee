// @dart=2.9
import 'dart:io';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:fitnow_trainee/controller/cubit/view_profile/view_profile_cubit.dart';
import 'package:fitnow_trainee/controller/cubit/view_profile/view_profile_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:fitnow_trainee/shared/project_colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/cubit/update_profile/update_profile_cubit.dart';
import '../../controller/cubit/update_profile/update_profile_model.dart';
import '../../controller/cubit/update_profile/update_profile_states.dart';
import 'settings.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

Future<UpdateProfileModel> postimage(String filename,@required String mobile,
    @required String country,
    @required String birthdate,
    @required String gender ) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = await prefs.getString('access_token');

  String bearerToken = "Bearer " + token;
var request = http.MultipartRequest('POST', Uri.parse('https://api.fitsnow.xyz/api/trainee/update'));
request.fields['mobile'] = mobile;
request.fields['country'] = country;
request.fields['birthdate'] = birthdate;
request.fields['gender'] = gender;

  Map<String, String> requestHeaders = {HttpHeaders.authorizationHeader: bearerToken};
  request.headers.addAll(requestHeaders);
  if(filename==""){
    request.fields['photo'] = ViewProfileCubit.model.data.traineeProfile.photo;
  }else{
    request.files.add(
        await http.MultipartFile.fromPath(
            'photo',
            filename
        )

    );
  }


var res = await request.send();
print(res.statusCode);
  print("this filename"+filename);

}

Future<UpdateProfileModel> postdata(
    @required String mobile,
    @required String country,
    @required String birthdate,
    @required String gender) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = await prefs.getString('access_token');

  String x = "Bearer " + token;
  var url = Uri.parse('https://api.fitsnow.xyz/api/trainee/update');
  var response = await http.post(url, body: {
    'mobile': mobile,
    'country': country,
    'birthdate': birthdate,
    'gender': gender
  }, headers: {
    HttpHeaders.authorizationHeader: x
  });

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

}

class _UpdateProfileState extends State<UpdateProfile> {
  DateTime date = DateTime(2022, 12, 4);


  var mobileController = TextEditingController();

  var countryController = "Egypt";
  var birthdateController = TextEditingController();
  Color malecolor = ProjectColors.dark_grey_color;
  Color femalecolor = ProjectColors.dark_grey_color;
  var gendercontroller =   ViewProfileCubit.model.data.traineeProfile.gender.toString();
  File image=null;
  final imagepicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Profile"),
        backgroundColor: ProjectColors.green_color,
      ),
      body: BlocProvider(
        create: (BuildContext context) => UpdateProfileCubit(),
        child: BlocConsumer<UpdateProfileCubit, UpdateProfileStates>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ProjectColors.white_color, width: 2),
                                  shape: BoxShape.rectangle),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: image==null?Image.network(
                                    "${ViewProfileCubit.model.data.traineeProfile.photo}"):Image.file(image),
                              ),
                              height: 150,
                              width: 120,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  pickimage();
                                  print("image path=" + image.toString());
                                },
                                child: Text(
                                  "choose an image",
                                  style: TextStyle(
                                      color: ProjectColors.green_color),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Change Mobile Number"),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: mobileController,
                          keyboardType: TextInputType.number,
                          onFieldSubmitted: (String value) {
                            print(value);
                          },
                          decoration: InputDecoration(
                            labelText: ViewProfileCubit.model.data.traineeProfile.mobile.toString()==null? "no mobile number": ViewProfileCubit.model.data.traineeProfile.mobile.toString(),
                            prefixIcon: Icon(
                              Icons.phone,
                            ),
                            contentPadding:
                                EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text("Change Country"),
                        SizedBox(
                          height: 5,
                        ),
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
                                    countryController=code.name.toString();

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
                          height: 40,
                        ),
                        Text("Change Birthdate"),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            TextButton(
                                onPressed: () async {
                                  DateTime newdate = await showDatePicker(
                                      context: context,
                                      initialDate: date,
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime(2023));
                                  if (newdate == null) {
                                    return;
                                  } else {
                                    setState(() {
                                      date = newdate;
                                    });
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 300,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ProjectColors.green_color)),
                                        child: Center(child: Text(
                                           ViewProfileCubit.model.data.traineeProfile.birthdate==null?"no specified birthdate":  ViewProfileCubit.model.data.traineeProfile.birthdate))),
                                  ],
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 40,
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
                                          color:gendercontroller=="1"?ProjectColors.green_color:malecolor,
                                          border: Border.all(color: malecolor)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  gendercontroller = "1";
                                                  malecolor =
                                                      ProjectColors.green_color;
                                                  femalecolor = ProjectColors
                                                      .dark_grey_color;
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
                                          color:gendercontroller=="2"?ProjectColors.green_color:femalecolor,
                                          border:
                                              Border.all(color: femalecolor)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  gendercontroller = "2";
                                                  femalecolor =
                                                      ProjectColors.green_color;
                                                  malecolor = ProjectColors
                                                      .dark_grey_color;
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
                        ConditionalBuilder(
                          condition: state is! LoadingUpdateProfileState,
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
                                        onPressed: () async {
                                          String datebirth =
                                              date.year.toString() +
                                                  "-" +
                                                  date.month.toString() +
                                                  "-" +
                                                  date.day.toString();
                                          UpdateProfileModel model =
                                              await postimage(
                                                image==null?"":image.path,
                                                  mobileController.text.isEmpty?ViewProfileCubit.model.data.traineeProfile.mobile.toString():mobileController.text,
                                                  countryController.isEmpty?ViewProfileCubit.model.data.traineeProfile.country.toString():   countryController,
                                                  datebirth,
                                                  gendercontroller);
                                          ViewProfileCubit p = new ViewProfileCubit();
                                          p.gettraineedata();
                                          Get.off(LogoutScreen());
                                          },
                                        child: Text(
                                          "Update Profile",
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
              );
            },
            listener: (context, state) {}),
      ),
    );
  }

  void pickimage() async {
    var pickedimage = await imagepicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedimage != null) {
        image = File(pickedimage.path);
        print("image path= "+image.path);
      } else {}
    });
  }
}
