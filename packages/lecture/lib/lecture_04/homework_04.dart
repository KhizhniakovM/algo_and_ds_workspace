/*
  Основные структуры данных
  ==================================================
  Add at the end of array

  Name              100_000        1_000_000        10_000_000          100_000_000         1_000_000_000

  SingleArray       20961 ms       /                /                   /                   /

  VectorArray(10)   2307 ms        /                /                   /                   /

  VectorArray(100)  202 ms         20142 ms         /                   /                   /

  FactorArray(2)    3 ms           14 ms             140 ms             1226 ms             14023 ms
  
  MatrixArray(10)   9 ms           35 ms             263 ms             2902 ms             45300 ms
  
  MatrixArray(1000) 5 ms           19 ms             158 ms             1571 ms             16527 ms

  SdkArray          2 ms           10 ms             117 ms             1037 ms             14048 ms

  Linked Lists

  OneWayLinkedList  5824 ms        /                 /                  /                   / 

  ==================================================
  Insert at random index                    at start index        at last index

  Name              100_000   1_000_000   / 100_000   1_000_000 / 100_000   1_000_000 
                                          /                     /
  SingleArray       26710 ms  /           / 30260 ms  /         / 21381 ms  /
                                          /                     /
  VectorArray(10)   6769 ms   /           / 11564 ms  /         / 2355 ms   /  
                                          /                     /
  VectorArray(100)  4972 ms   /           / 9768 ms   /         / 203 ms    21053 ms
                                          /                     /
  FactorArray(2)    4761 ms   /           / 9606 ms   /         / 4 ms      15 ms
                                          /                     /
  MatrixArray(10)   11915 ms  /           / 23634 ms  /         / 4 ms      18 ms
                                          /                     /
  MatrixArray(1000) 11795 ms  /           / 23593 ms  /         / 8 ms      17 ms 

  SdkArray          4320 ms   /           / 8760 ms   /         / 3 ms      14 ms 

  Linked Lists

  OneWayLinkedList  9933 ms   /           / 4 ms      12 ms     / 5750 ms   / 

  ==================================================
  Remove from random index                from start index      from last index

  Name              100_000   1_000_000   / 100_000   1_000_000 / 100_000   1_000_000 
                                          /                     /
  SingleArray       21584 ms  /           / 21382 ms  /         / 21457 ms  /
                                          /                     /
  VectorArray(10)   6466 ms   /           / 10881 ms  /         / 2261 ms   /  
                                          /                     /
  VectorArray(100)  4817 ms   /           / 9116 ms   /         / 223 ms    20646 ms
                                          /                     /
  FactorArray(2)    4459 ms   /           / 8888 ms   /         / 2 ms      9 ms
                                          /                     /
  MatrixArray(10)   10806 ms  /           / 21341 ms  /         / 4 ms      15 ms
                                          /                     /
  MatrixArray(1000) 10664 ms  /           / 21266 ms  /         / 3 ms      14 ms 
  
  SdkArray          4551 ms   /           / 10046 ms  /         / 1 ms      6 ms 

  Linked Lists

  OneWayLinkedList  3723 ms   /           / 0 ms      /         / 6176 ms   / 
*/