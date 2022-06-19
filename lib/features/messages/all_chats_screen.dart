import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'inbox.dart';

class AllChats extends StatelessWidget {
  Color green_color = Color(0xff34be82);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0.0,
        titleSpacing: 30,
        title: Row(
          children: [
            //circle avatar contain the photo of the coach
            Container(
              child: Row(children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage('assets/images/my_photo.jpg'),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          bottom: 3.0, end: 3.0),
                      child: CircleAvatar(
                        radius: 6.0,
                        backgroundColor: green_color,
                      ),
                    )
                  ],
                ),
              ]),
            ),
            SizedBox(
              width: 50.0,
            ),
            //container to make search area
            Container(
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(width: 5.0),
                  FittedBox(
                    child: Text(
                      'Search or start a new chat        ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(width: 4.0),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'chats',
                style: TextStyle(
                  color: green_color,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
                flex: 25,
                child: ListView.builder(
                  itemBuilder: (context, index) => Column(children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return InboxClient();
                          }));
                        },
                        child: buildChatItem()),
                    SizedBox(
                      height: 10,
                    )
                  ]),
                ))
          ],
        ),
      ),
    );
  }

  Widget buildChatItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage('assets/images/my_photo.jpg'),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 7.0,
                  backgroundColor: green_color,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'moataz ossama ahmed ebrahim hassan ahmed ',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      flex: 3,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '02:00 pm',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        'hello my name is moataz osaama hello my name is moataz osaama hello my name is moataz osaama',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          child: Container(
                            child: Center(
                                child: Text(
                              "999",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            )),
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: green_color,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
}
