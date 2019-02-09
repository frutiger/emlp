(*
Exercise 8.6.3

Rewrite the functor MakeRandom so that it may be initialized to any desired
contents of the cells, instead of only to 00...01.
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

(* The solution to Exercise 8.6.2 follows *)

functor MakeRandomWithSeed(Info: sig
                                   structure Data: RANDOM_DATA;
                                   val seed: int list;
                                 end):
  sig
    val init: unit -> unit;
    val getBit: unit -> int;
  end
  =
  struct
    open Info.Data;
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

  fun init1(i, nil) = ()
    | init1(i, x::xs) = (
        update(register, i, x);
        init1(i+1, xs)
      );
  fun init() = init1(0, Info.seed)

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
