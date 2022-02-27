% Exercise 8.1 [Fibonacci numbers revisited]

% a) Declare a dynamic predicate cachedfibonacci/2 (cf. dynamic/1) which serves to compute the n-th
% Fibonacci number. This time, the goal is to store the result of a computation of Fn in memory and
% make it available for future computations to avoid costly re-computations.

% To do so, write cachedfibonacci/2 as wrapper that 1) calls the implementation of the predicate
% fibonacci/2 from Exercise 2.3a and 2) inserts the result to the cache via asserta/1 on the dynamic
% predicate cachedfibonacci/2.

fibonacci(0, 1) :- !.

fibonacci(1, 2) :- !.

fibonacci(N, X) :-
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, X1),
    fibonacci(N2, X2),
    X is X1 + X2.

:- dynamic cachedfibonacci/2.

cachedfibonacci(N, X) :-
    fibonacci(N, X),
    asserta(cachedfibonacci(N, X) :- !).

% b) Provide a modified version of the predicate fibonacci/2 called fastfibonacci/2 such that no Fibonacci
% number is computed more often than once.

:- dynamic memory/2.

cachedfastfibonacci(N, X) :-
    % retractall(memory(_, _)),
    fastfibonacci(N, X).

fastfibonacci(0, 1) :- !.

fastfibonacci(1, 2) :- !.

fastfibonacci(N, X) :-
    memory(N, X), !.

fastfibonacci(N, X) :-
    N1 is N - 1,
    N2 is N - 2,
    fastfibonacci(N1, X1),
    fastfibonacci(N2, X2),
    X is X1 + X2,
    asserta(memory(N, X)).

% Solution 2

% :- table fibonacci/2.

% fibonacci(0, 1) :- !.

% fibonacci(1, 2) :- !.

% fibonacci(N, X) :-
%     N1 is N - 1,
%     N2 is N - 2,
%     fibonacci(N1, X1),
%     fibonacci(N2, X2),
%     X is X1 + X2.
