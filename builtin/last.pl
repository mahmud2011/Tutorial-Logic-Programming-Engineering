% Built in predicate
% last(?List, ?Last)

last([H], H) :- !.

last([_ | T], X) :-
    last(T, X).
