natural_number(X):-
	between(0, inf, X).	

less_than_or_equal(X, Y):-
	natural_number(X),
	natural_number(Y),
	X =< Y.

plus_(X, Y, Z):-
	natural_number(X),
	natural_number(Y),
	natural_number(Z),
	Z is X + Y.
	