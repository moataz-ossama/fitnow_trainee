import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/project_colors/colors.dart';

class ExerciseResults extends StatelessWidget {
  const ExerciseResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.grey[600],
        backgroundColor: Colors.grey[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              color: ProjectColors.white_color,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "1 Workout Day",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Back Workout",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: ProjectColors.green_color,
                                ),
                              ),
                              child: CircleAvatar(
                                child: Text(
                                  "100%",
                                  style: TextStyle(
                                      color: ProjectColors.green_color),
                                ),
                                backgroundColor: ProjectColors.white_color,
                                radius: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: 140,
                    height: 60,
decoration: BoxDecoration(
  border: Border.all(color: Colors.grey),
  color: Colors.white,
),

                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            "30:18",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("WorkOut Duration")
                        ],
                      ),
                    ),
                  ),
                ),
                 SizedBox(width: 20,),
                 Expanded(
                   child: Container(
                    width: 140,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.white,
                    ),

                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            "9",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Rest Time")
                        ],
                      ),
                    ),
                ),
                 ),

              ],
            ),
            Expanded(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){}, child:     Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                          },
                          child: Text(
                            "Send to Coach",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Icon(Icons.arrow_forward,color: ProjectColors.white_color,)
                      ],
                    ),
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        color: ProjectColors.green_color,
                        borderRadius: BorderRadius.circular(5)),
                  ) ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
