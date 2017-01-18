import 'dart:async';
import 'dart:io';
import 'package:mdown_benchmark/mdown_benchmark.dart';

final List<String> languages = <String>[
  'cs',
  'de',
  'en',
  'es',
  'fr',
  'it',
  'ja',
  'ko',
  'nl',
  'pl',
  'pt-br',
  'ru',
  'zh',
  'zh-tw'
];

Future<List<double>> test(List<String> urls) async {
  final MapEmitter mdownResults = new MapEmitter("mdown");
  final MapEmitter markdownResults = new MapEmitter("markdown");

  RegExp nameRegExp = new RegExp(r'/(.*?)\.(md|markdown)$');

  for (String url in urls) {
    File file = new File(url);
    String name = nameRegExp.firstMatch(url)[1];
    print('Downloading: $name...');
    final String data = await file.readAsString();
    print('Benchmarking: $name...');
    await new Future.delayed(new Duration());
    MdownBenchmark.main(name, data, mdownResults);
    print('mdown: ${mdownResults.scores[name]}');
    await new Future.delayed(new Duration());
    MarkdownBenchmark.main(name, data, markdownResults);
    print('markdown: ${markdownResults.scores[name]}');
  }

  double mdownAvg = mdownResults.report(print);
  double markdownAvg = markdownResults.report(print);

  if (mdownAvg < markdownAvg) {
    print('mdown is ${markdownAvg / mdownAvg} times faster');
  } else {
    print('mdown is ${mdownAvg / markdownAvg} times slower');
  }

  return <double>[mdownAvg, markdownAvg];
}

Future<dynamic> main() async {
  Map<String, List<double>> results = {};
  for (String lang in languages) {
    List<String> urls = [];
    for (int i = 1; i <= 9; ++i) {
      urls.add('web/data/progit-$lang/01-chapter$i.markdown');
    }

    results[lang] = await test(urls);
  }

  results.forEach((String k, List<double> v) {
    print('$k | '
        '${v[0].toStringAsFixed(2)} | '
        '${v[1].toStringAsFixed(2)} | '
        '${(v[1] / v[0]).toStringAsFixed(2)}');
  });
}
