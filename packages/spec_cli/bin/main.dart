import 'dart:math';

import 'package:spec_cli/src/renderer.dart';

void main() async {
  final renderer = BacktrackingRenderer();
  const sentence = 'W Szczebrzeszynie chrzaszcz brzmi w trzcinie';

  final words = sentence.split(' ');
  final longestWord = words.map((e) => e.length).reduce(max);

  for (var i = 1; i <= longestWord; i++) {
    final sb = StringBuffer();
    final renderWords =
        words.map((e) => e.substring(0, min(i, e.length))).toList();
    sb.writeAll(renderWords, '\n');

    renderer.renderFrame(sb.toString());
    await Future<void>.delayed(const Duration(milliseconds: 300));
  }
}
