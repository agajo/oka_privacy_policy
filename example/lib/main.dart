import 'package:flutter/material.dart';
import 'package:oka_privacy_policy/oka_privacy_policy.dart';

void main() {
  runApp(MaterialApp(
    home: PrivacyPolicyWidget(
      afterAgreeWidget: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('your contents'),
          RaisedButton(
            child: Text('clear SharedPreferences'),
            onPressed: () {
              // TODO: InheritedWidgetでdisagreeメソッドを受け取ってるはずなので、それを呼ぶ。
            },
          )
        ],
      ),
    );
  }
}
