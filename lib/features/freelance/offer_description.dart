import 'package:flutter/material.dart';

import '../../shared/project_colors/colors.dart';

class OfferDescription extends StatefulWidget {
  const OfferDescription({Key? key}) : super(key: key);

  @override
  State<OfferDescription> createState() => _OfferDescriptionState();
}

class _OfferDescriptionState extends State<OfferDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: ProjectColors.light_grey_color),
        backgroundColor: Colors.grey[200],
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
                child: Text('Offer Description',
                    style: TextStyle(color: Colors.black))),
            SizedBox(
              width: 50,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'send',
                  style: TextStyle(
                      color: ProjectColors.light_grey_color, fontSize: 20),
                ))
          ],
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Image.asset("assets/images/healthy.png"),
                                Text("Healthy")
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Image.asset("assets/images/onfire.png"),
                                Text("Popularity")
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Image.asset("assets/images/award.png"),
                                Text("Fitness")
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star_border_outlined,
                            ),
                            Icon(Icons.star_border_outlined),
                            Icon(Icons.star_border_outlined),
                            Icon(Icons.star_border_outlined),
                            Icon(Icons.star_border_outlined),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: ProjectColors.green_color,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Egypt",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'i need a private online coach to help me in losing weight and gain muscles and i have surgery in my leg sdas.',
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
                Text(
                  'i need a private online coach to help me in losing weight and gain muscles and i have surgery in my leg so i want you to take this injuiry in your consedration to help me improve my leg and also avoid another injuiry',
                  maxLines: 20,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 15, color: ProjectColors.dark_grey_color),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
