(*
Exercise 8.2.3

Use your structure SimpleTree from Exercise 8.2.2 to construct a tree with a
root labeled 1 and three children labeled 2, 3, and 4. Apply function subtree
[sic] to obtain the second subtree of the root of your tree.
*)

use "8.2/8.2.2.sml";

val t = SimpleTree.build(1, [
          SimpleTree.build(2, nil),
          SimpleTree.build(3, nil),
          SimpleTree.build(4, nil)
        ]);

SimpleTree.find(2, t);

