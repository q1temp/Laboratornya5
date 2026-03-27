min_max_digits(0, 0, 0).         
min_max_digits(N, N, N) :-       
    N >= 1, N < 10.
min_max_digits(N, Min, Max) :-
    N >= 10,
    D is N mod 10,
    N1 is N // 10,
    min_max_digits(N1, Min1, Max1),
    ( D < Min1 -> Min = D ; Min = Min1 ),
    ( D > Max1 -> Max = D ; Max = Max1 ).

go :-
    write('Enter a natural number (for example 123.): '), flush_output,
    read(N),
    min_max_digits(N, Min, Max),
    format('minimum figure: ~w~n maximum figure: ~w~n', [Min, Max]).
:- go.
	
	


