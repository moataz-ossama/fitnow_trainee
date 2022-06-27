// @dart=2.9
import 'dart:ffi';
import 'dart:io';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/cubit/apply_to_form/form_model.dart';
import '../../controller/cubit/view_profile/view_profile_cubit.dart';
import '../../shared/project_colors/colors.dart';
import '../login&register/settings.dart';

class ApplyToForm extends StatefulWidget {
  const ApplyToForm({Key key}) : super(key: key);

  @override
  State<ApplyToForm> createState() => _ApplyToFormState();
}

class _ApplyToFormState extends State<ApplyToForm> {
  Future<FormModel> postimage(
      String filename0,
      String filename1,
      String filename2,
      String filename3,
      @required String age,
      @required String height,
      @required String diseases,
      @required String weight,
      @required String training_time,
      @required String goal,
      @required String food_allergy,
      @required String use_supplements,
      @required String other) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString('access_token');
    String packageid = await prefs.getString('Package_id');
    print("packageid =" +packageid);
    String bearerToken = "Bearer " + token;
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://api.fitsnow.xyz/api/package-apply/add'));
    request.fields['package_id'] = packageid;
    request.fields['age'] = age;
    request.fields['height'] = height;
    request.fields['diseases'] = diseases;
    request.fields['weight'] = weight;
    request.fields['training_time'] = training_time;
    request.fields['goal'] = goal;
    request.fields['food_allergy'] = food_allergy;
    request.fields['use_supplements'] = use_supplements;
    request.fields['other'] = other;

    Map<String, String> requestHeaders = {
      HttpHeaders.authorizationHeader: bearerToken
    };
    request.headers.addAll(requestHeaders);
    if (filename0 == "") {
      request.fields['images[0]'] = "";
    } else {
      request.files
          .add(await http.MultipartFile.fromPath('images[0]', filename0));
    }
    if (filename1 == "") {
      request.fields['images[1]'] = "";
    } else {
      request.files
          .add(await http.MultipartFile.fromPath('images[1]', filename1));
    }
    if (filename2 == "") {
      request.fields['images[2]'] = "";
    } else {
      request.files
          .add(await http.MultipartFile.fromPath('images[2]', filename2));
    }
    if (filename3 == "") {
      request.fields['images[3]'] = "";
    } else {
      request.files
          .add(await http.MultipartFile.fromPath('images[3]', filename3));
    }

