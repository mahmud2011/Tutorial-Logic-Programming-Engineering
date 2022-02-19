% Built in predicate
% max_member(-Max, +List)

max_member(H, [H]) :- !.

max_member(Max, [H | T]) :-
    max_member(MaxT, T),
    H < MaxT, !,
    Max is MaxT.

max_member(H, [H | _]).

% accumulator version

% max_member(Max, [H | T]) :-
%     max_member(Max, H, T).

% max_member(Acc, Acc, []) :- !.

% max_member(Max, Acc, [H | T]) :-
%     H > Acc, !,
%     NewAcc is H,
%     max_member(Max, NewAcc, T).

% max_member(Max, Acc, [_ | T]) :-
%     max_member(Max, Acc, T).
