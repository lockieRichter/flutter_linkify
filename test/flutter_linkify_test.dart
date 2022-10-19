import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SelectableLinkify renders text', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SelectableLinkify(
        text: 'Test https://google.com',
      ),
    ));

    expect(find.text('Test google.com'), findsOneWidget);
  });

  testWidgets('Linkify renders text', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Linkify(
        text: 'Test https://google.com',
      ),
    ));

    expect(find.textContaining('Test '), findsOneWidget);
    expect(find.text('google.com'), findsOneWidget);
  });

  testWidgets('SelectableLinkify renders text without humanizing',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SelectableLinkify(
        text: 'Test https://google.com',
        options: LinkifyOptions(
          humanize: false,
        ),
      ),
    ));

    expect(find.text('Test https://google.com'), findsOneWidget);
  });

  testWidgets('Linkify renders text without humanizing', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Linkify(
        text: 'Test https://google.com',
        options: LinkifyOptions(
          humanize: false,
        ),
      ),
    ));

    expect(find.textContaining('Test '), findsOneWidget);
    expect(find.text('https://google.com'), findsOneWidget);
  });

  testWidgets('SelectableLinkify renders text with loose URLs', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SelectableLinkify(
        text: 'Test google.com',
        options: LinkifyOptions(
          looseUrl: true,
        ),
      ),
    ));

    expect(find.text('Test google.com'), findsOneWidget);
  });

  testWidgets('Linkify renders text with loose URLs', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Linkify(
        text: 'Test google.com',
        options: LinkifyOptions(
          looseUrl: true,
        ),
      ),
    ));

    expect(find.textContaining('Test '), findsOneWidget);
    expect(find.text('google.com'), findsOneWidget);
  });

  testWidgets('SelectableLinkify renders without remove WWW', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SelectableLinkify(
        text: 'Test www.google.com',
      ),
    ));

    expect(find.text('Test www.google.com'), findsOneWidget);
  });

  testWidgets('Linkify renders without remove WWW', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Linkify(
        text: 'Test www.google.com',
      ),
    ));

    expect(find.textContaining('Test '), findsOneWidget);
    expect(find.text('www.google.com'), findsOneWidget);
  });

  testWidgets('SelectableLinkify renders with remove WWW', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SelectableLinkify(
        text: 'Test www.google.com',
        options: LinkifyOptions(
          removeWww: true,
        ),
      ),
    ));

    expect(find.text('Test google.com'), findsOneWidget);
  });

  testWidgets('Linkify renders with remove WWW', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Linkify(
        text: 'Test www.google.com',
        options: LinkifyOptions(
          removeWww: true,
        ),
      ),
    ));

    expect(find.textContaining('Test '), findsOneWidget);
    expect(find.text('google.com'), findsOneWidget);
  });

  testWidgets('SelectableLinkify renders URL with replacement Text',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SelectableLinkify(
        text: 'Test https://google.com',
        urlReplacementTexts: ['Google'],
      ),
    ));

    expect(find.text('Test Google'), findsOneWidget);

    await tester.pumpWidget(MaterialApp(
      home: SelectableLinkify(
        text: 'Test https://google.com https://youtube.com',
        urlReplacementTexts: ['Google'],
      ),
    ));

    expect(
      find.text('Test Google youtube.com'),
      findsOneWidget,
    );

    await tester.pumpWidget(MaterialApp(
      home: SelectableLinkify(
        text: 'Test https://google.com https://youtube.com',
        urlReplacementTexts: ['Google', 'Youtube', 'Netflix'],
      ),
    ));

    expect(
      find.text('Test Google Youtube'),
      findsOneWidget,
    );
  });

  testWidgets('Linkify renders URL with replacement Text', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Linkify(
        text: 'Test https://google.com',
        urlReplacementTexts: ['Google'],
      ),
    ));

    expect(find.textContaining('Test '), findsOneWidget);
    expect(find.text('Google'), findsOneWidget);

    await tester.pumpWidget(MaterialApp(
      home: Linkify(
        text: 'Test https://google.com https://youtube.com',
        urlReplacementTexts: ['Google'],
      ),
    ));

    expect(find.textContaining('Test '), findsOneWidget);
    expect(find.text('Google'), findsOneWidget);
    expect(find.text('youtube.com'), findsOneWidget);

    await tester.pumpWidget(MaterialApp(
      home: Linkify(
        text: 'Test https://google.com https://youtube.com',
        urlReplacementTexts: ['Google', 'Youtube', 'Netflix'],
      ),
    ));

    expect(find.textContaining('Test '), findsOneWidget);
    expect(find.text('Google'), findsOneWidget);
    expect(find.text('Youtube'), findsOneWidget);
  });
}
