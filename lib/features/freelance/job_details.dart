// @dart=2.9
import 'package:fitnow_trainee/controller/cubit/proposals/proposals_cubit.dart';
import 'package:fitnow_trainee/features/freelance/proposals_for_job.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/project_colors/colors.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({Key key}) : super(key: key);

  @override
  State<JobDetails> createState() => _JobDetailsState();
  static String title;
  static String price;
  static String description;
  static int job_id;
  static getdata() async {
    SharedPreferences sharedpref = await SharedPreferences.getInstance();
    title = await sharedpref.getString('job_title');
    description = await sharedpref.getString('job_description');
    price = await sharedpref.getString('job_price');
    job_id = await sharedpref.getInt('job_id');
    print("get data is executed");
  }
}

class _JobDetailsState extends State<JobDetails> {
  String titlestring = JobDetails.title;
  String pricestring = JobDetails.price;
  String descriptionstring = JobDetails.description;
  int id=JobDetails.job_id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: BackButton(color: ProjectColors.white_color),
            backgroundColor: ProjectColors.green_color,
            centerTitle: true,
            title: Text("Job Details")),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 30.0, right: 30, top: 20, bottom: 20),
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
                        "Job Description: ",
                        style: TextStyle(
                          fontSize: 16,
                          color: ProjectColors.green_color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        descriptionstring,
                        style: TextStyle(
                            fontSize: 15, color: ProjectColors.dark_grey_color),
                      ),
                    ],
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
                            Icons.attach_money,
                            color: ProjectColors.green_color,
                          ),
                          Text(
                            "price: ",
                            style: TextStyle(
                                fontSize: 16,
                                color: ProjectColors.green_color,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(pricestring),
                          Text(" Egp"),
                        ],
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 40,
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
                                    ProposalsCubit pc=new ProposalsCubit();
                                    pc.getProposal(id.toString());
Get.to(JobProposals());
                                  },
                                  child: Text(
                                    "View Coaches Proposals",
                                    style: TextStyle(
                                        color: ProjectColors.white_color),
                                  )),
                              decoration: BoxDecoration(
                                color: ProjectColors.green_color,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              child: TextButton(
                                  onPressed: () async {},
                                  child: Text(
                                    "Delete Job",
                                    style: TextStyle(
                                        color: ProjectColors.white_color),
                                  )),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
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
        ));
  }
}
