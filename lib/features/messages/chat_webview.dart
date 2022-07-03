// @dart=2.9
import 'package:fitnow_trainee/shared/project_colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Chat extends StatefulWidget {

  const Chat({Key key}) : super(key: key);
  static  String token;
  static void settoken()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    token=  prefs.getString('access_token');

  }


  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  String token=Chat.token;


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Screen"),
      backgroundColor: ProjectColors.green_color,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: 'https://fitsnow.xyz/client/chat/?token='+token,
            ),
          ),
        ],
      ),
    );
  }


}
