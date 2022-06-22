import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/project_colors/colors.dart';

class InboxClient extends StatefulWidget {
  const InboxClient({Key? key}) : super(key: key);

  @override
  State<InboxClient> createState() => _InboxClientState();
}

class _InboxClientState extends State<InboxClient> {
  int current_index = 0;

  String? hintText;

  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0.0,
        titleSpacing: 0,
        title: Row(
          children: [
            //circle avatar contain the photo of the coach
            Container(
              child: Row(children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: const [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage('assets/images/my_photo.jpg'),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                          bottom: 3.0, end: 3.0),
                      child: CircleAvatar(
                        radius: 6.0,
                        backgroundColor: Colors.green,
                      ),
                    )
                  ],
                ),
              ]),
            ),
            SizedBox(
              width: 20.0,
            ),
            Container(
              width: 200,
              child: Text(
                "moataz ossama",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15),
              ),
            ),

            Icon(
              Icons.local_phone,
              color: Colors.green,
            ),
            SizedBox(
              width: 20.0,
            ),
            Icon(
              Icons.videocam,
              color: Colors.green,
            ),
            //container to make search area
          ],
        ),
      ),
      body: Padding(
          padding: EdgeInsets.only(
            left: 40,
            right: 40,
            top: 40,
            bottom: 10,
          ),
          child: Column(children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //coach messsage
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/my_photo.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                                color: ProjectColors.green_color,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(32),
                                  bottomLeft: Radius.circular(32),
                                  bottomRight: Radius.circular(32),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Text(
                                "messadfvfdvsdfvsdfvsfvsvdsfvsfdvsdfvsdfvsfdvsvsfdvsfdvsdfvsdfvsdfvsdfvsdfvsdfvsdfvsdfvsdvsdfvsdfvsdfvfdvsdvsdfvsdfvsfvsfdvge",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //trainee message
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                                color: ProjectColors.white_color,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32),
                                  bottomLeft: Radius.circular(32),
                                  bottomRight: Radius.circular(32),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Text(
                                "messadfvfdvsdfvsdfvsfvsvdsfvsfdvsdfvsdfvsfdvsvsfdvsfdvsdfvsdfvsdfvsdfvsdfvsdfvsdfvsdfvsdvsdfvsdfvsdfvfdvsdvsdfvsdfvsfvsfdvge",
                                style: TextStyle(
                                    color: ProjectColors.dark_grey_color,
                                    fontSize: 17),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/my_photo.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: ProjectColors.white_color,
              child: TextFormField(
                onFieldSubmitted: (value) {
                  print(value);
                },
                onChanged: (String value) {
                  print(value);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "email address should not be null";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Send Message',
                  suffixIcon: Icon(
                    Icons.send,
                    color: ProjectColors.green_color,
                  ),
                  prefixIcon: Icon(
                    Icons.camera_alt,
                    color: ProjectColors.green_color,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ])),
    );
  }
}

/*
TextFormField(
style: TextStyle(fontSize: 20, height: 1,),
controller: _controller,
onFieldSubmitted: (value) {
print(value);
},

validator: (value) {
if (value!.isEmpty) {
return "email address should not be null";
}
return null;
},
decoration: InputDecoration(
hintText: 'Send Message',
border: InputBorder.none,
contentPadding:
EdgeInsets.symmetric( horizontal: 15),
suffix: IconButton(
alignment: Alignment.bottomCenter,

onPressed: () {
_controller.clear();
},
icon: Icon(Icons.send),
color: green_color,
),
prefix: IconButton(

alignment: Alignment.bottomCenter,
onPressed: () {},
icon: Icon(Icons.camera_alt),
color: green_color,
)),
)*/
