(*
Exercise 6.2.7

We can define a graph with nodes of some type 'node as a list of pairs. Each
pair consists of a node of type 'node and a list of its successor nodes.

a) Write this type definition.
*)

type 'node graph = ('node * 'node list) list;

(*
b) Write a function succ(a,G) that produces the set (represented by a list)
   of successors of node a in graph G. If a is not a node of G, then raise the
   exception NotANode.
*)

exception NotANode;

fun succ(a, nil)         = raise NotANode
  | succ(a, (x, xs)::gs) = if a=x then xs else succ(a, gs);

(*
c) Write a function search(a, G) that finds the set of nodes reachable from
   node a in graph G, including a itself. Hint: It helps to write an auxiliary
   function search1(L,R,G) that finds all the nodes that are reachable from one
   or more of the nodes on list L in graph G, without going through a node on
   the list R. Function search1 then returns all the nodes it has reached plus
   all the nodes on R. We may use parameter R of search1 to keep track of nodes
   we have already reached in our search. We thus avoid getting trapped in
   infinite loops, even if the graph G has cycles.
*)

fun exists(x, nil)   = false
  | exists(x, y::ys) = x=y orelse exists(x, ys);

fun search1(nil,   R, G) = nil
  | search1(l::ls, R, G) =
      if exists(l, R)
      then search1(ls, R, G)
      else l::search1(ls @ (succ(l, G) handle NotANode => []), l::R, G)

fun search(a, G) = search1([a], [], G);

