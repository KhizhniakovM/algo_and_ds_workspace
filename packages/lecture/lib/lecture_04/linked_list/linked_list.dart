// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../list/array.dart';

abstract interface class LinkedList<T> implements Array<T>{
  ListNode<T>? head;
}

abstract interface class ListNode<T> {
  T value;
  ListNode<T>? next;

  ListNode({
    required this.value,
    this.next,
  });
}
