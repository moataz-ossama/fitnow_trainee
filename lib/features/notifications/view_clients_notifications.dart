import 'package:fitnow_trainee/shared/project_colors/colors.dart';
import 'package:flutter/material.dart';

import '../messages/inbox.dart';

class ViewNotifications extends StatefulWidget {
  const ViewNotifications({Key? key}) : super(key: key);

  @override
  State<ViewNotifications> createState() => _ViewNotificationsState();
}

class _ViewNotificationsState extends State<ViewNotifications> {
  int current_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing: 20,
        backgroundColor: Colors.grey[300],
        title: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Notifications',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      print("mark all notifications as read");
                    },
                    child: Text('Mark all as read',
                        style:
                            TextStyle(fontSize: 15, color: Colors.grey[800])),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
        body: Container(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: Colors.white,

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children: [
                      notification_item(),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.grey[200],
                        height: 5,
                        thickness: 1,


                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));

  }
}

Widget notification_item() => Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage('assets/images/my_photo.jpg'),
            ),
          ],
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(alignment: Alignment.topRight, child: Text("Dec 6",style: TextStyle(fontWeight: FontWeight.bold ),)),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'client name ' +
                          " notification message dcssdcads cavjkfndv lkjsn bjksgn fjlbkndfsgbndflkjdfjnkgbndkljfgfsdcvsdvsdcdcsdcsb",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ],
    );
