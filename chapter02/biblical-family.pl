#!/usr/bin/env swipl

% Grounded facts.

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

% Rules.

parent(Father, Child) :- father(Father, Child).
parent(Mother, Child) :- mother(Mother, Child).

% son(X, Y) :- father(X, Y), male(X).
% son(X, Y) :- mother(X, Y), male(X).
% daughter(X, Y) :- father(X, Y), female(X).
% daughter(X, Y) :- mother(X, Y), female(X).

son(Son, Parent) :- parent(Parent, Son), male(Son).
daughter(Daughter, Parent) :- parent(Parent, Daughter), female(Daughter).

% grandfather(X, Y) :- father(X, Z), father(Z, Y).

grandparent(Grandparent, Grandchild) :- parent(Grandparent, Parent), parent(Parent, Grandchild). 							

% ---

procreated(Man, Woman) :-
	father(Man, Child), mother(Woman, Child).

% brother(Brother, Sib) :-
%	parent(Parent, Brother), parent(Parent, Sib), male(Brother).
% brother(X, X). true, wrong!	
	
brother(Brother, Sib) :-
	Brother \== Sib,
	parent(Parent, Brother),
	parent(Parent, Sib),
	male(Brother).

% Exercises 2.1.1

sister(Sister, Sib) :-
	Sister \== Sib,
	parent(Parent, Sister),
	parent(Parent, Sib),
	female(Sister).

sibling(Sibling1, Sibling2) :-
	Sibling1 \== Sibling2,
	parent(Parent, Sibling1),
	parent(Parent, Sibling2).
	
uncle(Uncle, NephewOrNiece) :-
	sibling(Uncle, Parent),
	Uncle \== Parent,
	parent(Parent, NephewOrNiece),
	male(Uncle).

niece(Niece, Uncle) :-
	uncle(Uncle, Niece),
	female(Niece).

married_couple(Wife, Husband) :-
	procreated(Husband, Wife).

mother_in_law(MotherInLaw, Spouse) :-
	married_couple(Wife, Spouse),
	mother(MotherInLaw, Wife).
	
father_in_law(FatherInLaw, Spouse) :-
	married_couple(Spouse, Husband),
	father(FatherInLaw, Husband).

% Recursive rules
ancestor(Ancestor, Descendant) :-
	parent(Ancestor, Descendant).
ancestor(Ancestor, Descendant) :-
	ancestor(Ancestor, Person), ancestor(Person, Descendant).
