#!/usr/bin/env swipl

father(terach, abraham). 	male(terach).
father(terach, nachor). 	male(abraham).
father(terach, haran). 		male(nachor).
father(abraham, isaac). 	male(haran).
father(haran, lot). 		male(isaac).
father(haran, milcah). 		male(lot).
father(haran, yiscah).
							female(sarah).
mother(sarah, isaac).		female(milcah).
							female(yiscah).

parent(X, Y) :- father(X, Y).
parent(X, Y) :- mother(X, Y).

% son(X, Y) :- father(X, Y), male(X).
% son(X, Y) :- mother(X, Y), male(X).
% daughter(X, Y) :- father(X, Y), female(X).
% daughter(X, Y) :- mother(X, Y), female(X).

son(X, Y) :- parent(X, Y), male(X).
daughter(X, Y) :- parent(X, Y), female(X).

% grandfather(X, Y) :- father(X, Z), father(Z, Y).

grandparent(X, Y) :- parent(X, Z), parent(Z, Y). 							

% ---

procreated(Man, Woman) :-
	father(Man, Child), mother(Woman, Child).

% brother(Brother, Sib) :-
%	parent(Parent, Brother), parent(Parent, Sib), male(Brother).
% brother(X, X). true, wrong!	
	
brother(Brother, Sib) :-
	Brother \== Sib,
	parent(Parent, Brother),
	parent(Parent, Brother),
	male(Brother).

	