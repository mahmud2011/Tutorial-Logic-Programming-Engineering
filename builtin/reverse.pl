% Built in predicate
% reverse(?List1, ?List2)

% base case
% empty list is already reversed
% no cut needed as there is no other match
reverse([], []).

% don't need a cut as it's the last predicate
reverse([Head | Tail], List) :-
    reverse(Tail, X),
    append(X, [Head], List).

% accumulator version

% reverse(List, RevList) :-
%     reverse(List, [], RevList).

% reverse([], Acc, Acc).

% reverse([H | T], Acc, RevList) :-
%     reverse(T, [H | Acc], RevList).
