% Exercise 3.1 [Primality test]
% a) Write a Prolog predicate prime/1 which is true for a given natural number n if the number is prime.
% If n is not prime, print out the smallest factor k ∈ N, k > 1 that divides n, i.e., n mod k ≡ 0.

prime(2) :- !.

prime(N) :-
    N > 2,
    \+ has_factor(N, 2).

has_factor(N, X) :-
    0 is mod(N, X), !,
    write(X), write(' is a factor of '), write(N), write('.').

has_factor(N, X) :-
    NX is X + 1,
    NX * NX =< N,
    has_factor(N, NX).

% b) Provide a predicate nthprime/2 that returns the n-th prime number. What is the 10001-th prime
% number?

nthprime(N, X) :-
    nthprime(N, 1, 2, X).

nthprime(N, N, CX, X) :-
    prime(CX),
    X is CX, !.

nthprime(N, CN, CX, X) :-
    prime(CX), !,
    NCN is CN + 1,
    NCX is CX + 1,
    nthprime(N, NCN, NCX, X).

nthprime(N, CN, CX, X) :-
    NCX is CX + 1,
    nthprime(N, CN, NCX, X).

% c) Provide a predicate sumprimes/2 that allows computing the sum of all prime numbers below a given
% threshold. What is the sum of all prime numbers below two million?

sumprimes(T, X) :-
    sumprimes(T, 1, 0, X).

sumprimes(T, T, X, X) :- !.

sumprimes(T, N, S, X) :-
    prime(N), !,
    NN is N + 1,
    NS is S + N,
    sumprimes(T, NN, NS, X).

sumprimes(T, N, S, X) :-
    NN is N + 1,
    sumprimes(T, NN, S, X).

% Exercise 3.2 [Analyze list]
% Create a new file mylist.pl and write a Prolog predicate mylist_analyze/1 that takes a list as an
% argument and prints out the head and tail of the list together with the length of the list on the
% screen. If the given list is empty, the predicate should report on this fact. If the argument term
% is not a list the predicate should fail.

mylist_analyze([]) :-
    writeln('This is an empty list.'),
    writeln('The length of the list is 0.').

mylist_analyze([H | T]) :-
    length([H | T], L),
    write('This is the head of your list: '), write(H), write('.\n'),
    write('This is the tail of your list: '), write(T), write('.\n'),
    write('The length of the list is '), write(L), write('.').

% Exercise 3.3 [Integer ranges]
% a) Provide a Prolog predicate range/3 that generates all integers between a given lower and a given
% upper bound and puts them into a list. If the upper bound specified is less than the given lower bound,
% the empty list should be returned.

% Solution 1

% range(L, H, []) :-
%     L > H, !.

% range(L, L, [L]) :- !.

% range(L, H, [L | X]) :-
%     NL is L + 1,
%     range(NL, H, X).

% Solution 2

range(L, H, X) :-
    findall(N, between(L, H, N), X).

% b) Now provide a predicate called reverse_range/3 that creates a list in decreasing order rather than
% increasing order.

% Solution 1

% reverse_range(L, H, []) :-
%     L > H, !.

% reverse_range(L, L, [L]) :- !.

% reverse_range(L, H, X) :-
%     NL is L + 1,
%     reverse_range(NL, H, RL),
%     append(RL, [L], X).

% Solution 2

reverse_range(L, H, X) :-
    reverse_range(L, H, [], X).

reverse_range(L, H, Acc, Acc) :-
    L > H, !.

reverse_range(L, H, Acc, List) :-
    NL is L + 1,
    reverse_range(NL, H, [L | Acc], List).

% c) Write a Prolog predicate divisors/2 to compute the list of all divisors for a given natural number.

% Solution 1

% divisors(N, X) :-
%     divisors(N, 1, [], X).

% divisors(N, N, Acc, X) :-
%     append(Acc, [N], X), !.

% divisors(N, Candidate, Acc, X) :-
%     0 is mod(N, Candidate), !,
%     NCandidate is Candidate + 1,
%     append(Acc, [Candidate], NAcc),
%     divisors(N, NCandidate, NAcc, X).

% divisors(N, Candidate, Acc, X) :-
%     NCandidate is Candidate + 1,
%     divisors(N, NCandidate, Acc, X).

% Solution 2

divisors(N, X) :-
    findall(C, (between(1, N, C), 0 is mod(N, C)), X).
