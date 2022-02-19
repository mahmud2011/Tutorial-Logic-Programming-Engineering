% Exercise 5.1 [Simple arithmetic on lists]
% a) Define a predicate maxmember/2 that returns the maximum of the elements of a list.

maxmember(L, Max) :-
    max_member(Max, L).

% b) Write a predicate average/2 which computes the average over the numeric elements of a list. For this
% write an auxiliary predicate sum/2 for the sum of elements of a list.

average(L, Av) :-
    sum_list(L, S),
    length(L, Len),
    Av is S / Len.

% Exercise 5.2 [Sieve of Eratosthenes]
% Provide a Prolog predicate eratosthenes/2 that first generates all integers between 2 and a given upper
% bound and then eliminates all non-primes from the list. Your implementation should follow the idea of
% Eratosthenes Sieve 1. How many primes are there between 1 and one million? What ist the greatest prime
% lower than one million?

rm_factor(_, [], []) :- !.

rm_factor(N, [H | T], L) :-
    0 is mod(H, N), !,
    rm_factor(N, T, L).

rm_factor(N, [H | T], [H | L]) :-
    rm_factor(N, T, L).

eratosthenes(B, L) :-
    findall(X, between(2, B, X), NumL),
    eratosthenes(NumL, B, L).

eratosthenes([H | T], B, [H | TL]) :-
    H * H =< B, !,
    rm_factor(H, T, HL),
    eratosthenes(HL, B, TL).

eratosthenes(L, _, L).

% eratosthenes(1000000, L), length(L, Len), last(L, LP).

% Exercise 5.3 [Subset sum]
% Write a predicate subsetsum/3 that computes for a given list L and a given integer number n ∈ N a 
% sublist of L whose sum over all elements equals to n. The predicate should enumerate all solutions.

% Solution 1

subsetsum([TargetSum | _], TargetSum, [TargetSum]).

subsetsum([H | T], TargetSum, [H | TSum]) :-
    NewTargetSum is TargetSum - H,
    subsetsum(T, NewTargetSum, TSum).

subsetsum([_ | T], TargetSum, Sum) :-
    subsetsum(T, TargetSum, Sum).

% Solution 2

% mylist_power([], [[]]).

% mylist_power([H | T], P) :-
%     mylist_power(T, TP),
%     findall([H | X], member(X ,TP), HP),
%     append(TP, HP, P).

% subsetsum(L, TargetSum, SL) :-
%     mylist_power(L, PowSet),
%     findall(
%         PowSetElem, 
%         (
%             nth0(_, PowSet, PowSetElem),
%             length(PowSetElem, Len),
%             Len > 0,
%             sum_list(PowSetElem, SumPowSetElem),
%             SumPowSetElem == TargetSum
%         ), 
%         SL
%     ).
