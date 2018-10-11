:- use_module(aleph), use_module(library(lists)).

%general setup predicate
setup(Filename,L) :- load_file(Filename), !, saturate(1,[].L).

%example setup for debugging
setup1 :- load_file(family).

%load a file using aleph's read_all/1 predicate
load_file(Filename) :- writeln(Filename),
		       read_all(Filename).

%saturate 10 examples in a previously loaded file using sat/1 predicate from aleph
saturate(X, L, L3) :- X < 10,
		      sat(X),
		      bottom(Y),
		      append(L,[Y],L2),
		      writeln(L2),
		      Z is X + 1, 
		      saturate(Z,L2,L3).
