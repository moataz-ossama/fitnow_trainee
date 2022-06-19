import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../shared/project_colors/colors.dart';

class OfferSettings extends StatefulWidget {
  const OfferSettings({Key? key}) : super(key: key);

  @override
  State<OfferSettings> createState() => _OfferSettingsState();
}

class _OfferSettingsState extends State<OfferSettings> {
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
                child: Text('Offer Settings',
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
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(
                  'Contact With Coach',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 30),
                DottedBorder(
                    strokeWidth: 2,
                    dashPattern: [10, 6],
                    color: ProjectColors.green_color,
                    child: Container(
                      child: Center(
                          child: Text(
                        "drop files here",
                        style: TextStyle(color: ProjectColors.green_color),
                      )),
                      height: 150,
                      decoration: BoxDecoration(),
                    )),
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  child: TextFormField(
                    showCursor: false,
                    decoration: InputDecoration(
                      hintText: 'Subject',
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                        color: ProjectColors.light_grey_color, fontSize: 12),
                  ),
                  height: 30,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 5),
                Container(
                  width: double.infinity,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Your Offer',
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                        color: ProjectColors.light_grey_color, fontSize: 12),
                    showCursor: false,
                  ),
                  height: 150,
                  color: Colors.grey[300],
                ),
              ])),
        ),
      ),
    );
  }
}
