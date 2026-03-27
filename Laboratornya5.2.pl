f([], 0) :- !.

f([H|T], Result) :-
    H < 0,
    abs(H) mod 2 =:= 1,
    !,
    f(T, TailResult),
    Result is TailResult + 1.

f([_|T], Result) :-
    f(T, Result).

run :-
    write('Enter a list of integers (for example, [1, -3, 2, -5, 4]): '),
    read(List),
    f(List, Res),
    write('Number of odd negative elements: '),
    write(Res).

:- run.