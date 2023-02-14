natural_number(X):-
	between(0, inf, X).	

less_than_or_equal(X, Y):-
	natural_number(X),
	natural_number(Y),
	X =< Y.

plus_(X, Y, Z):-
	natural_number(X),
	natural_number(Y),
	Z is X + Y.

times(0, _, 0).
times(X, Y, Z):-
	natural_number(X),
	natural_number(Y),
	X > 0,
	X1 is X - 1,
	times(X1, Y, Z1),
	plus_(Y, Z1, Z).

exp(_, 0, 0).
exp(0, _, 0).
exp(N, 1, N).
exp(N, X, Y):-
	natural_number(N),
	natural_number(X),
	N > 0,
	N1 is N - 1,
	exp(N1, X, Z),
	times(Z, X, Y).
