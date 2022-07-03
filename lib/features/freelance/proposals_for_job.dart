// @dart=2.9
import 'package:conditional_builder/conditional_builder.dart';
import 'package:fitnow_trainee/features/freelance/Proposal_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/cubit/proposals/proposals_cubit.dart';
import '../../controller/cubit/proposals/proposals_states.dart';
import '../../shared/project_colors/colors.dart';

class JobProposals extends StatefulWidget {
  const JobProposals({Key key}) : super(key: key);

  @override
  State<JobProposals> createState() => _JobProposalsState();
}

class _JobProposalsState extends State<JobProposals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(color: ProjectColors.white_color),
          backgroundColor: ProjectColors.green_color,
          centerTitle: true,
          title: Text("Job Proposals")),
      body: Container(
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0,left: 10,right: 10),
          child: BlocProvider(
            create: (BuildContext context) => ProposalsCubit(),
            child: BlocConsumer<ProposalsCubit, Proposalsstates>(
                builder: (context, state) {
                  return ConditionalBuilder(
                    condition: ProposalsCubit.model != null,
                    fallback: (context) => Center(child: CircularProgressIndicator()),
                    builder: (context) =>Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: GridView.count(
                                  childAspectRatio: 1 / 1.5,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  crossAxisCount: 1,
                                  children: List.generate(
                                    ProposalsCubit.model.data.proposles.length,
                                        (index) => Column(
                                      children: [
                                        Container(
                                          height: 350,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: ProjectColors.green_color,
                                              ),
                                              borderRadius: BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    ProposalsCubit.model.data.proposles[index].package.title,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: ProjectColors.green_color,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          ProposalsCubit.model.data.proposles[index].package.description ==
                                                              null
                                                              ? "no specified description"
                                                              :  ProposalsCubit.model.data.proposles[index].package.description,
                                                          maxLines: 3,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: ProjectColors
                                                                  .dark_grey_color),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          ProposalsCubit.model.data.proposles[index].coverletter ==
                                                              null
                                                              ? "no specified cover letter"
                                                              :  ProposalsCubit.model.data.proposles[index].coverletter,
                                                          maxLines: 3,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: ProjectColors
                                                                  .dark_grey_color),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                /* Row(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20,right: 20),
                                          child: Container(

                                            child: Text( PackageCubit.model.data
                                                .listdata[index]
                                                .type??'no specified type'),),
                                        )
                                      ],),*/
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Row(
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
                                                              Text(ProposalsCubit.model.data.proposles[index].package.weeks.toString() ),
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
                                                              Text(ProposalsCubit.model.data.price.toString()),
                                                              Text(" Egp"),
                                                            ],
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: double.infinity,
                                                          height: 40,
                                                          child: TextButton(
                                                              onPressed: () async {
                                                                SharedPreferences sharedpref =
                                                                await SharedPreferences
                                                                    .getInstance();

                                                                  sharedpref.setString(
                                                                      'Package_id',
                                                                      ProposalsCubit.model.data.proposles[index].package.id.toString());
                                                                  sharedpref.setString(
                                                                      'proposal_duration',
                                                                      ProposalsCubit.model.data.proposles[index].package.weeks.toString());
                                                                  sharedpref.setString(
                                                                      'propsal_price',
                                                                      ProposalsCubit.model.data.price.toString());
                                                                  sharedpref.setString(
                                                                      'proposal_description',
                                                                      ProposalsCubit.model.data.proposles[index].package.description);
                                                                  sharedpref.setString(
                                                                      'proposal_title',
                                                                      ProposalsCubit.model.data.proposles[index].package.title);
                                                                  sharedpref.setString(
                                                                      'proposal_cover_letter',
                                                                      ProposalsCubit.model.data.proposles[index].coverletter);
setState(() {
  ProposalDescription.getdata();

});

                                                              Get.to(ProposalDescription());





                                                              },
                                                              child: Text(
                                                                "View Proposal Details",
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
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },

                listener: (context, state) async {
                  setState(() async {

                  });
                }),
          ),
        ),
      ),
    );
  }
}
