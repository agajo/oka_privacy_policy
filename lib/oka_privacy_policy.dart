library oka_privacy_policy;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ここだけ言語切替可能にするためのStateful
// 日本語を正式版とする、と書いてあるので、日本語版を読みたくなる人がいるかもしれないから。
class PrivacyPolicyWidget extends StatefulWidget {
  const PrivacyPolicyWidget(
      {@required this.afterAgreeWidget, this.enText, this.jaText, this.zhText});
  final Widget afterAgreeWidget;
  final Widget enText;
  final Widget jaText;
  final Widget zhText;

  @override
  _PrivacyPolicyWidgetState createState() => _PrivacyPolicyWidgetState();
}

class _PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget> {
  String languageCode;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      // setState()で囲む必要はないかもしれない。
      setState(() {
        languageCode = Localizations.localeOf(context).languageCode;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PrivacyPolicyNotifier>(
      create: (_) => PrivacyPolicyNotifier(),
      child: Consumer<PrivacyPolicyNotifier>(builder: (context, notifier, _) {
        if (notifier.isAgreed == null) {
          return Container(key: const Key('waiting for SharedPreferences'));
        } else if (notifier.isAgreed == true) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute<void>(builder: (_) => widget.afterAgreeWidget),
              (_) => false,
            );
          });
          return Container();
        } else {
          return Scaffold(
            key: const Key('privacy policy view'),
            appBar: AppBar(
              title: languageCode == 'ja'
                  ? const Text('利用規約・プライバシーポリシー')
                  : languageCode == 'zh'
                      ? const Text('服务条款和隐私政策')
                      : const Text('Terms of Service / Privacy Policy'),
            ),
            body: SafeArea(
              child: Column(children: [
                DropdownButton(
                  // supportedLocalesでenとjaとzhしか与えてないので、この3つのどれかになる
                  value: languageCode,
                  onChanged: (String value) {
                    setState(() {
                      languageCode = value;
                    });
                  },
                  items: ['en', 'ja', 'zh']
                      .map((value) => DropdownMenuItem(
                          value: value,
                          child: Text(value == 'ja'
                              ? '日本語'
                              : value == 'zh'
                                  ? '中文'
                                  : 'English')))
                      .toList(),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: languageCode == 'ja'
                        ? widget.jaText
                        : languageCode == 'zh'
                            ? widget.zhText
                            : widget.enText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: RaisedButton(
                      key: const Key('privacy policy agree button'),
                      color: Colors.blue[300],
                      child: languageCode == 'ja'
                          ? const Text('同意する')
                          : languageCode == 'zh'
                              ? const Text('同意')
                              : const Text('Agree'),
                      onPressed: () {
                        notifier.agree();
                      }),
                ),
              ]),
            ),
          );
        }
      }),
    );
  }
}

class PrivacyPolicyNotifier extends ChangeNotifier {
  PrivacyPolicyNotifier() {
    _init();
  }
  static const String agreedPolicyVersionKey =
      'agreed_privacy_policy_version_key';
  static const int newestPolicyVersion = 1;
  bool _isAgreed;
  bool get isAgreed => _isAgreed;

  Future<void> _init() async {
    // シングルトンなのでどこから何回取得しても同じSharedPreferencesインスタンスが返る。
    final _prefs = await SharedPreferences.getInstance();
    if ((_prefs.getInt(agreedPolicyVersionKey) ?? 0) == newestPolicyVersion) {
      _isAgreed = true;
    } else {
      print('privacy policy not agreed');
      _isAgreed = false;
    }
    notifyListeners();
  }

  void agree() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setInt(agreedPolicyVersionKey, newestPolicyVersion);
    });
    _isAgreed = true;
    notifyListeners();
  }

  void disagree() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove(agreedPolicyVersionKey);
    });
    _isAgreed = false;
    notifyListeners();
  }
}
