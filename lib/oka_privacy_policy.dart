library oka_privacy_policy;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ここだけ言語切替可能にするためのStateful
// 日本語を正式版とする、と書いてあるので、日本語版を読みたくなる人がいるかもしれないから。
class PrivacyPolicyWidget extends StatefulWidget {
  const PrivacyPolicyWidget(
      {@required this.afterAgreeWidget,
      @required this.newestPolicyVersion,
      @required this.enText,
      @required this.jaText,
      @required this.zhText});
  final Widget afterAgreeWidget;
  final int newestPolicyVersion;
  final Widget enText;
  final Widget jaText;
  final Widget zhText;

  static PrivacyPolicyWidgetState of(BuildContext context) {
    return (context.getElementForInheritedWidgetOfExactType<
            _PrivacyPolicyInherited>() as _PrivacyPolicyInherited)
        .data;
  }

  @override
  PrivacyPolicyWidgetState createState() => PrivacyPolicyWidgetState();
}

class PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget> {
  String _languageCode;
  bool _isAgreed;
  static const String _agreedPolicyVersionKey =
      'agreed_privacy_policy_version_key';

  @override
  void didChangeDependencies() {
    _languageCode ??= Localizations.localeOf(context).languageCode;
    SharedPreferences.getInstance().then((_prefs) {
      setState(() {
        if ((_prefs.getInt(_agreedPolicyVersionKey) ?? -1) ==
            widget.newestPolicyVersion) {
          _isAgreed = true;
        } else {
          print('privacy policy not agreed');
          _isAgreed = false;
        }
      });
    });
    super.didChangeDependencies();
  }

  void agree() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setInt(_agreedPolicyVersionKey, widget.newestPolicyVersion);
    });
    _isAgreed = true;
  }

  void disagree() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove(_agreedPolicyVersionKey);
    });
    _isAgreed = false;
  }

  @override
  Widget build(BuildContext context) {
    if (_isAgreed == null) {
      return Container(key: const Key('waiting for SharedPreferences'));
    } else if (_isAgreed == true) {
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
          title: _languageCode == 'ja'
              ? const Text('利用規約・プライバシーポリシー')
              : _languageCode == 'zh'
                  ? const Text('服务条款和隐私政策')
                  : const Text('Terms of Service / Privacy Policy'),
        ),
        body: SafeArea(
          child: Column(children: [
            DropdownButton(
              // supportedLocalesでenとjaとzhしか与えてないので、この3つのどれかになる
              value: _languageCode,
              onChanged: (String value) {
                setState(() {
                  _languageCode = value;
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
                child: _languageCode == 'ja'
                    ? widget.jaText
                    : _languageCode == 'zh'
                        ? widget.zhText
                        : widget.enText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: RaisedButton(
                  key: const Key('privacy policy agree button'),
                  color: Colors.blue[300],
                  child: _languageCode == 'ja'
                      ? const Text('同意する')
                      : _languageCode == 'zh'
                          ? const Text('同意')
                          : const Text('Agree'),
                  onPressed: () {
                    agree();
                  }),
            ),
          ]),
        ),
      );
    }
  }
}

class _PrivacyPolicyInherited extends InheritedWidget {
  const _PrivacyPolicyInherited(
      {Key key, @required Widget child, @required this.data})
      : assert(child != null),
        super(key: key, child: child);

  final PrivacyPolicyWidgetState data;

  @override
  bool updateShouldNotify(_PrivacyPolicyInherited old) {
    return false;
  }
}
