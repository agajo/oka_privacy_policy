import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyTextJa extends StatelessWidget {
  const PrivacyPolicyTextJa({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '※このアプリをご利用になるためには、利用規約とプライバシーポリシーに同意していただく必要があります。',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(height: 40),
        Text('利用規約', style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 10),
        Text('権利について', style: Theme.of(context).textTheme.headline6),
        const Text(
          '当サービスの利用者は、投稿または送信したコンテンツに対して有する権利を従前どおり保持します。ただし、当サービス利用者は、当サービス運営者に対し、投稿または送信されたコンテンツをサービスやプロモーションに利用する権利を許諾したこととなります。',
        ),
        const SizedBox(height: 10),
        Text('禁止行為について', style: Theme.of(context).textTheme.headline6),
        const Text(
          '当サービス内において次のような内容を含むコンテンツを投稿または送信することを禁止します。サービス運営者はこれらの禁止行為を行った利用者を利用停止にすることができ、サービス利用者はこれに同意するものとします。'
          '\n・公の秩序または善良の風俗に反するおそれのあるもの'
          '\n・サービス運営者または第三者の著作権、商標権、特許権等の知的財産権、名誉権、プライバシー権、その他法令上または契約上の権利を侵害するもの'
          '\n・過度に暴力的な表現、露骨な性的表現、児童ポルノ・児童虐待に相当する表現、人種、国籍、信条、性別、社会的身分、門地等による差別につながる表現、自殺、自傷行為、薬物乱用を誘引または助長する表現、その他反社会的な内容を含み他人に不快感を与える表現',
        ),
        const SizedBox(height: 40),
        Text('プライバシーポリシー', style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 10),
        Text.rich(
          TextSpan(children: [
            TextSpan(
                text: '広告について', style: Theme.of(context).textTheme.headline6),
            const TextSpan(
                text: '\n本アプリでは、広告配信ツールとしてAdMob(Google Inc.)を使用しており、'
                    'AdMobがご利用者の情報を自動取得する場合がございます。'
                    '取得する情報、利用目的、第三者への提供等につきましては、'
                    '以下の広告配信事業者のアプリケーション・プライバシーポリシーのリンクよりご確認ください。'
                    '\n\n'
                    'Google 広告に関するポリシー\n'),
            _LinkTextSpan(
                url: 'https://policies.google.com/technologies/ads?hl=ja'),
            const TextSpan(text: '\n\n\n'),
            TextSpan(
                text: '利用状況解析について',
                style: Theme.of(context).textTheme.headline6),
            const TextSpan(
                text: '\n本アプリでは、今後の開発の参考とするため、アプリの利用状況データを収集するツール'
                    'としてFirebase(Google Inc.)を使用しており、Firebaseがご利用者の情報を'
                    '自動取得する場合がございます。取得する情報、利用目的、第三者への提供等につきましては、'
                    '以下のGoogleプライバシーポリシーのリンクよりご確認ください。'
                    '\n\n'
                    'Google プライバシーポリシー\n'),
            _LinkTextSpan(url: 'https://policies.google.com/privacy?hl=ja'),
          ]),
        ),
        const SizedBox(height: 40),
        const Text('最終更新日 2020年6月11日'),
      ],
    );
  }
}

class PrivacyPolicyTextEn extends StatelessWidget {
  const PrivacyPolicyTextEn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '※ In order to use this app, you must agree to the Terms of Service and Privacy Policy.',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(height: 40),
        Text('Terms of Service', style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 10),
        Text('About rights', style: Theme.of(context).textTheme.headline6),
        const Text(
          'The user of the Service retains the rights to the Content posted or transmitted as usual. However, the user of the Service grants the operator of the Service the right to use the posted or transmitted content for the service or promotion.',
        ),
        const SizedBox(height: 10),
        Text('About prohibited acts',
            style: Theme.of(context).textTheme.headline6),
        const Text(
          'Posting or sending the following contents within this service is prohibited.'
          'The service operator can prohibit the use of those who have performed these prohibited acts.'
          '\n・Acts that may be in violation of public order, morals or customs;'
          '\n・Acts that infringe intellectual property rights, such as copyrights, trademarks and patent rights, rights to fame, privacy, and all other rights granted by law or by a contract with the service provider and/or a third party;'
          '\n・Acts of posting or transmitting excessively violent or explicit sexual expressions; expressions that amount to child pornography or child abuse; expressions that lead to discrimination by race, national origin, creed, gender, social status, family origin, etc.; expressions that induce or encourage suicide, self-injurious behavior or drug abuse; or expressions that include anti-social content and lead to the discomfort of others;',
        ),
        const SizedBox(height: 40),
        Text('Privacy policy', style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 10),
        Text.rich(
          TextSpan(children: [
            TextSpan(
                text: 'About ads',
                style: Theme.of(context).textTheme.headline6),
            const TextSpan(
                text:
                    "\nThis app uses AdMob(Google Inc.) to display ads. AdMob may collect information about users automatically. You have to get more info by clicking the link below and agree with Google's policy about ads."
                    '\n\n'
                    'Advertising – Privacy & Terms – Google\n'),
            _LinkTextSpan(
                url: 'https://policies.google.com/technologies/ads?hl=en'),
            const TextSpan(text: '\n\n\n'),
            TextSpan(
                text: 'About analytics',
                style: Theme.of(context).textTheme.headline6),
            const TextSpan(
                text:
                    "\nThis app uses Firebase(Google Inc.) to analize the usage information and to improve the usability. Firebase may collect information about users automatically. You have to get more info by clicking the link below and agree with Google's privacy policy."
                    '\n\n'
                    'Privacy Policy – Privacy & Terms – Google\n'),
            _LinkTextSpan(url: 'https://policies.google.com/privacy?hl=en'),
          ]),
        ),
        const SizedBox(height: 40),
        const Text(
          'This Terms of Use and Privacy Policy is a translation of the Japanese version. The Japanese version shall be deemed to be the official version. The relationship between Service Users and Service Operators shall be governed by the Japanese version. In the event of any inconsistency between the Japanese version and the translated version, the Japanese version shall be applied. These terms and conditions shall be governed by the laws of Japan. ',
        ),
        const SizedBox(height: 40),
        const Text('Date of last update: June 11, 2020'),
      ],
    );
  }
}

