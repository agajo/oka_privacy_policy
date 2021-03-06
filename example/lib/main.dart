import 'package:example/privacy_policy_texts.dart';
import 'package:flutter/material.dart';
import 'package:oka_privacy_policy/oka_privacy_policy.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: PrivacyPolicyWidget(
      afterAgreeWidget: MyApp(),
      newestPolicyVersion: 1,
      enText: PrivacyPolicyTextEn(),
      zhText: PrivacyPolicyTextZh(),
      jaText: PrivacyPolicyTextJa(),
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
              SharedPreferences.getInstance().then((value) {
                value.clear();
              });
            },
          )
        ],
      ),
    );
  }
}
