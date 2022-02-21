% Exercise 6.1 [Scalar product]
% Define a predicate scalar/3 which for two given vectors v1 = (a1,a2, . . . ,an) and v2 = (b1,b2, . . . ,bn)
% of integers (i.e., ai,bi ∈ Z, i = 1, . . . ,n) computes the scalar product. Please remind: The scalar
% product (aka dot product) of v1 and v2 is defined as

scalar([], [], 0).

scalar([H1 | T1], [H2 | T2], S) :-
    scalar(T1, T2, ST),
    S is H1 * H2 + ST.

% accumulator version

% scalar(L1, L2, S) :-
%     scalar(L1, L2, 0, S).

% scalar([], [], Acc, Acc).

% scalar([H1 | T1], [H2 | T2], Acc, S) :-
%     R is H1 * H2,
%     NewAcc is Acc + R,
%     scalar(T1, T2, NewAcc, S).

% Exercise 6.2 [Polynomials]
% Polynomials can be represented as lists of pairs of coefficients and exponents. For example the
% polynomial 4x5+2x3−x+27 can be represented as the following Prolog list: [(4,5), (2,3), (-1,1), (27,0)].

% a) Provide a predicate polyValue/3 that computes the polynomial for a given value of the variable x ∈ R.

polyValue(_, [], 0) :- !.

polyValue(X, [(C, E) | T], R) :-
    polyValue(X, T, RT),
    R is C * X**E + RT.

% b) Now provide an alternative predicate called horner/3 that does the same as polyValue/3, but follows
% the Horner scheme to compute the polynomial for a given value of the variable x ∈ R, e.g.,

% For this task you may, e.g., assume that the polynomial is given as a complete and sorted list whose
% order is increasing (or decreasing) in the exponents of the polynomial, i.e., the polynomial 4x5+2x3−
% x+27 would be given as the Prolog list [(27,0), (-1,1), (0,2), (2,3), (0,4), (4,5)].

horner(_, [(C, _)], C) :- !.

horner(X, [(C, _) | T], R) :-
    horner(X, T, TL),
    R is C + X * TL.

% c) Create a random generator for polynomials with a given maximum degree an maximum coefficient
% size. For this, provide a predicate randomPoly/3. The format of the list should be compatible with the
% parts a) and b) of this exercise.

randomPoly([(C, 0)], 0, CU) :-
    C is random(CU), !.

randomPoly(P, E, CU) :-
    NewE is E - 1,
    randomPoly(TP, NewE, CU),
    C is random(CU),
    H = [(C, E)],
    append(TP, H, P).

% d) Provide a predicate polyTester using randomPoly/3 from part c) to create random polynomials and
% compute the polynomial for random values of x ∈ N with the help of polyValue/3 and horner/3. Use
% the new predicate for comparing the two methods with respect to their efficiency. Hint: you may for
% example use the predicate time/1 or the SWI-Prolog profiler (cf. profile/1).

polyTester(E, CU, X) :-
    randomPoly(PL, E, CU),
    time(polyValue(X, PL, PVal)),
    time(horner(X, PL, HVal)),
    write('PL = '), writeln(PL),
    write('PVal = '), writeln(PVal),
    write('HVal = '), write(HVal).

% polyTester(E, CU, X) :-
%     randomPoly(PL, E, CU),
%     profile(polyValue(X, PL, PVal)),
%     profile(horner(X, PL, HVal)).
%     % time(horner(X, PL, HVal)),
%     % write('PL = '), writeln(PL),
%     % write('PVal = '), writeln(PVal),
%     % write('HVal = '), write(HVal).

% e) Write a predicate polysum/3 for adding two polynomials. Your solution should work independent of
% the ordering of pairs inside the two given lists.

polysum(L1, L2, L) :-
    sort(2, @=<, L1, SL1),
    sort(2, @=<, L2, SL2),
    polysumMerge(SL1, SL2, [], L).

polysumMerge(L1, [], Acc, L) :-
    append(Acc, L1, L).

polysumMerge([], L2, Acc, L) :-
    append(Acc, L2, L).

polysumMerge([(C1, E) | T1], [(C2, E) | T2], Acc, L) :-
    !,
    C is C1 + C2,
    append(Acc, [(C, E)], NewAcc),
    polysumMerge(T1, T2, NewAcc, L).

polysumMerge([(C1, E1) | T1], [(C2, E2) | T2], Acc, L) :-
    E1 < E2, !,
    append(Acc, [(C1, E1)], NewAcc),
    polysumMerge(T1, [(C2, E2) | T2], NewAcc, L).

polysumMerge([(C1, E1) | T1], [(C2, E2) | T2], Acc, L) :-
    append(Acc, [(C2, E2)], NewAcc),
    polysumMerge([(C1, E1) | T1], T2, NewAcc, L).
