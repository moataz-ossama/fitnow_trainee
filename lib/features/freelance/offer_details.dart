// @dart=2.9
import 'dart:io';

import 'package:fitnow_trainee/controller/cubit/payment/payment_models.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import '../../controller/cubit/payment/payment_cubit.dart';
import '../../shared/project_colors/colors.dart';

class OfferDetails extends StatefulWidget {
  const OfferDetails({Key key}) : super(key: key);

  @override
  State<OfferDetails> createState() => _OfferDetailsState();
  static String price;
  static String description;
  static String id;
  static getdata() async {
    SharedPreferences sharedpref = await SharedPreferences.getInstance();

    description = await sharedpref.getString('offer_description');
    price = await sharedpref.getString('offer_price');
    id = await sharedpref.getString('offer_id');
    print("get data is executed");
  }

}

class _OfferDetailsState extends State<OfferDetails> {
  @override
  String offer_id=OfferDetails.id;

  String pricestring = OfferDetails.price;
  String descriptionstring = OfferDetails.description;
  Future<PaymentModel> postdata(
      @required String offer_id,
    ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString('access_token');

    String x = "Bearer " + token;
    var url = Uri.parse('https://api.fitsnow.xyz/api/trainee-offers/pay');
    var response = await http.post(url, body: {
      'offer_id': offer_id,

    }, headers: {
      HttpHeaders.authorizationHeader: x
    });

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

  }

  void _launchUrl(Uri url ) async {
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: BackButton(color: ProjectColors.white_color),
            backgroundColor: ProjectColors.green_color,
            centerTitle: true,
            title: Text("Offer Details")),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Offer Description: ",
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
                  Text(
                    descriptionstring==null?"no description":descriptionstring,
                    style: TextStyle(
                        fontSize: 15, color: ProjectColors.dark_grey_color),
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
                              Text(pricestring==null?"no description":pricestring),
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

                                String redirect= PaymentCubit.model.redirect;

                          Uri url=Uri.parse('$redirect');

                                _launchUrl(url) ;
                                  },
                                  child: Text(
                                    "Pay For Offer",
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
                                    "Delete Offer",
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
