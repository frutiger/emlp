(*
Exercise 8.6.2

Rewrite the functor MakeRandom so it only exports the function random(i), as
described in Fig. 8.24.
*)

(* RANDOM_DATA from Fig. 8.21 and MakeRandom from Fig. 8.22 follow *)
signature RANDOM_DATA = sig
  val n : int;
  val feed : int list;
end;

functor MakeRandom(Data: RANDOM_DATA):
  sig
    val init: unit -> unit;
    val getBit: unit -> int;
  end
  =
  struct
    open Data;
    open Array;

    val register = array(n,0);

    fun feedback1(nil) = ()
      | feedback1(x::xs) = (
          update(register,x,1-sub(register,x));
          feedback1(xs)
        );
    fun feedback() = feedback1(feed);

    fun shift1(0) = update(register,0,0)
      | shift1(i) = (
          update(register,i,sub(register,i-1));
          shift1(i-1)
        );
    fun shift() = shift1(n-1);

  fun init1(0) = (
        update(register,n-1,1);
        update(register,0,0)
      )
    | init1(i) = (
        update(register,i,0);
        init1(i-1)
      );
  fun init() = init1(n-2);

  fun getBit() =
    let
      val bit = sub(register,n-1);
    in (
      shift();
      if bit=1 then feedback() else ();
      bit
    )
  end;
end;

(* The function random(i) from Fig. 8.24 follows *)

structure MyData: RANDOM_DATA = struct
  val n = 20;
  val feed = [0,2,4,6,7,14,17,19];
end;

structure Random = MakeRandom(MyData);

open Random;

fun random1(0) = print("\n")
  | random1(i) = (
      if i mod 72 = 0 then print("\n") else ();
      print(Int.toString(getBit()));
      random1(i-1)
    );

fun random(i) = (
  init();
  random1(i)
);

(* The solution to Exercise 8.6.2 follows *)

functor MakeRandomOnly(Data: RANDOM_DATA):
  sig
    val random: int -> unit;
  end
  =
  struct
    open Data;
    open Array;

    val register = array(n,0);

    fun feedback1(nil) = ()
      | feedback1(x::xs) = (
          update(register,x,1-sub(register,x));
          feedback1(xs)
        );
    fun feedback() = feedback1(feed);

    fun shift1(0) = update(register,0,0)
      | shift1(i) = (
          update(register,i,sub(register,i-1));
          shift1(i-1)
        );
    fun shift() = shift1(n-1);

  fun init1(0) = (
        update(register,n-1,1);
        update(register,0,0)
      )
    | init1(i) = (
        update(register,i,0);
        init1(i-1)
      );
  fun init() = init1(n-2);

  fun getBit() =
    let
      val bit = sub(register,n-1);
    in (
      shift();
      if bit=1 then feedback() else ();
      bit
    )
  end;

  fun random1(0) = print("\n")
    | random1(i) = (
        if i mod 72 = 0 then print("\n") else ();
        print(Int.toString(getBit()));
        random1(i-1)
      );

  fun random(i) = (
    init();
    random1(i)
  );
end;

(* The function random(i) from Fig. 8.24 follows *)

structure RandomOnly = MakeRandomOnly(MyData);

