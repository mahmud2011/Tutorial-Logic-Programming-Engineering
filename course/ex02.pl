% Exercise 2.3 [Fibonacci numbers]
% a) Write a Prolog predicate fibonacci/2 to compute the n-th Fibonacci number.
% The Fibonacci sequence is defined as follows: F0 = 1, F1 = 2, and Fn = Fn−1 + Fn−2 for n >= 2.

fibonacci(0, 1) :- !.

fibonacci(1, 2) :- !.

fibonacci(N, X) :-
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, X1),
    fibonacci(N2, X2),
    X is X1 + X2.

% b) Provide a predicate fibonacci/4 that computes the n-th Fibonacci number assuming that F0 = x0 and
% F1 = x1, where x0, x1 are given as parameters, i.e, F0 = x0, F1 = x1, and Fn = Fn−1 + Fn−2 for n >= 2.
% The predicate should have the format: fibonacci(N, X1, X2, FN). Rebase your predicate fibonacci/2
% on fibonacci/4.

fibonacci(0, X1, _, X1) :- !.

fibonacci(1, _, X2, X2) :- !.

fibonacci(N, X1, X2, FN) :-
    fibonacci(N, 2, X1, X2, FN).

fibonacci(N, N, X1, X2, FN) :-
    FN is X1 + X2, !.

fibonacci(N, CN, X1, X2, FN) :-
    NN is CN + 1,
    NX2 is X1 + X2,
    fibonacci(N, NN, X2, NX2, FN).

% rebase fibonacci/2
% fibonacci(N, X) : − fibonacci(N, 1, 2, X).

% c) Find a solution to the following problem1: by considering the terms in the Fibonacci sequence whose
% values do not exceed a certain bound B, what is the sum of the even-valued terms? E.g., if B = 10 then,
% as F5 = 13 > B, only F1 = 2 and F4 = 8 are being summed and the result will be 10. Provide a predicate
% fibsum/2 that computes the sum for a given bound. What is the sum if the bound is 4 million?

fibsum(B, Sum) :-
    fibsum(B, 1, 2, 0, Sum).

fibsum(B, X1, _, CS, CS) :-
    X1 > B, !.

fibsum(B, X1, X2, CS, Sum) :-
    0 is mod(X1, 2), !,
    NCS is CS + X1,
    NX2 is X1 + X2,
    fibsum(B, X2, NX2, NCS, Sum).

fibsum(B, X1, X2, CS, Sum) :-
    NX2 is X1 + X2,
    fibsum(B, X2, NX2, CS, Sum).

% d) Find a solution to the following problem2: the 10th Fibonacci number F10 = 144 is the first term
% to contain three digits. Provide a predicate fibdigits/2 that returns the first term in the Fibonacci
% sequence that has n ∈ N digits. What is the first term in the Fibonacci sequence to contain 1000 digits?

fibdigits(D, X) :-
    N is 10**(D-1),
    fibdigits(1, 2, N, X).

fibdigits(X1, _, N, X1) :-
    X1 >= N, !.

fibdigits(X1, X2, N, X) :-
    NX2 is X1 + X2,
    fibdigits(X2, NX2, N, X).
