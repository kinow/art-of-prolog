edge(a, b).		edge(a, c).		edge(b, d).
edge(c, d).		edge(d, e).		edge(f, g).

% connected(Nodel,Node2) -
%   Nodel is connected to Node2 in the
%   graph defined by the edge/2 relation.
connected(Node, Node).
connected(Node1, Node2) :-
	edge(Node1, Node2).
connected(Node1, Node2) :-
	edge(Node1, Link), connected(Link, Node2).
	