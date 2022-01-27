% Exercise 0.2 [Four colors]
% a) Define the four colors red, blue, yellow and green as facts color/1 in your program.

color(red).
color(blue).
color(yellow).
color(green).

% b) Define the predicate coloring(A,B) that evaluates to true if color(A) is different from color(B).

coloring(A, B) :-
    color(A),
    color(B),
    A \= B.

% c) Encode the following map into the predicate graphcolor/5.

graphcolor(A, B, C, D, E) :-
    coloring(A, B),
    coloring(A, D),
    coloring(A, E),
    coloring(B, C),
    coloring(B, D),
    coloring(B, E),
    coloring(C, D),
    coloring(C, E),
    coloring(D, E).

% e) Compute all possible four-colorings of the map above using the query
% “graphcolor(A,B,C,D,E).”. How many solutions are there?

% findall((A, B, C, D, E), graphcolor(A, B, C, D, E), L), length(L, Len), writeln(Len).
