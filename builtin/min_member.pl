% Built in predicate
% min_member(-Min, +List)

min_member(H, [H]) :- !.

min_member(Min, [H | T]) :-
    min_member(MinT, T),
    H > MinT, !,
    Min is MinT.

min_member(H, [H | _]).

% accumulator version

% min_member(Min, [H | T]) :-
%     min_member(Min, H, T).

% min_member(Acc, Acc, []) :- !.

% min_member(Min, Acc, [H | T]) :-
%     H < Acc, !,
%     NewAcc is H,
%     min_member(Min, NewAcc, T).

% min_member(Min, Acc, [_ | T]) :-
%     min_member(Min, Acc, T).
