library mdown_benchmark;

import 'dart:collection';
import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:mdown/mdown.dart';
import 'package:markdown/markdown.dart' as markdown;

typedef void Writer(String info);

class MapEmitter implements ScoreEmitter {
  String name;
  Map<String, double> scores = new HashMap<String, double>();

  MapEmitter(this.name);

  @override
  void emit(String testName, double value) {
    scores[testName] = value;
  }

  double report([Writer write = print]) {
    write("$name: ");
    final double sum = scores.values.reduce((double v1, double v2) => v1 + v2);
    write(" - sum: $sum");
    final double avg = sum / scores.length;
    write(" - avg: $avg");
    return avg;
  }
}

class MdownBenchmark extends BenchmarkBase {
  String data;

  /// Constructor.
  MdownBenchmark(String name, this.data, ScoreEmitter emitter)
      : super(name, emitter: emitter);

  static void main(String name, String data, ScoreEmitter emitter) {
    new MdownBenchmark(name, data, emitter).report();
  }

  // The benchmark code.
  @override
  void run() {
    markdownToHtml(data);
  }
}

class MarkdownBenchmark extends BenchmarkBase {
  String data;

  /// Constructor.
  MarkdownBenchmark(String name, this.data, ScoreEmitter emitter)
      : super(name, emitter: emitter);

  static void main(String name, String data, ScoreEmitter emitter) {
    new MarkdownBenchmark(name, data, emitter).report();
  }

  // The benchmark code.
  @override
  void run() {
    markdown.markdownToHtml(data,
        extensionSet: markdown.ExtensionSet.commonMark);
  }
}

void printResults(Map<String, List<double>> results) {
  List<double> total = <double>[0.0, 0.0];
  results.forEach((String k, List<double> v) {
    total[0] += v[0];
    total[1] += v[1];
    final double ratio = v[1] / v[0];
    String ratioString = 'x${ratio.toStringAsFixed(2)}';
    if (ratio < 1) {
      ratioString = '*$ratioString*';
    }
    print(' $k | '
        '${v[0].toStringAsFixed(2)} | '
        '${v[1].toStringAsFixed(2)} | '
        '$ratioString');
  });
  print(' **Total** | '
      '${total[0].toStringAsFixed(2)} | '
      '${total[1].toStringAsFixed(2)} |'
      '**x${(total[1] / total[0]).toStringAsFixed(2)}**');
}
