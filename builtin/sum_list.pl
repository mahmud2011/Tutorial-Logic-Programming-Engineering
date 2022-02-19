% Built in predicate
% sum_list(+List, -Sum)

sum_list([], 0).

sum_list([H | T], S) :-
    sum_list(T, ST),
    S is H + ST.

% accumulator version

% sum_list(L, Sum) :-
%     sum_list(L, 0, Sum).

% sum_list([], Acc, Acc).

% sum_list([H | T], Acc, Sum) :-
%     NewAcc is Acc + H,
%     sum_list(T, NewAcc, Sum).
