% Exercise 4.1 [Reimplementation of list operations]
% a) Provide a Prolog predicate for computing/ deciding the length of a given list.

mylist_length(L, X) :-
    length(L, X).

% b) Write a predicate mylist_member/2 that decides membership of an element to list.

mylist_member(X, L) :-
    member(X, L), !.

% c) Write a predicate mylist_occurrences/3 that counts the number of occurrences of an element within
% a list.

mylist_occurrences(_, [], 0) :- !.

mylist_occurrences(X, [H | T], N) :-
    X = H, !,
    mylist_occurrences(X, T, SN),
    N is 1 + SN.

mylist_occurrences(X, [_ | T], N) :-
    mylist_occurrences(X, T, SN),
    N is 0 + SN.

% d) Write a predicate mylist_last/2 that returns the last element of a list.

mylist_last(X, L) :-
    last(L, X).

% e) Provide your own predicate mylist_element_at/3 which returns the n-th element of a list. The index
% of the head of a list should be 1.

mylist_element_at(L, N, X) :-
    nth1(N, L, X).

% f) Write a Prolog predicate mylist_add/3 that allows adding an element to a list without
% introducing duplicates. Check what Prolog returns for the following query:
% mylist_add(a,[a,b,c,a],[a,a,b,c,a]).

mylist_add(X, L, L) :-
    member(X, L), !.

mylist_add(X, L, [X | L]).

% true

% g) Provide a Prolog predicate mylist_remove/3 that allows to remove all occurrences of an element from
% a given list.

mylist_remove(_, [], []) :- !.

mylist_remove(H, [H | T], L) :-
    !, mylist_remove(H, T, L).

mylist_remove(X, [H | T], [H | NL]) :-
    mylist_remove(X, T, NL).

% accumulator version

% mylist_remove(X, L, NL) :-
%     mylist_remove(X, L, [], NL).

% mylist_remove(_, [], Acc, Acc) :- !.

% mylist_remove(H, [H | T], Acc, NL) :-
%     !, mylist_remove(H, T, Acc, NL).

% mylist_remove(X, [H | T], Acc, NL) :-
%     append(Acc, [H], NewAcc),
%     mylist_remove(X, T, NewAcc, NL).

% h) Provide a predicate mylist_remove_duplicates/2 for removing duplicates from list.

% Solution 1

% mylist_remove_duplicates([], []).

% mylist_remove_duplicates([H | T], [H | L]) :-
%     mylist_remove(H, T, RHL),
%     mylist_remove_duplicates(RHL, L).

% Solution 2

mylist_remove_duplicates([], []).

mylist_remove_duplicates([H | T], L) :-
    member(H, T), !,
    mylist_remove_duplicates(T, L).

mylist_remove_duplicates([H | T], [H | L]) :-
    mylist_remove_duplicates(T, L).

% i) Write a predicate mylist_replace/4 that allows replacing all occurrences of an element in list with
% another element.

mylist_replace([], _, _, []) :- !.

mylist_replace([O | T], O, N, [N | L]) :-
    !, mylist_replace(T, O, N, L).

mylist_replace([H | T], O, N, [H | NL]) :-
    mylist_replace(T, O, N, NL).

% accumulator version

% mylist_replace(L, O, N, NL) :-
%     mylist_replace(L, O, N, [], NL).

% mylist_replace([], _, _, Acc, Acc) :- !.

% mylist_replace([O | T], O, N, Acc, NL) :-
%     !, append(Acc, [N], NewAcc),
%     mylist_replace(T, O, N, NewAcc, NL).

% mylist_replace([H | T], O, N, Acc, NL) :-
%     append(Acc, [H], NewAcc),
%     mylist_replace(T, O, N, NewAcc, NL).

% j) Provide a predicate mylist_concat/3 for list concatenation.

% Solution 1

% mylist_concat(L1, [], L1) :- !.

% mylist_concat([], L2, L2).

% mylist_concat([H1 | T1], L2, [H1 | L]) :-
%     mylist_concat(T1, L2, L).

% Solution 2

mylist_concat(L1, L2, L) :-
    append(L1, L2, L).

% k) Write a Prolog predicate mylist_reverse/2 for reversing a list. Define a predicate mylist_palindrome/1
% on the basis of mylist_reverse/2 that decides whether a given list is a palindrome.

mylist_reverse(L, RL) :-
    reverse(L, RL).

mylist_palindrome(L) :-
    mylist_reverse(L, L).

% Exercise 4.2 [Powerset]
% Provide a predicate mylist_power/2 for creating the powerset of a list (interpreted as set).

% Solution 1

mylist_power([], [[]]).

mylist_power([H | T], P) :-
    mylist_power(T, TP),
    findall([H | X], member(X ,TP), HP),
    append(TP, HP, P).

% Solution 2

% mylist_power(L, P) :-
%     findall(X, subseq(X, L), P).

% subseq([], []).

% subseq([], [_| _]).

% subseq([X | Xs], [X | Ys]) :-
%     subseq(Xs, Ys).

% subseq([X | Xs], [_| Ys]) :-
%     append(_, [X | Zs], Ys),
%     subseq(Xs, Zs).

% Exercise 4.3 [List permutations]
% Provide a predicate mylist_permutation/2 that enumerates all permutations of a list.

mylist_permutation(L, P) :-
    permutation(L, P).
