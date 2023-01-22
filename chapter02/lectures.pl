


day(complexity, monday).
start_time(complexity, 9).
finish_time(complexity, 11).
lecturer(complexity, harel).
building(complexity, feinberg).
room(complexity, a).

day(algorithms, thursday).
start_time(algorithms, 13).
finish_time(algorithms, 15).
lecturer(algorithms, jacob).
building(algorithms, vertex).
room(algorithms, c).

% Who teaches on Monday?
% ?- teaches(Professor, monday).
teaches(Lecturer, Day) :-
	lecturer(Course, Lecturer), day(Course, Day).

% Where is this class?
% ?- location(algorithms, Building).
location(Course, Building) :-
	building(Course, Building).

% What hours is the lecturer busy?
% ?- busy(jacob, Time).
busy(Lecturer, Time) :-
	lecturer(Course, Lecturer),
	start_time(Course, From),
	finish_time(Course, To),
	ToMinus is To-1,
	between(From, ToMinus, Time).
