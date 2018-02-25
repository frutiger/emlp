(*
Exercise 3.6.2

One problem with komult is that for small n it wastes time, compared with the
straightforward approach for polynomial multiplication.  Rewrite komult so that
it calls pmult to multiply polynomials whose length is below some limit.
Experiment with running times as in Exercise 3.6.1 to find the limit below which
it makes sense to use pmult, and adjust your function accordingly.
*)

use "3.6/3.6.1.sml";

(*
$ ./3.6/3.6.2.sh 200 50 400 200 50 400
komult
	200	250	300	350	400
200	0.126	0.120	0.123	0.122	0.122
250	0.128	0.116	0.120	0.116	0.114
300	0.124	0.120	0.122	0.117	0.119
350	0.127	0.122	0.112	0.118	0.120
400	0.120	0.116	0.121	0.116	0.121

pmult
	200	250	300	350	400
200	0.124	0.122	0.117	0.132	0.124
250	0.125	0.119	0.124	0.126	0.131
300	0.126	0.125	0.126	0.124	0.130
350	0.131	0.130	0.129	0.129	0.128
400	0.128	0.131	0.126	0.133	0.128

The above data indicates that the lengths of both polynomials have to be greater
than some rough threshold of 300 for komult to be faster.
*)

fun fastmult(P, Q) = if length(P) > 300 andalso length(Q) > 300
                     then komult(P, Q) else pmult(P, Q);

