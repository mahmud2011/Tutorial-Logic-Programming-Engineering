% Built in predicate
% nth1(?Index, ?List, ?Elem)

nth1(1, [H | _], H) :- !.

nth1(N, [_ | T], X) :-
    NN is N - 1,
    nth1(NN, T, X).
