/*

  Двоичные деревья поиска AVL

  Дерево - связанный ацикличный граф.
  Корневой узел (Root) - начальный элемент дерева
  Узел (Node) - элемент в иерархии дерева
  Лист - элемент без дочерних элементов

  Binary Search Tree - BST.
  Двоичное дерево поиска. 

  Меньшие элементы идут налево.
  Большие элементы идут направо.

*/

import '../lecture_06/sorter.dart';
import 'tree/avl.dart';
import 'tree/bst.dart';

extension BSTSort on Sorter {
  void bstSort() {
    final bst = BSTree<int>();
    for (int i = 0; i < n; i++) {
      bst.insert(list[i]);
    }

    int i = 0;
    bst.dfs(bst.root, use: (val) {
      list[i] = val;
      i++;
    });
  }
}

extension AVLSort on Sorter {
  void avlSort() {
    final avl = AVLTree<int>();
    for (int i = 0; i < n; i++) {
      avl.insert(list[i]);
    }

    int i = 0;
    avl.dfs(avl.root, use: (val) {
      list[i] = val;
      i++;
    });
  }
}