class PrivacyPolicyTextZh extends StatelessWidget {
  const PrivacyPolicyTextZh({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '※为了使用这个程序，您需要同意服务条款和隐私政策。',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(height: 40),
        Text('服务条款', style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 10),
        Text('关于权利', style: Theme.of(context).textTheme.headline6),
        const Text(
          '服务的用户保留照常发布或传输的内容的权利。 但是，服务的用户授予服务的运营商使用发布或传输的内容进行服务或促销的权利。',
        ),
        const SizedBox(height: 10),
        Text('关于违禁行为', style: Theme.of(context).textTheme.headline6),
        const Text(
          '禁止在此服务中发布或发送以下内容。'
          '服务运营商可以禁止使用已执行这些禁止行为的人员。'
          '\n・恐有危害公共秩序或善良风俗的行为。'
          '\n・侵犯知识产权的行为，例如版权，商标和专利权，名誉权，隐私权以及法律或与服务提供商和/或第三方签订的合同授予的所有其他权利。'
          '\n・投稿或传送内容有过度暴力的表现、性暗示过度露骨的表现、涉及人种、国籍、信仰、性别、社会地位、家世等有关歧视的表现、引诱或助长自杀、自伤行为或滥用药物的表现、其他包含反社会情节在内等使人感到不愉快的表现的行为。',
        ),
        const SizedBox(height: 40),
        Text('隐私政策', style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 10),
        Text.rich(
          TextSpan(children: [
            TextSpan(
                text: '关于广告', style: Theme.of(context).textTheme.headline6),
            const TextSpan(
                text:
                    '\n此应用程序使用AdMob（Google Inc.）作为广告分发工具，并且AdMob可能会自动获取用户信息。 对于要获取的信息，使用目的，提供给第三方等，请从下面的链接中查看广告发行商的应用程序隐私政策。'
                    '\n\n'
                    '广告 – 隐私权和条款 – Google\n'),
            _LinkTextSpan(
                url: 'https://policies.google.com/technologies/ads?hl=zh'),
            const TextSpan(text: '\n\n\n'),
            TextSpan(
                text: '关于使用情况分析', style: Theme.of(context).textTheme.headline6),
            const TextSpan(
                text:
                    '\n此应用程序使用Firebase（Google Inc.）分析使用情况信息并提高可用性。 Firebase可能会自动收集有关用户的信息。 您必须通过单击下面的链接来获取更多信息，并同意Google的隐私权政策。'
                    '\n\n'
                    '隐私权政策 – 隐私权和条款 – Google\n'),
            _LinkTextSpan(url: 'https://policies.google.com/privacy?hl=zh'),
          ]),
        ),
        const SizedBox(height: 40),
        const Text(
          '本使用条款和隐私政策是日语版本的翻译。 日语版本应被视为正式版本。 服务用户和服务运营商之间的关系应以日语版本为准。 如果日语版本和翻译版本之间存在任何不一致的情况，则应使用日语版本。 这些条款和条件应受日本法律管辖。',
        ),
        const SizedBox(height: 40),
        const Text('最近更新时间 2020年6月11日'),
      ],
    );
  }
}

class _LinkTextSpan extends TextSpan {
  _LinkTextSpan(
      {TextStyle style = const TextStyle(color: Colors.lightBlueAccent),
      String url,
      String text})
      : super(
            style: style,
            text: text ?? url,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launch(url, forceSafariVC: false);
              });
}
