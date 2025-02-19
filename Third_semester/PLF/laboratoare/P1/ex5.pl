%A)
% elimin(L:lista, E:Integer, R:lista)
% Modele de flux (i, i, o),(i,i,i)
%L:lista inițială din care vrem sa stergem
%E:elementul pe care îl vrem șters
%R:lista fără elementul pe care dorim sa îl ștergem

elimin([], _, []).
elimin([H|T], E, R) :- H =:= E,
    elimin(T, E, R).
elimin([H|T], E, [H|R]) :- H =\= E,
    elimin(T, E, R).


%B)
% aparitii(L:lista, E:Integer, R:Integer)
% Modele de flux(i, i, o),(i,i,i)
%L:Lista din care vrem sa numărăm
%E:Elementul pe care vrem sa îl numărăm
%R:Nr de apariții ale elementului

aparitii([], _, 0).
aparitii([H|T], E, R) :- H =:= E,
    aparitii(T, E, R1),
    R is R1 + 1.
aparitii([H|T], E, R) :- H =\= E,
    aparitii(T, E, R).


% predicat(L:lista, R:lista)
% Modele de flux (i, o),(i,i)
%L:lista inițială
%R:lista după ce am prelucrat-o

pred([], []).
pred([H|T], [[H, RC]|R]) :-
    aparitii([H|T], H, RC),
    elimin(T, H, RR),
    pred(RR, R).

