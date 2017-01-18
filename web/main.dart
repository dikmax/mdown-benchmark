// Copyright (c) 2017, maksimdzikun. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:html';

import 'package:mdown_benchmark/mdown_benchmark.dart';

void log(String info) {
  print(info);
  querySelector('#output').appendText('$info\n');
}

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

final Map<String, List<String>> data = {
  'ohaskell': [
    'data/ohaskell/01-init.md',
    'data/ohaskell/02-haskell-faq.md',
    'data/ohaskell/03-this-book.md',
    'data/ohaskell/04-setup.md',
    'data/ohaskell/05-whales-n-turtle.md',
    'data/ohaskell/06-immutability-n-purity.md',
    'data/ohaskell/07-if-n-return.md',
    'data/ohaskell/08-choose-n-patterns.md',
    'data/ohaskell/09-let-n-where.md',
    'data/ohaskell/10-operators.md',
    'data/ohaskell/11-list.md',
    'data/ohaskell/12-tuple.md',
    'data/ohaskell/13-lambda-function.md',
    'data/ohaskell/14-function-composition.md',
    'data/ohaskell/15-hof.md',
    'data/ohaskell/16-hackage.md',
    'data/ohaskell/17-recursion.md',
    'data/ohaskell/18-laziness.md',
    'data/ohaskell/19-own-types.md',
    'data/ohaskell/20-adt.md',
    'data/ohaskell/21-adt-field-labels.md',
    'data/ohaskell/22-newtype.md',
    'data/ohaskell/23-type-constructor.md',
    'data/ohaskell/99-work-in-progress.md'
  ]
};

Future<List<double>> test(List<String> urls) async {
  final MapEmitter mdownResults = new MapEmitter("mdown");
  final MapEmitter markdownResults = new MapEmitter("markdown");

  RegExp nameRegExp = new RegExp(r'/(.*?)\.(md|markdown)$');

  for (String url in urls) {
    String name = nameRegExp.firstMatch(url)[1];
    log('Downloading: $name...');
    final String data = await HttpRequest.getString(url);
    log('Benchmarking: $name...');
    await new Future.delayed(new Duration());
    MdownBenchmark.main(name, data, mdownResults);
    log('mdown: ${mdownResults.scores[name]}');
    await new Future.delayed(new Duration());
    MarkdownBenchmark.main(name, data, markdownResults);
    log('markdown: ${markdownResults.scores[name]}');
  }

  double mdownAvg = mdownResults.report(log);
  double markdownAvg = markdownResults.report(log);

  if (mdownAvg < markdownAvg) {
    log('mdown is ${markdownAvg / mdownAvg} times faster');
  } else {
    log('mdown is ${mdownAvg / markdownAvg} times slower');
  }

  return <double>[mdownAvg, markdownAvg];
}

Future<dynamic> main() async {
  Map<String, List<double>> results = {};
  for (String lang in languages) {
    List<String> urls = [];
    for (int i = 1; i <= 9; ++i) {
      urls.add('data/progit-$lang/01-chapter$i.markdown');
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
