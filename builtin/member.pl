% Built in predicate
% member(?Elem, ?List)

member(X, [X | _]).

member(X, [_ | T]) :-
    member(X, T).
