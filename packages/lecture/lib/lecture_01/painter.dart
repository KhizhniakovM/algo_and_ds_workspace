import 'dart:math';

import 'package:dart_console/dart_console.dart';

typedef SpellExpression = bool Function(int x, int y);

class Painter {
  final _console = Console()..clearScreen();
  final _map = <(int, int), Object?>{};

  int get size => 30;
  int get width => _console.windowWidth;
  int get height => _console.windowHeight;

  Future<void> drawPoint(int column, int row, Object v) async {
    _map[(column, row)] = v;
    _console.cursorPosition = Coordinate(row, column);
    _console.write(v);
    await Future<void>.delayed(const Duration(milliseconds: 10));
  }

  bool isPointEmpty(int x, int y) {
    if (x < 0) return false;
    if (y < 0) return false;
    if (x > width - 1) return false;
    if (y > height - 1) return false;
    return _map[(x, y)] == null;
  }

  Future<void> addRandomPixels() async {
    final random = Random();
    _console.setForegroundColor(ConsoleColor.red);
    for (int i = 0; i < 400; i++) {
      final x = random.nextInt(width);
      final y = random.nextInt(height);
      if (x == width ~/ 2 && y == height ~/ 2) break;
      await drawPoint(x, y, 'X');
    }
    _console.setForegroundColor(ConsoleColor.white);
  }

  Future<void> drawHLine(int y) async {
    for (int x = 0; x < size; x++) {
      await drawPoint(x, y, '#');
    }
  }

  Future<void> drawVLine(int x) async {
    for (int y = 0; y < size; y++) {
      await drawPoint(x, y, '#');
    }
  }

  Future<void> drawFrame() async {
    await drawHLine(0);
    await drawHLine(size - 1);
    await drawVLine(0);
    await drawVLine(size - 1);
  }

  // Magician
  Future<void> spell({required SpellExpression expression}) async {
    for (int x = 0; x < size; x++) {
      for (int y = 0; y < size; y++) {
        if (expression(x, y)) {
          await drawPoint(x, y, '#');
        } else {
          await drawPoint(x, y, '.');
        }
      }
    }
  }
}
