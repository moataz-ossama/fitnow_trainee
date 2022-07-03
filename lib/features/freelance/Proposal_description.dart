// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/project_colors/colors.dart';
import 'apply_to_package_form.dart';

class ProposalDescription extends  StatefulWidget {
  const ProposalDescription({Key key}) : super(key: key);

  @override
  State<ProposalDescription> createState() => _ProposalDescriptionState();
  static  String title;
  static   String price;
  static   String description;
  static  String duration;
  static  String cover_letter;

  static getdata()async{
    SharedPreferences sharedpref =
    await SharedPreferences
        .getInstance();
    title =await sharedpref.getString('proposal_title');
    description =await sharedpref.getString('proposal_description');
    duration =await sharedpref.getString('proposal_duration');
    price =await sharedpref.getString('propsal_price');
  cover_letter =await sharedpref.getString('proposal_cover_letter');



  }
}

class _ProposalDescriptionState extends State<ProposalDescription> {
  var x =ProposalDescription.getdata();
  String titlestring= ProposalDescription.title;
  String pricestring= ProposalDescription.price;
  String descriptionstring= ProposalDescription.description;
  String durationstring= ProposalDescription.duration;
  String cover_letter=ProposalDescription.cover_letter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: BackButton(color: ProjectColors.white_color),
            backgroundColor: ProjectColors.green_color,
            centerTitle: true,
            title: Text("Proposal Details")
        ),
        body:  Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20,bottom: 20),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    titlestring,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: ProjectColors.green_color,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Package Description: ",
                        style: TextStyle(
                            fontSize: 16,
                            color:
                            ProjectColors.green_color,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    descriptionstring,
                    style: TextStyle(
                        fontSize: 15, color: ProjectColors.dark_grey_color),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Proposal Cover Letter: ",
                        style: TextStyle(
                            fontSize: 16,
                            color:
                            ProjectColors.green_color,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      cover_letter,
                      style: TextStyle(
                          fontSize: 15, color: ProjectColors.dark_grey_color,

                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.timer_outlined,
                                color: ProjectColors.green_color,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Duration: ",
                                style: TextStyle(
                                    fontSize: 16,
                                    color:
                                    ProjectColors.green_color,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(durationstring),
                              Text(" weeks"),
                            ],
                          )),
                      Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.attach_money,
                                color: ProjectColors.green_color,
                              ),
                              Text(
                                "price: ",
                                style: TextStyle(
                                    fontSize: 16,
                                    color:
                                    ProjectColors.green_color,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(pricestring),
                              Text(" Egp"),
                            ],
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              child: TextButton(
                                  onPressed: () async {
                                    Get.to(ApplyToForm());

                                  },
                                  child: Text(
                                    "apply",
                                    style: TextStyle(
                                        color: ProjectColors
                                            .white_color),
                                  )),
                              decoration: BoxDecoration(
                                  color: ProjectColors.green_color),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
