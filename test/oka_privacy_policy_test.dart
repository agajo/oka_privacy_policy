import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:oka_privacy_policy/oka_privacy_policy.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('PrivacyPolicyWidget test', () {
    Widget mainContent;
    Widget jaText;
    Widget enText;
    Widget zhText;
    Widget ppw;
    int newestPrivacyPolicyVersion;
    setUp(() {
      SharedPreferences.setMockInitialValues(<String, dynamic>{});
      newestPrivacyPolicyVersion ??= 1;
      mainContent = const MainContent();
      jaText = Container(key: Key('ja_text'));
      enText = Container(key: Key('en_text'));
      zhText = Container(key: Key('zh_text'));
      ppw = PrivacyPolicyWidget(
        key: Key('ppw'),
        afterAgreeWidget: mainContent,
        newestPolicyVersion: 1,
        jaText: jaText,
        enText: enText,
        zhText: zhText,
      );
    });
    testWidgets('shows PrivacyPolicyWidget first', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ppw));
      expect(find.byKey(Key('ppw')), findsOneWidget);
      expect(find.byKey(Key('waiting for SharedPreferences')), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.byWidget(enText), findsOneWidget);
      expect(find.byWidget(mainContent), findsNothing);
    });
    testWidgets('shows in the language of the device first',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          supportedLocales: [Locale('en'), Locale('zh')],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: Locale('zh'),
          home: ppw,
        ),
      );
      expect(find.byKey(Key('ppw')), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.byWidget(zhText), findsOneWidget);
      expect(find.byWidget(enText), findsNothing);
      expect(find.byWidget(mainContent), findsNothing);
    });
    testWidgets('moves to the app content when to agree',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ppw));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('ppw')), findsOneWidget);
      expect(find.byWidget(enText), findsOneWidget);
      expect(find.byWidget(mainContent), findsNothing);
      await tester.tap(find.byKey(const Key('privacy policy agree button')));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('ppw')), findsNothing);
      expect(find.byWidget(mainContent), findsOneWidget);
    });
    testWidgets('shows the app content first if already agreed',
        (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues(
          <String, dynamic>{PrivacyPolicyWidget.agreedPolicyVersionKey: 1});
      await tester.pumpWidget(MaterialApp(home: ppw));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('ppw')), findsNothing);
      expect(find.byWidget(mainContent), findsOneWidget);
    });
    testWidgets('shows PrivacyPolicyWidget again if the policy revised',
        (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues(
          <String, dynamic>{PrivacyPolicyWidget.agreedPolicyVersionKey: 1});
      newestPrivacyPolicyVersion = 2;
      await tester.pumpWidget(MaterialApp(home: ppw));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('ppw')), findsNothing);
      expect(find.byWidget(mainContent), findsOneWidget);
      newestPrivacyPolicyVersion = null;
    });
  });
}

class MainContent extends StatelessWidget {
  const MainContent();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
