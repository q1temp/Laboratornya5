% Решение задачи о трех учителях
% Учителя: morozov, vasiliev, tokarev
% Предметы: history, math, biology, geography, english, french

go :-
    % Перебираем все возможные пары предметов для Морозова
    Predmety = [history, math, biology, geography, english, french],
    
    % Выбираем 2 предмета для Морозова
    member(M1, Predmety),
    member(M2, Predmety),
    M1 \= M2,
    delete(Predmety, M1, Pred1),
    delete(Pred1, M2, Ostalos),
    
    % Из оставшихся 4 выбираем 2 для Васильева
    member(V1, Ostalos),
    member(V2, Ostalos),
    V1 \= V2,
    delete(Ostalos, V1, Pred2),
    delete(Pred2, V2, TokarevPredmety),
    
    % Оставшиеся 2 - для Токарева
    [T1, T2] = TokarevPredmety,
    
    % Формируем списки
    Morozov = [M1, M2],
    Vasiliev = [V1, V2],
    Tokarev = [T1, T2],
    
    % Проверяем условия
    
    % Условие 1: географ и учитель французского - разные
    (member(geography, Morozov) -> G = morozov; 
     member(geography, Vasiliev) -> G = vasiliev; 
     G = tokarev),
    (member(french, Morozov) -> F = morozov; 
     member(french, Vasiliev) -> F = vasiliev; 
     F = tokarev),
    G \= F,
    
    % Условие 2: биолог старше математика, Морозов самый молодой
    (member(biology, Morozov) -> B = morozov; 
     member(biology, Vasiliev) -> B = vasiliev; 
     B = tokarev),
    (member(math, Morozov) -> M = morozov; 
     member(math, Vasiliev) -> M = vasiliev; 
     M = tokarev),
    B \= M,
    % Морозов самый молодой, поэтому он не может быть биологом
    B \= morozov,
    
    % Условие 3: Токарев, биолог и учитель французского - разные
    tokarev \= B,
    tokarev \= F,
    B \= F,
    
    % Условие 4: Морозов, математик и учитель английского - разные
    morozov \= M,
    (member(english, Morozov) -> E = morozov; 
     member(english, Vasiliev) -> E = vasiliev; 
     E = tokarev),
    E \= morozov,
    M \= E,
    
    % Выводим результат
    write('Morozov: '), write(Morozov), nl,
    write('Vasiliev: '), write(Vasiliev), nl,
    write('Tokarev: '), write(Tokarev), nl.

:- go.