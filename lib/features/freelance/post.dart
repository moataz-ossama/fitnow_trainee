import 'package:conditional_builder/conditional_builder.dart';
import 'package:fitnow_trainee/controller/cubit/news_feed_controller/News_feed_cubit.dart';
import 'package:fitnow_trainee/controller/cubit/news_feed_controller/news_feed_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/cubit/register_controller/register_states.dart';
import '../../shared/project_colors/colors.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  var formtitlecontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();
  var firstskillecontroller;

  var secondskillcontroller;
  var pricecontroller = TextEditingController();
  Color workoutcolor = ProjectColors.dark_grey_color;
  Color nuitrationcolor = ProjectColors.dark_grey_color;
  Color bothcolor = ProjectColors.dark_grey_color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post A Job",style: TextStyle(color: ProjectColors.white_color),),
        centerTitle: true,
        backgroundColor: ProjectColors.green_color,
      ),
      body: BlocProvider(
        create: (BuildContext context) => NewsFeedCubit(),
        child: BlocConsumer<NewsFeedCubit, NewsFeedStates>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                        "write your post title :",
                        style: TextStyle(
                            color: ProjectColors.green_color,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: formtitlecontroller,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (String value) {
                          print(value);
                        },
                        onChanged: (String value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Write Your Required Offer Description :",
                        style: TextStyle(
                            color: ProjectColors.green_color,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.grey[300],
                        width: double.infinity,
                        height: 160,
                        child: TextFormField(
                          maxLines: 7,
                          controller: descriptioncontroller,
                          keyboardType: TextInputType.text,
                          onFieldSubmitted: (String value) {
                            print(value);
                          },
                          onChanged: (String value) {
                            print(value);
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Choose your program",
                        style: TextStyle(
                            color: ProjectColors.green_color,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
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
                                    color: workoutcolor,
                                    border: Border.all(color: workoutcolor)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            firstskillecontroller = "workout";
                                            secondskillcontroller = "";
                                            workoutcolor =
                                                ProjectColors.green_color;
                                            nuitrationcolor =
                                                ProjectColors.dark_grey_color;
                                            bothcolor =
                                                ProjectColors.dark_grey_color;
                                          });
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Workout",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: ProjectColors
                                                      .white_color),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                              )),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                    color: nuitrationcolor,
                                    border: Border.all(color: nuitrationcolor)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            firstskillecontroller = "Nutrition";
                                            secondskillcontroller = "";
                                            nuitrationcolor =
                                                ProjectColors.green_color;
                                            workoutcolor =
                                                ProjectColors.dark_grey_color;
                                            bothcolor =
                                                ProjectColors.dark_grey_color;
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "Nuitration",
                                              style: TextStyle(
                                                  color: ProjectColors
                                                      .white_color),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              )),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                    color: bothcolor,
                                    border: Border.all(color: bothcolor)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            firstskillecontroller = "Workout";
                                            secondskillcontroller = "Nutrition";
                                            bothcolor =
                                                ProjectColors.green_color;
                                            nuitrationcolor =
                                                ProjectColors.dark_grey_color;
                                            workoutcolor =
                                                ProjectColors.dark_grey_color;
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "Both",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: ProjectColors
                                                      .white_color),
                                              maxLines: 2,
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              "enter your estimated price :",
                              style: TextStyle(
                                  color: ProjectColors.green_color,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: TextFormField(
                                controller: pricecontroller,
                                keyboardType: TextInputType.number,
                                onFieldSubmitted: (String value) {
                                  print(value);
                                },
                                onChanged: (String value) {
                                  print(value);
                                },
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      ConditionalBuilder(
                        condition: state is! registerLoadingstate,
                        builder: (context) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: ProjectColors.green_color,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Container(
                                    child: TextButton(
                                      onPressed: () {
                                        NewsFeedCubit.get(context).postoffer(
                                            formtitlecontroller.text,
                                            pricecontroller.text,
                                            descriptioncontroller.text,
                                            firstskillecontroller,
                                            secondskillcontroller);
                                      },
                                      child: Text(
                                        "Post",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ProjectColors.green_color),
                                        color: ProjectColors.green_color,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  )),
                            ),
                          ],
                        ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      )
                    ])),
              ),
            );
          },
          listener: (context, state) async {},
        ),
      ),
    );
  }
}
