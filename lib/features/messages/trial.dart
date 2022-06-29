// @dart=2.9


import 'package:flutter/material.dart';
import 'package:country_list_pick/country_list_pick.dart';

import '../../shared/project_colors/colors.dart';
class CountrySelect extends  StatefulWidget {
  const CountrySelect({Key key}) : super(key: key);

  @override
  State<CountrySelect> createState() => _CountrySelectState();
}

class _CountrySelectState extends State<CountrySelect> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          color: ProjectColors.green_color,
          height: 400,
          width: double.infinity,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: 7,
                  separatorBuilder:(context, index) => SizedBox(height: 0,)
                  ,itemBuilder: (context, index) =>  Row(
          mainAxisAlignment:
          MainAxisAlignment.start,
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: ProjectColors
                              .white_color,
                          border: Border.all(
                              color: Colors
                                  .red)),
                      width:
                      double.infinity,
                      child: TextButton(
                          onPressed:
                              () {},
                          child: Row(
                            children: [
                              Text(
                                "Day"+index.toString(),
                                style: TextStyle(
                                    color:
                                    Colors.grey[600],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "workout name",
                                style: TextStyle(
                                    color:
                                    Colors.grey[600],
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ))),
                ),
            ),
          ],
          ), ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
