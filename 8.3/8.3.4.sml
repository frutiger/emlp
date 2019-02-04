(*
Exercise 8.3.4

Write a functor MakeHashFn that produces structures that are suitable as input
to the functor MakeHashTable of Exercise 8.3.3. In particular, MakeHashFn takes
only an integer b as input. Its output is a structure in which the type eltype
is defined to be string, the integer b is the same as the input b, and the hash
function h is the function h from Fig. 7.9. Use your functor makeHashFn [sic] to
create a structure HashFn100 for b = 100 and then apply your functor
MakeHashTable from Exercise 8.3.3 to structure HashFn100 to create a structure
Hash100 that is a 100-bucket hash table for strings.
*)

use "8.3/8.3.3.sml";

functor MakeHashFn(val b: int): HASHABLE
  =
  struct
    type eltype = string;
    val b = b;

    fun h1(b, nil)   = 0
      | h1(b, x::xs) = (ord(x) + h1(b, xs)) mod b;

    fun h x = h1(b, explode(x));
  end;

structure HashFn100 = MakeHashFn(val b = 100);

structure Hash100 = MakeHashTable(HashFn100);

