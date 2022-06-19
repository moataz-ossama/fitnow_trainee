import 'package:fitnow_trainee/shared/project_colors/colors.dart';
import 'package:flutter/material.dart';

class WorkoutDetails extends StatelessWidget {
  const WorkoutDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.grey[600],
        centerTitle: true,
        title: Text(
          "1/7 Back",
          style: TextStyle(color: ProjectColors.green_color),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "Begin",
                  style: TextStyle(color: Colors.grey[600]),
                )),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/images/barbell.png"),
                Row(
                  children: [
                    Text("barbell pullover and press"),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.info,
                          color: ProjectColors.green_color,
                        ))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ProjectColors.green_color,
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundColor: ProjectColors.white_color,
                              radius: 40.0,
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: '-',
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                    color: ProjectColors.light_grey_color,
                                    fontSize: 15),
                                showCursor: false,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: ProjectColors.green_color,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: ProjectColors.white_color,
                          radius: 50.0,
                          child: Icon(
                            Icons.lock,
                            color: ProjectColors.green_color,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: ProjectColors.green_color,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: ProjectColors.white_color,
                          radius: 40.0,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: '-',
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                                color: ProjectColors.light_grey_color,
                                fontSize: 15),
                            showCursor: false,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Center(
                      child: Text(
                        "Repeats Required",
                        textAlign: TextAlign.center,
                      ),
                    )),
                    Expanded(
                        child: Center(
                            child: Text("Rest", textAlign: TextAlign.center))),
                    Expanded(
                        child: Center(
                            child:
                                Text("Sets Made", textAlign: TextAlign.center)))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Kilo Grams',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(

                          )),
                        ),
                        style: TextStyle(
                            color: ProjectColors.light_grey_color,
                            fontSize: 15),
                        showCursor: false,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(flex: 2, child: TextFormField(
                      textAlign: TextAlign.center,

                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(

                        hintText: 'Repeats',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(

                            )),
                      ),
                      style: TextStyle(
                          color: ProjectColors.light_grey_color,
                          fontSize: 15),
                      showCursor: false,
                    )),
                    Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.add_box_rounded,
                          size: 40,
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(alignment:Alignment.centerLeft,child: TextButton(onPressed: (){}, child: Text("Add Comment",style: TextStyle(color: ProjectColors.green_color),)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
