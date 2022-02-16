% Built in predicate
% permutation(?Xs, ?Ys)

permutation([], []).

permutation(L, [E | P]) :-
    select(E, L, T),
    permutation(T, P).
