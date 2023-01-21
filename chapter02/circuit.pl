#!/usr/bin/env swipl

resistor(power, n1).
resistor(power, n2).

transistor(n2, ground, n1).
transistor(n3, n4, n2).
transistor(n5, ground, n4).

% inverter(Input,Output) <-
%   Output is the inversion of Input.
inverter(Input, Output) :-
	transistor(Input, ground, Output),
	resistor(power, Output).

% nand_gate(Inputl,Input2,Output) <-
%   Output is the logical nand of Inputi and Input2.
nand_gate(Input1, Input2, Output) :-
	transistor(Input1, X, Output),
	transistor(Input2 ,ground, X),
	resistor(power, Output).

% and_gate(Inputl,Iriput2,Output) <-
%   Output is the logical and of Input1 and Input2.
and_gate(Input1 ,Input2, Output) :-
	nand_gate(Input1 ,Input2, X),
	inverter(X ,Output).