    var res = await request.send();
    print(res.statusCode);
  }

  File image0 = null;
  File image1 = null;

  File image2 = null;

  File image3 = null;
  Color yescolor = ProjectColors.dark_grey_color;
  Color nocolor = ProjectColors.dark_grey_color;
  bool usesupplementscontroller = false;
  var age = TextEditingController();
  var height = TextEditingController();
  var diseases = TextEditingController();
  var weight = TextEditingController();
  var training_time = TextEditingController();
  var goal = TextEditingController();
  var food_allergy = TextEditingController();
  var use_supplements = false;
  var other = TextEditingController();
  final imagepicker = ImagePicker();

  void pickimage() async {
    var pickedimage = await imagepicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedimage != null) {
        image0 = File(pickedimage.path);
        print("image path= " + image0.path);
      } else {
        image0 = null;
      }
    });
  }

  void pickimage1() async {
    var pickedimage = await imagepicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedimage != null) {
        image1 = File(pickedimage.path);
        print("image path= " + image1.path);
      } else {}
    });
  }

  void pickimage2() async {
    var pickedimage = await imagepicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedimage != null) {
        image2 = File(pickedimage.path);
        print("image path= " + image2.path);
      } else {}
    });
  }

  void pickimage3() async {
    var pickedimage = await imagepicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedimage != null) {
        image3 = File(pickedimage.path);
        print("image path= " + image3.path);
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Submit Form"),
        centerTitle: true,
        backgroundColor: ProjectColors.green_color,
      ),
      body: Container(
        child: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text("enter your age",style:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: age,
                    keyboardType: TextInputType.number,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(

                      contentPadding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text("Enter Your Height (in cm)",style:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: height,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(

                      contentPadding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text("Enter your weight (in kg)",style:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: weight,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(

                      contentPadding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text("Enter Any Diseases You Suffer From",style:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: diseases,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(

                      contentPadding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text("Enter your Estimated Training Time (in minutes) ",style:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: training_time,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(

                      contentPadding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text("Enter Your Goal",style:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: goal,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(

                      contentPadding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text("Enter Any Food Allegry You Suffer From",style:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: food_allergy,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(

                      contentPadding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text("Enter If You Can Use Any Supplements ",style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
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
                                color: yescolor,
                                border: Border.all(color: yescolor)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        usesupplementscontroller = true;
                                        yescolor = ProjectColors.green_color;
                                        nocolor = ProjectColors.dark_grey_color;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "Yes",
                                          style: TextStyle(
                                              color: ProjectColors.white_color),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.check_circle,
                                          color: ProjectColors.white_color,
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
                                color: nocolor,
                                border: Border.all(color: nocolor)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        usesupplementscontroller = false;
                                        nocolor=Colors.red;
                                        yescolor =
                                            ProjectColors.dark_grey_color;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "No",
                                          style: TextStyle(
                                              color: ProjectColors.white_color),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.cancel,
                                          color: ProjectColors.white_color,
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text("Enter Any Other Notes YouWant To Add" ,style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: other,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(

                      contentPadding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                      "choose images  (inbody,From Front Of Your Body,From Back Of Your Body,From The Side Of Your Body)",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: image0==null?Center(child: Text("no images selected")):Image.file(image0),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: ProjectColors.green_color)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            color: ProjectColors.green_color,
                            border:
                                Border.all(color: ProjectColors.green_color)),
                        child: TextButton(
                            onPressed: () {
                              pickimage();
                              print("image path=" + image0.toString());
                            },
                            child: Text(
                              "choose an image",
                              style:
                                  TextStyle(color: ProjectColors.white_color),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: image1==null?Center(child: Text("no images selected")):Image.file(image1),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: ProjectColors.green_color)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            color: ProjectColors.green_color,
                            border:
                            Border.all(color: ProjectColors.green_color)),
                        child: TextButton(
                            onPressed: () {
                              pickimage1();
                              print("image path=" + image1.toString());
                            },
                            child: Text(
                              "choose an image",
                              style:
                              TextStyle(color: ProjectColors.white_color),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: image2==null?Center(child: Text("no images selected")):Image.file(image2),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: ProjectColors.green_color)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            color: ProjectColors.green_color,
                            border:
                            Border.all(color: ProjectColors.green_color)),
                        child: TextButton(
                            onPressed: () {
                              pickimage2();
                              print("image path=" + image2.toString());
                            },
                            child: Text(
                              "choose an image",
                              style:
                              TextStyle(color: ProjectColors.white_color),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: image3==null?Center(child: Text("no images selected")):Image.file(image3),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: ProjectColors.green_color)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            color: ProjectColors.green_color,
                            border:
                            Border.all(color: ProjectColors.green_color)),
                        child: TextButton(
                            onPressed: () {
                              pickimage3();
                              print("image path=" + image3.toString());
                            },
                            child: Text(
                              "choose an image",
                              style:
                              TextStyle(color: ProjectColors.white_color),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: ProjectColors.green_color,
                                border: Border.all(
                                    color: ProjectColors.green_color),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextButton(
                                onPressed: () async {
                                  await postimage(
                                    image0 == null ? "" : image0.path,
                                    image1 == null ? "" : image1.path,
                                    image2 == null ? "" : image2.path,
                                    image3 == null ? "" : image3.path,
                                    age.text.isEmpty?"no specified data":age.text,
                                    height.text.isEmpty?"no specified data":height.text,
                                    diseases.text.isEmpty?"no specified data":diseases.text,
                                    weight.text.isEmpty?"no specified data":weight.text,
                                    training_time.text.isEmpty?"no specified data":training_time.text,
                                    goal.text.isEmpty?"no specified data":goal.text,
                                    food_allergy.text.isEmpty?"no specified data":food_allergy.text,
                                    use_supplements.toString(),
                                    other.text.isEmpty?"no specified data":other.text,
                                  );
                                  ViewProfileCubit p = new ViewProfileCubit();
                                  p.gettraineedata();

                                },
                                child: Text(
                                  "Update Profile",
                                  style: TextStyle(color: Colors.white),
                                ))),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
