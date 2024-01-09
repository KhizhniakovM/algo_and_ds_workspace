import 'dart:math';

import 'list/array.dart';

class ArrayTester {
  void testAdd(Array<int> array) {
    final stopwatch = Stopwatch();
    print('==================================================');
    print('${array.runtimeType.toString()}\n');

    for (int count = 10; count <= 1000000000; count *= 10) {
      print('Count: $count');
      stopwatch.start();
      for (int val = 0; val < count; val++) {
        array.add(val);
      }
      stopwatch.stop();
      array.clear();
      print('Time: ${stopwatch.elapsedMilliseconds} ms\n');
    }
  }

  void testInsertAtRandom(Array<int> array) {
    final stopwatch = Stopwatch();
    final random = Random();
    print('==================================================');
    print('Insert at random index\n');
    print('${array.runtimeType.toString()}\n');

    for (int count = 10; count <= 1000000; count *= 10) {
      print('Count: $count');
      stopwatch.start();
      for (int val = 0; val < count; val++) {
        array.insert(val, array.size == 0 ? 0 : random.nextInt(array.size + 1));
      }

      stopwatch.stop();
      array.clear();
      print('Time: ${stopwatch.elapsedMilliseconds} ms\n');
    }
  }

  void testInsertAtEnd(Array<int> array) {
    final stopwatch = Stopwatch();
    print('==================================================');
    print('Insert at last index\n');
    print('${array.runtimeType.toString()}\n');

    for (int count = 10; count <= 1000000; count *= 10) {
      print('Count: $count');
      stopwatch.start();
      for (int val = 0; val < count; val++) {
        array.insert(val, array.size);
      }

      stopwatch.stop();
      array.clear();
      print('Time: ${stopwatch.elapsedMilliseconds} ms\n');
    }
  }

  void testInsertAtStart(Array<int> array) {
    final stopwatch = Stopwatch();
    print('==================================================');
    print('Insert at first index\n');
    print('${array.runtimeType.toString()}\n');

    for (int count = 10; count <= 1000000; count *= 10) {
      print('Count: $count');
      stopwatch.start();
      for (int val = 0; val < count; val++) {
        array.insert(val, 0);
      }

      stopwatch.stop();
      array.clear();
      print('Time: ${stopwatch.elapsedMilliseconds} ms\n');
    }
  }

  void testRemoveFromRandom(Array<int> array) {
    final stopwatch = Stopwatch();
    final random = Random();

    print('==================================================');
    print('Remove from random index\n');
    print('${array.runtimeType.toString()}\n');

    for (int count = 10; count <= 1000000; count *= 10) {
      print('Count: $count');
      for (int val = 0; val < count; val++) {
        array.add(val);
      }

      stopwatch.start();
      for (int val = 0; val < count; val++) {
        array.remove(random.nextInt(array.size));
      }
      stopwatch.stop();
      array.clear();
      print('Time: ${stopwatch.elapsedMilliseconds} ms\n');
    }
  }

  void testRemoveFromStart(Array<int> array) {
    final stopwatch = Stopwatch();
    print('==================================================');
    print('Remove from start index\n');
    print('${array.runtimeType.toString()}\n');

    for (int count = 10; count <= 1000000; count *= 10) {
      print('Count: $count');
      for (int val = 0; val < count; val++) {
        array.add(val);
      }

      stopwatch.start();
      for (int val = 0; val < count; val++) {
        array.remove(0);
      }
      stopwatch.stop();
      array.clear();
      print('Time: ${stopwatch.elapsedMilliseconds} ms\n');
    }
  }

  void testRemoveFromEnd(Array<int> array) {
    final stopwatch = Stopwatch();

    print('==================================================');
    print('Remove from end index\n');
    print('${array.runtimeType.toString()}\n');

    for (int count = 10; count <= 1000000; count *= 10) {
      print('Count: $count');
      for (int val = 0; val < count; val++) {
        array.add(val);
      }

      stopwatch.start();
      for (int val = 0; val < count; val++) {
        array.remove(array.size - 1);
      }
      stopwatch.stop();
      array.clear();
      print('Time: ${stopwatch.elapsedMilliseconds} ms\n');
    }
  }
}
