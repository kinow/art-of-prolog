left_of(camera, bike).
left_of(glasshour, pencil).
left_of(butterfly, glasshour).
left_of(fish, butterfly).
above(pecil, bike).
above(butterfly, camera).

right_of(ObjectOnRight, ObjectOnLeft) :-
	left_of(ObjectOnLeft, ObjectOnRight).

below(Above, Below) :-
	above(Below, Above).
