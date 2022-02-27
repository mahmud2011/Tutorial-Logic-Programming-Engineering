neighbor(I, IP) :- IP is I - 1.
neighbor(I, IP) :- IP is I + 1.

colors([pink, green, purple, orange, blue, red, white, yellow, black]).
rentiers([dasher, dancer, prancer, cupid, comet, donner, blitzen, vixen, rudolph]).

solution(S) :-
    S = (R, C),
    R = [_| _], length(R, 9),
    C = [_| _], length(C, 9),

    % 2
    nth1(9, R, blitzen),

    % 3
    nth1(1, C, blue),

    % 5
    nth1(5, C, green),

    % 10
    nth1(2, C, yellow),

    % 14
    nth1(4, C, pink),

    % 1
    nth1(X1, R, vixen),
    neighbor(X1, X1N),
    nth1(X1N, R, prancer),
    nth1(X1, C, pink),

    % 4
    nth1(X4, C, red),
    nth1(X4, R, donner),

    % 6
    nth1(X6, C, green),
    neighbor(X6, X6N),
    nth1(X6N, R, comet),

    % 7
    nth1(X7, C, purple),
    nth1(X7, R, cupid),

    % 8
    nth1(X8, R, dancer),
    not(nth1(X8, C, black)),

    % 9
    nth1(X9, R, prancer),
    neighbor(X9, X9N),
    nth1(X9N, R, dancer),

    % 11
    nth1(X11, C, red),
    neighbor(X11, X11N),
    nth1(X11N, C, white),

    % 12
    nth1(X12, C, blue),
    nth1(X12, R, dasher),
    neighbor(X12, X12N),
    nth1(X12N, R, dancer),

    % 13
    nth1(X13, C, green),
    nth1(X13N, C, purple),
    nth1(X13N2, C, orange),
    between(X13, X13N, X13N2),

    rentiers(RTs), permutation(RTs,R),
    colors(CLs), permutation(CLs,C),

    writeln(R), writeln(C), nl,
    write('Rudoph has been found behind present No.'),
    nth1(Pos, R, rudolph),
    writeln(Pos), !.
