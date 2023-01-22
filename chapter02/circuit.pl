#!/usr/bin/env swipl

% resistor (R,Node1, Node2) -
%   R is a resistor between Node1 and Node2.

resistor(r1, power, n1).
resistor(r2, power, n2).

% transistor ( T,Gate,Source,D rain) *
%   T is a transistor whose gate is Gate,
%   source is Source, and drain is Drain.

transistor(t1, n2, ground, n1).
transistor(t2, n3, n4, n2).
transistor(t3, n5, ground, n4).

% inverter(I, Input,Output) <-
%   I is an inverter that inverts In put to Output.
%   Output is the inversion of Input.
inverter(inv(T, R), Input, Output) :-
	transistor(T, Input, ground, Output),
	resistor(R, power, Output).

% nand_gate(Nand, Inputl,Input2,Output) <-
%   Nand is a gate forming the logical nand, Output, of Input1 and Input2.
%   Output is the logical nand of Input1 and Input2.
nand_gate(nand(T1, T2, R), Input1, Input2, Output) :-
	transistor(T1, Input1, X, Output),
	transistor(T2, Input2 ,ground, X),
	resistor(R, power, Output).

% and_gate(And, Inputl,Iriput2,Output) <-
%   And is a gate forming the logical and, Output, of Input1 and Input2.
%   Output is the logical and of Input1 and Input2.
and_gate(Input1 ,Input2, Output) :-
	nand_gate(Input1 ,Input2, X),
	inverter(X ,Output).
