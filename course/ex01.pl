% Exercise 1.2 [Distance of two points in the 2-dimensional plane]
% Provide a Prolog predicate distance/3 to calculate the distance between two
% points in the 2-dimensional plane. The points are given as pairs of coordinates.

distance((X1, Y1), (X2, Y2), D) :-
    number(X1),
    number(Y1),
    number(X2),
    number(Y2),
    D is sqrt((X1 - X2)**2 + (Y1 - Y2)**2).

% Exercise 1.3 [Euclid’s algorithm]
% a) Implement the naive version of Euclid’s algorithm for computing the greatest common
% divisor (GCD) of two non-negative integers, according to the following recursive definition:

gcd(A, A, A) :- !.

gcd(A, B, G) :-
    A > B, !,
    A1 is A-B,
    gcd(A1, B, G).

gcd(A, B, G) :-
    A < B,
    B1 is B-A,
    gcd(A, B1, G).

% b) Provide a predicate euclid/3 with the same interface and usage as gcd/3 that uses
% modulo rather than repeated subtraction, according to the following alternative recursive
% definition of the GCD:

euclid(A, 0, A) :- !.

euclid(A, B, G) :-
    AM is mod(A, B),
    euclid(B, AM, G).

% c) Provide a predicate ext_euclid/3 for the extended Euclidian algorithm that allows
% computing the triple ⟨g,s,t⟩ with g = gcd(a,b) = s · a + t · b. The new predicate can
% be defined according to the following recursive definition:

ext_euclid(A, 0, (A, 1, 0)) :- !.

ext_euclid(A, B, (G, S, T)) :-
    AM is mod(A, B),
    ext_euclid(B, AM, (GP, SP, TP)),
    G is GP,
    S is TP,
    T is SP - TP * (A // B).

% d) Provide a Prolog predicate lcm/3 for the least common multiple (LCM), where lcm(a, b)

lcm(A, B, L) :-
    euclid(A, B, G),
    L is A * B / G.
