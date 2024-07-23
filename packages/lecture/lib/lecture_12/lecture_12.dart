import '../lecture_06/sorter.dart';
import 'tree/treap.dart';

extension TreapSort on Sorter {
  void treapSort() {
    final treap = Treap<int>();
    for (int i = 0; i < n; i++) {
      treap.insert(list[i]);
    }

    int i = 0;
    treap.dfs(use: (node) {
      list[i] = node.value;
      i++;
    });
  }
}
