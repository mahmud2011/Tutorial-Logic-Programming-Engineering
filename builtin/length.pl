% Built in predicate
% length(?List, ?Length)

% base case
% no cut needed as there is no other match
length([], 0).

% don't need a cut as it's the last predicate
length([_ | T], L) :-
    length(T, LSub),
    L is 1 + LSub.
